-- Auto-detect ward from GPS
CREATE OR REPLACE FUNCTION detect_ward(p_lat FLOAT8, p_lng FLOAT8, p_city_id UUID)
RETURNS UUID AS $$
  SELECT id FROM wards
  WHERE city_id = p_city_id
    AND ST_Contains(boundary, ST_SetSRID(ST_MakePoint(p_lng, p_lat), 4326))
  LIMIT 1;
$$ LANGUAGE sql STABLE;

-- Nearby duplicate check (50m radius)
CREATE OR REPLACE FUNCTION find_nearby_reports(p_location GEOMETRY, p_category_id UUID, p_radius INT DEFAULT 50)
RETURNS SETOF reports AS $$
  SELECT * FROM reports
  WHERE category_id = p_category_id
    AND status NOT IN ('resolved', 'rejected')
    AND ST_DWithin(location::geography, p_location::geography, p_radius)
    AND created_at > now() - INTERVAL '30 days';
$$ LANGUAGE sql STABLE;

-- Rate limit (5/day per device)
CREATE OR REPLACE FUNCTION check_rate_limit(p_fingerprint TEXT, p_limit INT DEFAULT 5)
RETURNS BOOLEAN AS $$
  SELECT COUNT(*) < p_limit FROM reports
  WHERE device_fingerprint = p_fingerprint AND created_at > now() - INTERVAL '1 day';
$$ LANGUAGE sql STABLE;

-- Ward leaderboard
CREATE OR REPLACE FUNCTION ward_leaderboard(p_city_id UUID)
RETURNS TABLE(ward_id UUID, ward_name TEXT, ward_slug TEXT, total_reports BIGINT, open_reports BIGINT, resolved_reports BIGINT, avg_days NUMERIC) AS $$
  SELECT w.id, w.name, w.slug,
    COUNT(r.id),
    COUNT(r.id) FILTER (WHERE r.status NOT IN ('resolved','rejected')),
    COUNT(r.id) FILTER (WHERE r.status = 'resolved'),
    AVG(r.resolved_after_days) FILTER (WHERE r.resolved_after_days IS NOT NULL)
  FROM wards w LEFT JOIN reports r ON r.ward_id = w.id
  WHERE w.city_id = p_city_id
  GROUP BY w.id, w.name, w.slug ORDER BY COUNT(r.id) DESC;
$$ LANGUAGE sql STABLE;

-- Auto-increment upvote count via trigger
CREATE OR REPLACE FUNCTION update_upvote_count() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE reports SET upvote_count = upvote_count + 1 WHERE id = NEW.report_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE reports SET upvote_count = upvote_count - 1 WHERE id = OLD.report_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_upvote_count
AFTER INSERT OR DELETE ON upvotes
FOR EACH ROW EXECUTE FUNCTION update_upvote_count();
