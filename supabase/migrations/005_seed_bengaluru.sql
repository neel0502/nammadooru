-- City
INSERT INTO cities (name, slug, state) VALUES ('Bengaluru', 'bengaluru', 'Karnataka');

-- Parliamentary Constituencies
INSERT INTO parliamentary_constituencies (city_id, name, slug, mp_name, mp_party, mp_since)
SELECT id, 'Bangalore North', 'bangalore-north', 'Shobha Karandlaje', 'BJP', '2024' FROM cities WHERE slug = 'bengaluru';
INSERT INTO parliamentary_constituencies (city_id, name, slug, mp_name, mp_party, mp_since)
SELECT id, 'Bangalore Central', 'bangalore-central', 'P.C. Mohan', 'BJP', '2009' FROM cities WHERE slug = 'bengaluru';
INSERT INTO parliamentary_constituencies (city_id, name, slug, mp_name, mp_party, mp_since)
SELECT id, 'Bangalore South', 'bangalore-south', 'Tejasvi Surya', 'BJP', '2019' FROM cities WHERE slug = 'bengaluru';
INSERT INTO parliamentary_constituencies (city_id, name, slug, mp_name, mp_party, mp_since)
SELECT id, 'Bangalore Rural', 'bangalore-rural', 'Dr. C.N. Manjunath', 'BJP', '2024' FROM cities WHERE slug = 'bengaluru';
INSERT INTO parliamentary_constituencies (city_id, name, slug, mp_name, mp_party, mp_since)
SELECT id, 'Chikballapur', 'chikballapur', NULL, NULL, NULL FROM cities WHERE slug = 'bengaluru';

-- Assembly Constituency: Byatarayanapura
INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, mla_name, mla_party, mla_since, zone)
SELECT c.id, pc.id, 'Byatarayanapura', 'byatarayanapura', 152,
  'Krishna Byre Gowda', 'INC', '2008', 'North'
FROM cities c, parliamentary_constituencies pc
WHERE c.slug = 'bengaluru' AND pc.slug = 'bangalore-north';

-- Categories
INSERT INTO categories (city_id, name, slug, icon, color, severity_default, sort_order)
SELECT id, 'Garbage / Sanitation', 'garbage', '🗑️', '#dc2626', 'medium', 1 FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'Potholes / Roads', 'pothole', '🕳️', '#ea580c', 'high', 2 FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'Water Supply', 'water', '💧', '#2563eb', 'high', 3 FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'Streetlights', 'streetlight', '💡', '#ca8a04', 'medium', 4 FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'Drainage / Flooding', 'drainage', '🌊', '#0891b2', 'high', 5 FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'Encroachment', 'encroachment', '🚧', '#7c3aed', 'medium', 6 FROM cities WHERE slug = 'bengaluru';

-- Departments
INSERT INTO departments (city_id, name, short_name, helpline, whatsapp, categories)
SELECT id, 'BBMP Solid Waste Management', 'BBMP SWM', '1533', '9448197197', ARRAY['garbage'] FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'BWSSB', 'BWSSB', '1916', NULL, ARRAY['water', 'drainage'] FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'BESCOM', 'BESCOM', '1912', NULL, ARRAY['streetlight'] FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'BBMP Engineering', 'BBMP Eng', '1533', '9448197197', ARRAY['pothole'] FROM cities WHERE slug = 'bengaluru'
UNION ALL SELECT id, 'BDA / Revenue', 'BDA', NULL, NULL, ARRAY['encroachment'] FROM cities WHERE slug = 'bengaluru';
