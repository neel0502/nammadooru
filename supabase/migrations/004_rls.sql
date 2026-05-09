ALTER TABLE reports ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can view non-rejected reports" ON reports FOR SELECT USING (status != 'rejected');
CREATE POLICY "Anyone can submit reports" ON reports FOR INSERT WITH CHECK (true);

ALTER TABLE upvotes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can view upvotes" ON upvotes FOR SELECT USING (true);
CREATE POLICY "Anyone can upvote" ON upvotes FOR INSERT WITH CHECK (true);

ALTER TABLE wards ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON wards FOR SELECT USING (true);

ALTER TABLE assembly_constituencies ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON assembly_constituencies FOR SELECT USING (true);

ALTER TABLE parliamentary_constituencies ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON parliamentary_constituencies FOR SELECT USING (true);

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON categories FOR SELECT USING (true);

ALTER TABLE departments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON departments FOR SELECT USING (true);

ALTER TABLE cities ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read" ON cities FOR SELECT USING (true);
