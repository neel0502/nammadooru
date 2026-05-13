-- Seed 369 Wards


DO $$
DECLARE
  v_city_id UUID;
  v_pc_id UUID;
  v_ac_id UUID;
BEGIN
  SELECT id INTO v_city_id FROM cities WHERE slug = 'bengaluru' LIMIT 1;
  SELECT id INTO v_pc_id FROM parliamentary_constituencies WHERE city_id = v_city_id LIMIT 1;

  -- Create missing Assembly Constituencies

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Rajarajeshwarinagar', 'rajarajeshwarinagar', 154, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'yelahanka') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Yelahanka', 'yelahanka', 150, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'kr-pura') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'K.R. Pura', 'kr-pura', 151, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'hebbal') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Hebbal', 'hebbal', 158, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'byatarayanapura') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Byatarayanapura', 'byatarayanapura', 152, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'mahadevapura') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Mahadevapura', 'mahadevapura', 174, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'shanthinagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Shanthinagar', 'shanthinagar', 163, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'dasarahalli') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Dasarahalli', 'dasarahalli', 155, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'cv-raman-nagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'C.V. Raman Nagar', 'cv-raman-nagar', 161, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'sarvagnanagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Sarvagnanagar', 'sarvagnanagar', 160, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'padmanabanagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Padmanabanagar', 'padmanabanagar', 171, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'yeshwanthapura') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Yeshwanthapura', 'yeshwanthapura', 153, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'bangalore-south') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Bangalore South', 'bangalore-south', 176, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'chickpet') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Chickpet', 'chickpet', 169, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'jayanagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Jayanagar', 'jayanagar', 173, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'chamrajapet') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Chamrajapet', 'chamrajapet', 168, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'pulakeshinagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Pulakeshinagar', 'pulakeshinagar', 159, 'Zone1');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'gandhinagara') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Gandhinagara', 'gandhinagara', 164, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'bommanahalli') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Bommanahalli', 'bommanahalli', 175, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'shivajinagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Shivajinagar', 'shivajinagar', 162, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'malleshwaram') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Malleshwaram', 'malleshwaram', 157, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'govindraj-nagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Govindraj Nagar', 'govindraj-nagar', 166, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'btm-layout') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'B.T.M Layout', 'btm-layout', 172, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'anekal') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Anekal', 'anekal', 177, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'rajajinagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Rajajinagar', 'rajajinagar', 165, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'vijayanagar') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Vijayanagar', 'vijayanagar', 167, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'basavanagudi') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Basavanagudi', 'basavanagudi', 170, 'Zone2');
  END IF;

  IF NOT EXISTS (SELECT 1 FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout') THEN
    INSERT INTO assembly_constituencies (city_id, pc_id, name, slug, number, zone)
    VALUES (v_city_id, v_pc_id, 'Mahalakshmi Layout', 'mahalakshmi-layout', 156, 'Zone1');
  END IF;

  -- Create Wards

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '25-vinayaka-layout' OR ward_number = 25) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 25, '25 - Vinayaka Layout', '25-vinayaka-layout', 'West', 20170);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '2-aerocity' OR ward_number = 2) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 2, '2 - Aerocity', '2-aerocity', 'North', 20655);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '3-chowdeshwari-ward' OR ward_number = 3) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 3, '3 - Chowdeshwari ward', '3-chowdeshwari-ward', 'North', 26795);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '15-ramamurthy-nagara' OR ward_number = 15) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 15, '15 - Ramamurthy Nagara', '15-ramamurthy-nagara', 'East', 17257);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '58-nagashettyhalli' OR ward_number = 58) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 58, '58 - Nagashettyhalli', '58-nagashettyhalli', 'North', 23289);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '21-kogilu' OR ward_number = 21) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 21, '21 - Kogilu', '21-kogilu', 'North', 28728);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '46-yamalur' OR ward_number = 46) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 46, '46 - Yamalur', '46-yamalur', 'East', 17526);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '24-agaram' OR ward_number = 24) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 24, '24 - Agaram', '24-agaram', 'Central', 28081);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '72-dasarahalli' OR ward_number = 72) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 72, '72 - Dasarahalli', '72-dasarahalli', 'North', 29082);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '11-old-baiyappanahalli' OR ward_number = 11) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 11, '11 - Old Baiyappanahalli', '11-old-baiyappanahalli', 'Central', 18858);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '16-kotthur' OR ward_number = 16) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 16, '16 - Kotthur', '16-kotthur', 'East', 14653);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '69-bagalagunte' OR ward_number = 69) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 69, '69 - Bagalagunte', '69-bagalagunte', 'North', 28685);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '34-subbayanapalya' OR ward_number = 34) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 34, '34 - Subbayanapalya', '34-subbayanapalya', 'North', 22175);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '68-mallasandra' OR ward_number = 68) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 68, '68 - Mallasandra', '68-mallasandra', 'North', 26890);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '70-manjunatha-nagar' OR ward_number = 70) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 70, '70 - Manjunatha Nagar', '70-manjunatha-nagar', 'North', 27870);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '2-kadirenahalli' OR ward_number = 2) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 2, '2 - Kadirenahalli', '2-kadirenahalli', 'South', 19937);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '60-jalahalli' OR ward_number = 60) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 60, '60 - Jalahalli', '60-jalahalli', 'North', 23400);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '14-kr-pura' OR ward_number = 14) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 14, '14 - K.R Pura', '14-kr-pura', 'East', 14930);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '20-kengeri-kote-ward' OR ward_number = 20) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 20, '20 - Kengeri Kote ward', '20-kengeri-kote-ward', 'West', 19339);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '39-gottigere' OR ward_number = 39) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 39, '39 - Gottigere', '39-gottigere', 'South', 21839);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '36-beguru' OR ward_number = 36) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 36, '36 - Beguru', '36-beguru', 'South', 18605);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '41-vv-puram' OR ward_number = 41) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 41, '41 - V.V Puram', '41-vv-puram', 'Central', 19813);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '35-kammanahalli' OR ward_number = 35) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 35, '35 - Kammanahalli', '35-kammanahalli', 'North', 26646);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '7-byrasandra' OR ward_number = 7) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 7, '7 - Byrasandra', '7-byrasandra', 'South', 21108);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '8-tilak-nagara' OR ward_number = 8) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 8, '8 - Tilak Nagara', '8-tilak-nagara', 'South', 25625);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '63-jp-park' OR ward_number = 63) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 63, '63 - J.P PARK', '63-jp-park', 'North', 22172);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '51-old-guddadahalli' OR ward_number = 51) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 51, '51 - Old Guddadahalli', '51-old-guddadahalli', 'Central', 25228);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '4-babusab-palya' OR ward_number = 4) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 4, '4 - Babusab Palya', '4-babusab-palya', 'East', 19361);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '4-banashankari-temple-ward' OR ward_number = 4) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 4, '4 - Banashankari Temple Ward', '4-banashankari-temple-ward', 'South', 22549);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '71-nele-maheshwaramma-temple-ward' OR ward_number = 71) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 71, '71 - Nele Maheshwaramma Temple Ward', '71-nele-maheshwaramma-temple-ward', 'North', 27033);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '45-marathahalli' OR ward_number = 45) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 45, '45 - Marathahalli', '45-marathahalli', 'East', 17823);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '45-konanakunte' OR ward_number = 45) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 45, '45 - Konanakunte', '45-konanakunte', 'South', 20525);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '13-marenahalli-south' OR ward_number = 13) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 13, '13 - Marenahalli South', '13-marenahalli-south', 'South', 23458);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '44-harinagar' OR ward_number = 44) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 44, '44 - Harinagar', '44-harinagar', 'South', 21893);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '2-horamavu' OR ward_number = 2) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 2, '2 - Horamavu', '2-horamavu', 'East', 14756);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '50-dinnur' OR ward_number = 50) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 50, '50 - Dinnur', '50-dinnur', 'North', 27395);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '25-lb-shastri-nagar' OR ward_number = 25) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 25, '25 - L.B Shastri Nagar', '25-lb-shastri-nagar', 'East', 14946);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '66-kammagondanahalli' OR ward_number = 66) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 66, '66 - Kammagondanahalli', '66-kammagondanahalli', 'North', 20542);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '10-abdul-kalam-nagar' OR ward_number = 10) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 10, '10 - Abdul Kalam Nagar', '10-abdul-kalam-nagar', 'South', 23124);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '45-kushal-nagar' OR ward_number = 45) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 45, '45 - Kushal Nagar', '45-kushal-nagar', 'North', 19954);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '11-krishnanagar' OR ward_number = 11) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 11, '11 - Krishnanagar', '11-krishnanagar', 'East', 16000);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '43-bheereshwara-nagar' OR ward_number = 43) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 43, '43 - Bheereshwara Nagar', '43-bheereshwara-nagar', 'South', 26950);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '3-yarab-nagar' OR ward_number = 3) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 3, '3 - Yarab nagar', '3-yarab-nagar', 'South', 20832);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '42-rbi-layout' OR ward_number = 42) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 42, '42 - RBI Layout', '42-rbi-layout', 'South', 22569);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '1-k-narayanapura' OR ward_number = 1) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 1, '1 - K Narayanapura', '1-k-narayanapura', 'East', 15003);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '39-hagaduru' OR ward_number = 39) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 39, '39 - Hagaduru', '39-hagaduru', 'East', 15105);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '13-krishnaiahnapalya' OR ward_number = 13) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 13, '13 - Krishnaiahnapalya', '13-krishnaiahnapalya', 'Central', 19302);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '1-padmanabhanagara' OR ward_number = 1) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 1, '1 - Padmanabhanagara', '1-padmanabhanagara', 'South', 23419);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '48-vasanthapura' OR ward_number = 48) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 48, '48 - Vasanthapura', '48-vasanthapura', 'South', 22830);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '6-gowdanapalya' OR ward_number = 6) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 6, '6 - Gowdanapalya', '6-gowdanapalya', 'South', 24691);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '63-okalipuram' OR ward_number = 63) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 63, '63 - Okalipuram', '63-okalipuram', 'Central', 27815);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '5-kane-muneshwara-ward' OR ward_number = 5) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 5, '5 - Kane Muneshwara Ward', '5-kane-muneshwara-ward', 'South', 22022);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '9-hoysala-nagara-central' OR ward_number = 9) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 9, '9 - Hoysala Nagara Central', '9-hoysala-nagara-central', 'Central', 27798);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '52-talagattapura' OR ward_number = 52) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 52, '52 - Talagattapura', '52-talagattapura', 'South', 23797);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '50-sarvabhouma-nagar' OR ward_number = 50) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 50, '50 - Sarvabhouma Nagar', '50-sarvabhouma-nagar', 'South', 25256);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '25-govindapura' OR ward_number = 25) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 25, '25 - Govindapura', '25-govindapura', 'North', 21432);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '53-rayapuram' OR ward_number = 53) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 53, '53 - Rayapuram', '53-rayapuram', 'Central', 23438);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '40-anjanapura' OR ward_number = 40) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 40, '40 - Anjanapura', '40-anjanapura', 'South', 23865);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '59-vijaya-bank-layout' OR ward_number = 59) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 59, '59 - Vijaya Bank Layout', '59-vijaya-bank-layout', 'South', 27787);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '41-periyar-nagar' OR ward_number = 41) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 41, '41 - Periyar Nagar', '41-periyar-nagar', 'North', 19963);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '52-padarayanapura' OR ward_number = 52) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 52, '52 - Padarayanapura', '52-padarayanapura', 'Central', 25833);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '46-yelachenahalli' OR ward_number = 46) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 46, '46 - Yelachenahalli', '46-yelachenahalli', 'South', 23953);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '59-geddalahalli' OR ward_number = 59) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 59, '59 - Geddalahalli', '59-geddalahalli', 'North', 23331);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '51-subramanyapura' OR ward_number = 51) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 51, '51 - Subramanyapura', '51-subramanyapura', 'South', 27304);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '35-goraguntepalya' OR ward_number = 35) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 35, '35 - Goraguntepalya', '35-goraguntepalya', 'West', 21462);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '28-kottegepalya' OR ward_number = 28) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 28, '28 - Kottegepalya', '28-kottegepalya', 'West', 22872);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '62-brundavana-nagara' OR ward_number = 62) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 62, '62 - Brundavana Nagara', '62-brundavana-nagara', 'North', 28749);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '5-yelahanka-satellite-town' OR ward_number = 5) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 5, '5 - Yelahanka Satellite Town', '5-yelahanka-satellite-town', 'North', 29889);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '22-bangarappa-nagara' OR ward_number = 22) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 22, '22 - Bangarappa Nagara', '22-bangarappa-nagara', 'West', 28414);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '49-uttarahalli' OR ward_number = 49) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 49, '49 - Uttarahalli', '49-uttarahalli', 'South', 25302);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '64-yeshwanthpura' OR ward_number = 64) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 64, '64 - Yeshwanthpura', '64-yeshwanthpura', 'North', 20236);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '37-yelenahalli' OR ward_number = 37) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 37, '37 - Yelenahalli', '37-yelenahalli', 'South', 18609);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '17-kaggadasapura' OR ward_number = 17) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 17, '17 - Kaggadasapura', '17-kaggadasapura', 'Central', 20794);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '38-doddakammanahalli' OR ward_number = 38) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 38, '38 - Doddakammanahalli', '38-doddakammanahalli', 'South', 19891);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '28-byrathi' OR ward_number = 28) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 28, '28 - Byrathi', '28-byrathi', 'East', 13969);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '41-kothanur' OR ward_number = 41) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 41, '41 - Kothanur', '41-kothanur', 'South', 23161);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '19-ks-nissar-ahmed-ward' OR ward_number = 19) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 19, '19 - K.S. Nissar Ahmed Ward', '19-ks-nissar-ahmed-ward', 'East', 15446);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '57-bhoopasandra' OR ward_number = 57) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 57, '57 - Bhoopasandra', '57-bhoopasandra', 'North', 25193);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '15-shakambarinagara' OR ward_number = 15) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 15, '15 - Shakambarinagara', '15-shakambarinagara', 'South', 25845);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '56-hebbal' OR ward_number = 56) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 56, '56 - Hebbal', '56-hebbal', 'North', 27422);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '52-vishwanatha-nagenahalli' OR ward_number = 52) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 52, '52 - Vishwanatha Nagenahalli', '52-vishwanatha-nagenahalli', 'North', 28859);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '4-sampangirama-nagar' OR ward_number = 4) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 4, '4 - Sampangirama Nagar', '4-sampangirama-nagar', 'Central', 27874);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '10-basavanapura' OR ward_number = 10) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 10, '10 - Basavanapura', '10-basavanapura', 'East', 16224);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '35-vishwapriya-nagara' OR ward_number = 35) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 35, '35 - Vishwapriya Nagara', '35-vishwapriya-nagara', 'South', 19281);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '8-halasuru' OR ward_number = 8) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 8, '8 - Halasuru', '8-halasuru', 'Central', 24019);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '33-naganathapura' OR ward_number = 33) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 33, '33 - Naganathapura', '33-naganathapura', 'South', 18599);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '49-aramane-nagara' OR ward_number = 49) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 49, '49 - Aramane Nagara', '49-aramane-nagara', 'West', 26145);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '12-kasturi-nagar' OR ward_number = 12) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 12, '12 - Kasturi Nagar', '12-kasturi-nagar', 'Central', 19331);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '79-nagarbhavi' OR ward_number = 79) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 79, '79 - Nagarbhavi', '79-nagarbhavi', 'West', 28194);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '41-munnenkolalu' OR ward_number = 41) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 41, '41 - Munnenkolalu', '41-munnenkolalu', 'East', 20977);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '34-chikkathoguru' OR ward_number = 34) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 34, '34 - Chikkathoguru', '34-chikkathoguru', 'South', 18868);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '6-doddabettahalli' OR ward_number = 6) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 6, '6 - Doddabettahalli', '6-doddabettahalli', 'North', 29553);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '55-ganganagar' OR ward_number = 55) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 55, '55 - Ganganagar', '55-ganganagar', 'North', 25186);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '17-vijinapura' OR ward_number = 17) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 17, '17 - Vijinapura', '17-vijinapura', 'East', 15133);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '49-kasturbha-nagar' OR ward_number = 49) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 49, '49 - Kasturbha Nagar', '49-kasturbha-nagar', 'Central', 24488);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '1-raja-kempegowda-ward' OR ward_number = 1) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 1, '1 - Raja Kempegowda ward', '1-raja-kempegowda-ward', 'North', 21561);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '11-jayanagar-east' OR ward_number = 11) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 11, '11 - Jayanagar East', '11-jayanagar-east', 'South', 22697);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '33-dharmaraya-swamy-temple-ward' OR ward_number = 33) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 33, '33 - Dharmaraya Swamy Temple Ward', '33-dharmaraya-swamy-temple-ward', 'Central', 18905);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '38-kanakanapalya' OR ward_number = 38) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 38, '38 - Kanakanapalya', '38-kanakanapalya', 'Central', 20054);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '62-swatantra-palya-ward' OR ward_number = 62) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 62, '62 - Swatantra Palya Ward', '62-swatantra-palya-ward', 'Central', 28137);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '54-gangenahalli' OR ward_number = 54) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 54, '54 - Gangenahalli', '54-gangenahalli', 'North', 24120);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '14-jp-nagar' OR ward_number = 14) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 14, '14 - J.P Nagar', '14-jp-nagar', 'South', 22264);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '9-nal-layout' OR ward_number = 9) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 9, '9 - N.A.L Layout', '9-nal-layout', 'South', 20532);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '27-sri-lakshmi-devi-ward' OR ward_number = 27) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 27, '27 - Sri Lakshmi Devi Ward', '27-sri-lakshmi-devi-ward', 'South', 19844);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '4-nyayanga-badavane' OR ward_number = 4) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 4, '4 - Nyayanga Badavane', '4-nyayanga-badavane', 'North', 20006);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '65-abbigere' OR ward_number = 65) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 65, '65 - Abbigere', '65-abbigere', 'North', 21241);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '18-viswamanava-kuvempu-ward' OR ward_number = 18) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 18, '18 - Viswamanava Kuvempu Ward', '18-viswamanava-kuvempu-ward', 'South', 25500);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '42-priyadarshini-ward' OR ward_number = 42) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 42, '42 - Priyadarshini Ward', '42-priyadarshini-ward', 'East', 16847);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '67-shettihalli' OR ward_number = 67) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 67, '67 - Shettihalli', '67-shettihalli', 'North', 23313);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '21-chikka-adugodi' OR ward_number = 21) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 21, '21 - Chikka Adugodi', '21-chikka-adugodi', 'South', 21468);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yelahanka' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '7-attur' OR ward_number = 7) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 7, '7 - Attur', '7-attur', 'North', 26922);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '19-new-tavarekere' OR ward_number = 19) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 19, '19 - New Tavarekere', '19-new-tavarekere', 'South', 19251);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '70-iblur' OR ward_number = 70) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 70, '70 - Iblur', '70-iblur', 'South', 27146);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '61-hmt-ward' OR ward_number = 61) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 61, '61 - HMT Ward', '61-hmt-ward', 'North', 29538);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '51-manorayanapalya' OR ward_number = 51) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 51, '51 - Manorayanapalya', '51-manorayanapalya', 'North', 23684);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '65-garvebavi-palya' OR ward_number = 65) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 65, '65 - Garvebavi Palya', '65-garvebavi-palya', 'South', 22967);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'anekal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '32-kudlu' OR ward_number = 32) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 32, '32 - Kudlu', '32-kudlu', 'South', 16661);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '25-national-games-village' OR ward_number = 25) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 25, '25 - National Games Village', '25-national-games-village', 'South', 19407);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '16-amruthahalli' OR ward_number = 16) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 16, '16 - Amruthahalli', '16-amruthahalli', 'North', 21732);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '22-sg-palya' OR ward_number = 22) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 22, '22 - S.G Palya', '22-sg-palya', 'South', 21440);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '32-banaswadi' OR ward_number = 32) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 32, '32 - Banaswadi', '32-banaswadi', 'North', 25077);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '36-someshwara-nagara' OR ward_number = 36) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 36, '36 - Someshwara Nagara', '36-someshwara-nagara', 'Central', 18863);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '12-pattabhirama-nagara' OR ward_number = 12) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 12, '12 - Pattabhirama Nagara', '12-pattabhirama-nagara', 'South', 22547);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '49-jaya-chamarajendra-nagara' OR ward_number = 49) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 49, '49 - Jaya Chamarajendra Nagara', '49-jaya-chamarajendra-nagara', 'North', 25953);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '71-agara' OR ward_number = 71) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 71, '71 - Agara', '71-agara', 'South', 18836);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '23-lakkasandra' OR ward_number = 23) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 23, '23 - Lakkasandra', '23-lakkasandra', 'South', 20932);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '27-ambedkarnagar' OR ward_number = 27) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 27, '27 - Ambedkarnagar', '27-ambedkarnagar', 'Central', 27816);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '13-kodigehalli' OR ward_number = 13) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 13, '13 - Kodigehalli', '13-kodigehalli', 'North', 28244);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '33-lakshmi-devi-nagar' OR ward_number = 33) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 33, '33 - Lakshmi Devi Nagar', '33-lakshmi-devi-nagar', 'West', 24599);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '37-jeevanahalli' OR ward_number = 37) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 37, '37 - Jeevanahalli', '37-jeevanahalli', 'North', 28142);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '31-kasavanahalli' OR ward_number = 31) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 31, '31 - Kasavanahalli', '31-kasavanahalli', 'South', 21288);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '39-kaval-byrasandra' OR ward_number = 39) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 39, '39 - Kaval Byrasandra', '39-kaval-byrasandra', 'North', 21965);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '17-ns-palya' OR ward_number = 17) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 17, '17 - N.S Palya', '17-ns-palya', 'South', 26701);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '55-puttenahalli' OR ward_number = 55) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 55, '55 - Puttenahalli', '55-puttenahalli', 'South', 21484);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '56-doresanipalya' OR ward_number = 56) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 56, '56 - Doresanipalya', '56-doresanipalya', 'South', 23059);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '42-aruna-asif-ali-ward' OR ward_number = 42) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 42, '42 - Aruna Asif Ali Ward', '42-aruna-asif-ali-ward', 'North', 29461);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'hebbal' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '53-rt-nagar' OR ward_number = 53) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 53, '53 - R.T Nagar', '53-rt-nagar', 'North', 29905);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '47-pulakeshi-nagar' OR ward_number = 47) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 47, '47 - Pulakeshi Nagar', '47-pulakeshi-nagar', 'North', 21148);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '15-byatarayanapura' OR ward_number = 15) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 15, '15 - Byatarayanapura', '15-byatarayanapura', 'North', 28870);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '28-kormangala-east' OR ward_number = 28) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 28, '28 - Kormangala East', '28-kormangala-east', 'South', 22885);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '46-sagayapuram' OR ward_number = 46) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 46, '46 - Sagayapuram', '46-sagayapuram', 'North', 28588);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '24-hbr-layout' OR ward_number = 24) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 24, '24 - HBR Layout', '24-hbr-layout', 'North', 20380);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '48-sk-garden' OR ward_number = 48) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 48, '48 - S.K Garden', '48-sk-garden', 'North', 20102);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '14-rajiv-gandhi-nagar' OR ward_number = 14) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 14, '14 - Rajiv Gandhi Nagar', '14-rajiv-gandhi-nagar', 'North', 20148);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '28-venkateshpuram' OR ward_number = 28) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 28, '28 - Venkateshpuram', '28-venkateshpuram', 'North', 22028);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '36-maruthi-seva-nagara' OR ward_number = 36) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 36, '36 - Maruthi Seva Nagara', '36-maruthi-seva-nagara', 'North', 24347);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '50-jjr-nagara' OR ward_number = 50) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 50, '50 - JJR Nagara', '50-jjr-nagara', 'Central', 27850);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '64-hongasandra' OR ward_number = 64) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 64, '64 - Hongasandra', '64-hongasandra', 'South', 27790);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '66-singasandra' OR ward_number = 66) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 66, '66 - Singasandra', '66-singasandra', 'South', 19089);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '67-bandepalya' OR ward_number = 67) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 67, '67 - Bandepalya', '67-bandepalya', 'South', 19744);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '38-shampura' OR ward_number = 38) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 38, '38 - Shampura', '38-shampura', 'North', 21846);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '22-nagavara' OR ward_number = 22) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 22, '22 - Nagavara', '22-nagavara', 'North', 20153);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '23-hennur' OR ward_number = 23) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 23, '23 - Hennur', '23-hennur', 'North', 21706);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '34-dv-gundappa-ward' OR ward_number = 34) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 34, '34 - D.V Gundappa Ward', '34-dv-gundappa-ward', 'Central', 20279);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '26-ejipura' OR ward_number = 26) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 26, '26 - Ejipura', '26-ejipura', 'South', 22239);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '44-doddanna-nagar' OR ward_number = 44) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 44, '44 - Doddanna Nagar', '44-doddanna-nagar', 'North', 29566);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '8-singapura' OR ward_number = 8) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 8, '8 - Singapura', '8-singapura', 'North', 24794);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '10-cox-town' OR ward_number = 10) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 10, '10 - Cox Town', '10-cox-town', 'Central', 21026);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '72-hsr-layout' OR ward_number = 72) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 72, '72 - HSR Layout', '72-hsr-layout', 'South', 18787);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '65-manjunath-nagara' OR ward_number = 65) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 65, '65 - Manjunath Nagara', '65-manjunath-nagara', 'West', 20584);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '10-vidyaranyapura' OR ward_number = 10) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 10, '10 - Vidyaranyapura', '10-vidyaranyapura', 'North', 24887);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '61-kodi-chikkanahalli' OR ward_number = 61) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 61, '61 - Kodi Chikkanahalli', '61-kodi-chikkanahalli', 'South', 27784);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '60-bilekahalli' OR ward_number = 60) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 60, '60 - Bilekahalli', '60-bilekahalli', 'South', 25208);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '29-lingarajpura' OR ward_number = 29) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 29, '29 - Lingarajpura', '29-lingarajpura', 'North', 26438);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '33-hrbr-layout' OR ward_number = 33) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 33, '33 - HRBR Layout', '33-hrbr-layout', 'North', 24637);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '30-kacharakanahalli' OR ward_number = 30) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 30, '30 - Kacharakanahalli', '30-kacharakanahalli', 'North', 21873);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '30-vinayakanagar' OR ward_number = 30) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 30, '30 - Vinayakanagar', '30-vinayakanagar', 'Central', 21367);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '66-sane-guruvana-halli' OR ward_number = 66) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 66, '66 - Sane Guruvana Halli', '66-sane-guruvana-halli', 'West', 20561);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '53-jaraganahalli' OR ward_number = 53) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 53, '53 - Jaraganahalli', '53-jaraganahalli', 'South', 22646);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '24-a-adugodi' OR ward_number = 24) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 24, '24 - A Adugodi', '24-a-adugodi', 'South', 21458);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '77-maruthi-mandira-ward' OR ward_number = 77) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 77, '77 - Maruthi Mandira Ward', '77-maruthi-mandira-ward', 'West', 21251);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '71-thimmenahalli' OR ward_number = 71) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 71, '71 - Thimmenahalli', '71-thimmenahalli', 'West', 23837);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '31-shanthinagar' OR ward_number = 31) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 31, '31 - Shanthinagar', '31-shanthinagar', 'Central', 24474);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '29-kormangala-west' OR ward_number = 29) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 29, '29 - Kormangala West', '29-kormangala-west', 'South', 27879);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '54-kengal-hanumanthaiah-south' OR ward_number = 54) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 54, '54 - Kengal Hanumanthaiah South', '54-kengal-hanumanthaiah-south', 'South', 25484);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '20-madiwala' OR ward_number = 20) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 20, '20 - Madiwala', '20-madiwala', 'South', 25538);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '48-mathikere' OR ward_number = 48) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 48, '48 - Mathikere', '48-mathikere', 'West', 26058);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '62-devarachikkanahalli' OR ward_number = 62) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 62, '62 - Devarachikkanahalli', '62-devarachikkanahalli', 'South', 24847);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '34-peenya' OR ward_number = 34) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 34, '34 - Peenya', '34-peenya', 'West', 26003);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '7-rajagopala-nagara' OR ward_number = 7) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 7, '7 - Rajagopala Nagara', '7-rajagopala-nagara', 'West', 24944);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '18-kempapura' OR ward_number = 18) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 18, '18 - Kempapura', '18-kempapura', 'North', 28936);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '93-avalahalli' OR ward_number = 93) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 93, '93 - Avalahalli', '93-avalahalli', 'West', 24326);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '87-kp-agrahara' OR ward_number = 87) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 87, '87 - K.P Agrahara', '87-kp-agrahara', 'West', 23555);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '43-varalakshmi-nagar' OR ward_number = 43) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 43, '43 - Varalakshmi Nagar', '43-varalakshmi-nagar', 'North', 26578);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '88-sangolli-rayanna-ward' OR ward_number = 88) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 88, '88 - Sangolli Rayanna Ward', '88-sangolli-rayanna-ward', 'West', 26299);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '20-sampigehalli' OR ward_number = 20) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 20, '20 - Sampigehalli', '20-sampigehalli', 'North', 28461);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '57-hulimavu' OR ward_number = 57) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 57, '57 - Hulimavu', '57-hulimavu', 'South', 19598);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '12-thindlu' OR ward_number = 12) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 12, '12 - Thindlu', '12-thindlu', 'North', 24289);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '21-uday-nagar' OR ward_number = 21) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 21, '21 - Uday Nagar', '21-uday-nagar', 'East', 20262);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '9-srigandhanagar' OR ward_number = 9) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 9, '9 - Srigandhanagar', '9-srigandhanagar', 'West', 22361);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '102-hanumanthanagar' OR ward_number = 102) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 102, '102 - Hanumanthanagar', '102-hanumanthanagar', 'West', 24583);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '19-thanisandra' OR ward_number = 19) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 19, '19 - Thanisandra', '19-thanisandra', 'North', 28159);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '17-jakkur' OR ward_number = 17) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 17, '17 - Jakkur', '17-jakkur', 'North', 28519);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '54-subedarpalya' OR ward_number = 54) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 54, '54 - Subedarpalya', '54-subedarpalya', 'West', 24829);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '3-nelagadaranahalli' OR ward_number = 3) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 3, '3 - Nelagadaranahalli', '3-nelagadaranahalli', 'West', 22738);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '9-kuvempunagara' OR ward_number = 9) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 9, '9 - Kuvempunagara', '9-kuvempunagara', 'North', 25815);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bangalore-south' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '47-chandranagara' OR ward_number = 47) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 47, '47 - Chandranagara', '47-chandranagara', 'South', 22054);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '5-hoysala-nagara-east' OR ward_number = 5) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 5, '5 - Hoysala Nagara East', '5-hoysala-nagara-east', 'East', 18244);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '58-dayanand-nagara' OR ward_number = 58) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 58, '58 - Dayanand Nagara', '58-dayanand-nagara', 'West', 21165);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'byatarayanapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '11-doddabommasandra' OR ward_number = 11) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 11, '11 - Doddabommasandra', '11-doddabommasandra', 'North', 25941);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '8-anandapura' OR ward_number = 8) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 8, '8 - Anandapura', '8-anandapura', 'East', 18898);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '72-kaveripura' OR ward_number = 72) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 72, '72 - Kaveripura', '72-kaveripura', 'West', 22300);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '58-arakere' OR ward_number = 58) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 58, '58 - Arakere', '58-arakere', 'South', 18995);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '47-bellanduru' OR ward_number = 47) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 47, '47 - Bellanduru', '47-bellanduru', 'East', 16685);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '20-a-narayanapura' OR ward_number = 20) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 20, '20 - A Narayanapura', '20-a-narayanapura', 'East', 21640);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '27-vibhootipura' OR ward_number = 27) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 27, '27 - Vibhootipura', '27-vibhootipura', 'East', 16475);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '33-sm-krishna-ward' OR ward_number = 33) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 33, '33 - S.M Krishna Ward', '33-sm-krishna-ward', 'East', 16262);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '29-chowdeshwari-nagar' OR ward_number = 29) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 29, '29 - Chowdeshwari Nagar', '29-chowdeshwari-nagar', 'West', 24455);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '49-shivanasamudra-ward' OR ward_number = 49) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 49, '49 - Shivanasamudra Ward', '49-shivanasamudra-ward', 'East', 15012);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '18-dooravaninagar' OR ward_number = 18) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 18, '18 - Dooravaninagar', '18-dooravaninagar', 'East', 14677);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '68-mangammana-palya' OR ward_number = 68) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 68, '68 - Mangammana Palya', '68-mangammana-palya', 'South', 23783);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'jayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '16-sarakki' OR ward_number = 16) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 16, '16 - Sarakki', '16-sarakki', 'South', 23257);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '29-hoodi' OR ward_number = 29) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 29, '29 - Hoodi', '29-hoodi', 'East', 20699);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '19-jeevan-bhimanagar' OR ward_number = 19) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 19, '19 - Jeevan Bhimanagar', '19-jeevan-bhimanagar', 'Central', 27299);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '38-nandini-layout' OR ward_number = 38) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 38, '38 - Nandini Layout', '38-nandini-layout', 'West', 19639);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '69-hosapalya' OR ward_number = 69) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 69, '69 - Hosapalya', '69-hosapalya', 'South', 18834);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '57-kuvempu-ward' OR ward_number = 57) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 57, '57 - Kuvempu Ward', '57-kuvempu-ward', 'West', 24283);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '23-sangama-ward' OR ward_number = 23) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 23, '23 - Sangama Ward', '23-sangama-ward', 'East', 15835);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '32-channasandra' OR ward_number = 32) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 32, '32 - Channasandra', '32-channasandra', 'East', 14621);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '81-nayanda-halli' OR ward_number = 81) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 81, '81 - Nayanda Halli', '81-nayanda-halli', 'West', 25982);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '73-dr-vishnuvardhan-ward' OR ward_number = 73) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 73, '73 - Dr. Vishnuvardhan Ward', '73-dr-vishnuvardhan-ward', 'West', 21949);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '107-dharmagiri-ward' OR ward_number = 107) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 107, '107 - Dharmagiri Ward', '107-dharmagiri-ward', 'West', 19154);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '27-srigandada-kaval' OR ward_number = 27) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 27, '27 - Srigandada Kaval', '27-srigandada-kaval', 'West', 25652);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '58-chickpete' OR ward_number = 58) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 58, '58 - Chickpete', '58-chickpete', 'Central', 27619);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '31-kadugodi' OR ward_number = 31) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 31, '31 - Kadugodi', '31-kadugodi', 'East', 18927);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '40-varthur' OR ward_number = 40) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 40, '40 - Varthur', '40-varthur', 'East', 20908);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '69-agrahara-dasarahalli' OR ward_number = 69) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 69, '69 - Agrahara Dasarahalli', '69-agrahara-dasarahalli', 'West', 24742);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '36-bharath-aikya-ward' OR ward_number = 36) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 36, '36 - Bharath Aikya Ward', '36-bharath-aikya-ward', 'East', 19498);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '35-garudachar-palya' OR ward_number = 35) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 35, '35 - Garudachar Palya', '35-garudachar-palya', 'East', 20983);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '26-vannarpet' OR ward_number = 26) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 26, '26 - Vannarpet', '26-vannarpet', 'Central', 22858);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '86-vidyaranyanagara' OR ward_number = 86) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 86, '86 - Vidyaranyanagara', '86-vidyaranyanagara', 'West', 28411);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '37-kundalahalli' OR ward_number = 37) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 37, '37 - Kundalahalli', '37-kundalahalli', 'East', 18217);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '34-kaveri-nagara' OR ward_number = 34) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 34, '34 - Kaveri Nagara', '34-kaveri-nagara', 'East', 20959);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '28-neelasandra' OR ward_number = 28) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 28, '28 - Neelasandra', '28-neelasandra', 'Central', 24853);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '22-mahadevapura' OR ward_number = 22) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 22, '22 - Mahadevapura', '22-mahadevapura', 'East', 17381);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '55-bhuvaneshwari-nagar' OR ward_number = 55) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 55, '55 - Bhuvaneshwari Nagar', '55-bhuvaneshwari-nagar', 'Central', 19936);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '38-whitefield' OR ward_number = 38) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 38, '38 - Whitefield', '38-whitefield', 'East', 20265);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'btm-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '30-jakkasandra' OR ward_number = 30) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 30, '30 - Jakkasandra', '30-jakkasandra', 'South', 25594);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '50-gunjur' OR ward_number = 50) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 50, '50 - Gunjur', '50-gunjur', 'East', 15085);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '13-rajarajeshwari-temple-ward' OR ward_number = 13) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 13, '13 - Rajarajeshwari Temple ward', '13-rajarajeshwari-temple-ward', 'East', 17539);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '43-dodda-nekkundi' OR ward_number = 43) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 43, '43 - Dodda Nekkundi', '43-dodda-nekkundi', 'East', 16961);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '9-bhattarahalli' OR ward_number = 9) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 9, '9 - Bhattarahalli', '9-bhattarahalli', 'East', 14911);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '4-parvathi-nagar' OR ward_number = 4) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 4, '4 - Parvathi Nagar', '4-parvathi-nagar', 'West', 20312);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '26-jagadish-nagar' OR ward_number = 26) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 26, '26 - Jagadish Nagar', '26-jagadish-nagar', 'East', 18479);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '20-kodihalli' OR ward_number = 20) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 20, '20 - Kodihalli', '20-kodihalli', 'Central', 24057);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '12-devasandra' OR ward_number = 12) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 12, '12 - Devasandra', '12-devasandra', 'East', 14990);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'bommanahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '63-bommanahalli' OR ward_number = 63) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 63, '63 - Bommanahalli', '63-bommanahalli', 'South', 26792);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '3-chellakere' OR ward_number = 3) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 3, '3 - Chellakere', '3-chellakere', 'East', 17010);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '26-mallathahalli' OR ward_number = 26) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 26, '26 - Mallathahalli', '26-mallathahalli', 'West', 21575);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '44-ashwath-nagar' OR ward_number = 44) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 44, '44 - Ashwath Nagar', '44-ashwath-nagar', 'East', 15851);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '30-belathur' OR ward_number = 30) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 30, '30 - Belathur', '30-belathur', 'East', 20869);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahadevapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '48-panathur' OR ward_number = 48) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 48, '48 - Panathur', '48-panathur', 'East', 14766);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '41-nagapura' OR ward_number = 41) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 41, '41 - Nagapura', '41-nagapura', 'West', 26591);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '6-kalkere' OR ward_number = 6) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 6, '6 - Kalkere', '6-kalkere', 'East', 17359);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '29-austin-town' OR ward_number = 29) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 29, '29 - Austin Town', '29-austin-town', 'Central', 19730);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '7-k-chennasandra' OR ward_number = 7) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 7, '7 - K Chennasandra', '7-k-chennasandra', 'East', 14572);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '1-ramaswamy-palya' OR ward_number = 1) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 1, '1 - Ramaswamy Palya', '1-ramaswamy-palya', 'Central', 26124);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'kr-pura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '24-vignananagara' OR ward_number = 24) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 24, '24 - Vignananagara', '24-vignananagara', 'East', 14649);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '46-cheluvadi-palya' OR ward_number = 46) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 46, '46 - Cheluvadi Palya', '46-cheluvadi-palya', 'Central', 21019);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '43-devaraj-urs-ward' OR ward_number = 43) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 43, '43 - Devaraj Urs Ward', '43-devaraj-urs-ward', 'Central', 19525);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '15-byadarahalli' OR ward_number = 15) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 15, '15 - Byadarahalli', '15-byadarahalli', 'West', 22784);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '5-shivajinagar' OR ward_number = 5) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 5, '5 - Shivajinagar', '5-shivajinagar', 'Central', 25484);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '23-jogpalya' OR ward_number = 23) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 23, '23 - Jogpalya', '23-jogpalya', 'Central', 25803);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '14-nagavarapalya' OR ward_number = 14) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 14, '14 - Nagavarapalya', '14-nagavarapalya', 'Central', 24875);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '60-prakash-nagara' OR ward_number = 60) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 60, '60 - Prakash Nagara', '60-prakash-nagara', 'West', 19859);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '35-hombegowda-nagara' OR ward_number = 35) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 35, '35 - Hombegowda Nagara', '35-hombegowda-nagara', 'Central', 18866);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '7-k-kamaraj-ward' OR ward_number = 7) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 7, '7 - K Kamaraj Ward', '7-k-kamaraj-ward', 'Central', 23193);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '40-ashoka-pillar' OR ward_number = 40) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 40, '40 - Ashoka Pillar', '40-ashoka-pillar', 'Central', 18989);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '37-bhel-ward' OR ward_number = 37) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 37, '37 - BHEL Ward', '37-bhel-ward', 'Central', 19336);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '45-kr-market' OR ward_number = 45) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 45, '45 - K.R Market', '45-kr-market', 'Central', 22413);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '23-rajarajeshwari-nagara' OR ward_number = 23) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 23, '23 - Rajarajeshwari Nagara', '23-rajarajeshwari-nagara', 'West', 26050);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '6-bharathi-nagar' OR ward_number = 6) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 6, '6 - Bharathi Nagar', '6-bharathi-nagar', 'Central', 24220);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '22-domluru' OR ward_number = 22) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 22, '22 - Domluru', '22-domluru', 'Central', 19982);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '60-seshadripuram' OR ward_number = 60) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 60, '60 - Seshadripuram', '60-seshadripuram', 'Central', 19052);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '39-venkat-reddy-nagara' OR ward_number = 39) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 39, '39 - Venkat Reddy Nagara', '39-venkat-reddy-nagara', 'Central', 18888);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shanthinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '25-ashokanagar' OR ward_number = 25) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 25, '25 - Ashokanagar', '25-ashokanagar', 'Central', 21804);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '97-srinivasa-nagara' OR ward_number = 97) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 97, '97 - Srinivasa Nagara', '97-srinivasa-nagara', 'West', 25716);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '70-dr-rajkumar-ward' OR ward_number = 70) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 70, '70 - Dr Rajkumar Ward', '70-dr-rajkumar-ward', 'West', 24106);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '52-kodandarampura' OR ward_number = 52) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 52, '52 - Kodandarampura', '52-kodandarampura', 'West', 18962);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '14-herohalli' OR ward_number = 14) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 14, '14 - Herohalli', '14-herohalli', 'West', 28413);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '59-bandi-reddy-circle-ward' OR ward_number = 59) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 59, '59 - Bandi Reddy Circle Ward', '59-bandi-reddy-circle-ward', 'West', 21286);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '12-andrahalli' OR ward_number = 12) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 12, '12 - Andrahalli', '12-andrahalli', 'West', 27694);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '82-attigupe' OR ward_number = 82) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 82, '82 - Attigupe', '82-attigupe', 'West', 24614);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '61-dattatreya-ward' OR ward_number = 61) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 61, '61 - Dattatreya Ward', '61-dattatreya-ward', 'Central', 19627);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '89-bapuji-nagara' OR ward_number = 89) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 89, '89 - Bapuji Nagara', '89-bapuji-nagara', 'West', 20625);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '80-chandra-layout' OR ward_number = 80) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 80, '80 - Chandra Layout', '80-chandra-layout', 'West', 26205);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '95-swamy-vivekananda-ward' OR ward_number = 95) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 95, '95 - Swamy Vivekananda Ward', '95-swamy-vivekananda-ward', 'West', 28152);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '42-sunkenahalli' OR ward_number = 42) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 42, '42 - Sunkenahalli', '42-sunkenahalli', 'Central', 21179);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chickpet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '32-silverjubilee-park-ward' OR ward_number = 32) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 32, '32 - SilverJubilee Park Ward', '32-silverjubilee-park-ward', 'Central', 18858);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '83-hampi-nagar' OR ward_number = 83) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 83, '83 - Hampi Nagar', '83-hampi-nagar', 'West', 23420);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '63-rajajinagara' OR ward_number = 63) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 63, '63 - Rajajinagara', '63-rajajinagara', 'West', 19632);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '21-kengeri' OR ward_number = 21) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 21, '21 - Kengeri', '21-kengeri', 'West', 21835);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '5-rajeshwarinagar' OR ward_number = 5) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 5, '5 - Rajeshwarinagar', '5-rajeshwarinagar', 'West', 25418);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '68-kamakshipalya' OR ward_number = 68) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 68, '68 - Kamakshipalya', '68-kamakshipalya', 'West', 25024);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '44-chamarajpet' OR ward_number = 44) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 44, '44 - Chamarajpet', '44-chamarajpet', 'Central', 25619);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '15-indiranagar' OR ward_number = 15) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 15, '15 - Indiranagar', '15-indiranagar', 'Central', 19324);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '3-vasanth-nagar' OR ward_number = 3) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 3, '3 - Vasanth Nagar', '3-vasanth-nagar', 'Central', 28272);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '19-shivanapalya' OR ward_number = 19) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 19, '19 - Shivanapalya', '19-shivanapalya', 'West', 21903);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '56-gayathri-nagara' OR ward_number = 56) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 56, '56 - Gayathri Nagara', '56-gayathri-nagara', 'West', 26978);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '92-muneshwara-block' OR ward_number = 92) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 92, '92 - Muneshwara Block', '92-muneshwara-block', 'West', 19922);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '18-gm-palya' OR ward_number = 18) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 18, '18 - G.M Palya', '18-gm-palya', 'Central', 20579);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '18-kengal-hanumanthaiah-west' OR ward_number = 18) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 18, '18 - Kengal Hanumanthaiah West', '18-kengal-hanumanthaiah-west', 'West', 21223);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '55-subramanyanagara' OR ward_number = 55) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 55, '55 - Subramanyanagara', '55-subramanyanagara', 'West', 27312);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '16-new-thippasandra' OR ward_number = 16) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 16, '16 - New Thippasandra', '16-new-thippasandra', 'Central', 27969);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '13-nada-prabhu-kempegowda-nagara' OR ward_number = 13) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 13, '13 - Nada prabhu Kempegowda Nagara', '13-nada-prabhu-kempegowda-nagara', 'West', 27225);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '24-jnana-bharathi-ward' OR ward_number = 24) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 24, '24 - Jnana Bharathi Ward', '24-jnana-bharathi-ward', 'West', 20533);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'cv-raman-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '21-konena-agrahara' OR ward_number = 21) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 21, '21 - Konena Agrahara', '21-konena-agrahara', 'Central', 26714);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'shivajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '2-jayamahal' OR ward_number = 2) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 2, '2 - Jayamahal', '2-jayamahal', 'Central', 25834);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '59-nehru-nagar' OR ward_number = 59) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 59, '59 - Nehru Nagar', '59-nehru-nagar', 'Central', 25780);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '16-ullal' OR ward_number = 16) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 16, '16 - Ullal', '16-ullal', 'West', 22549);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '64-shivanagara' OR ward_number = 64) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 64, '64 - Shivanagara', '64-shivanagara', 'West', 20472);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '90-krishnadevaraya-ward' OR ward_number = 90) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 90, '90 - Krishnadevaraya ward', '90-krishnadevaraya-ward', 'West', 28148);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'pulakeshinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '40-shakthi-nagar' OR ward_number = 40) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 40, '40 - Shakthi Nagar', '40-shakthi-nagar', 'North', 20035);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '10-sunkadakatte' OR ward_number = 10) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 10, '10 - Sunkadakatte', '10-sunkadakatte', 'West', 23123);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '27-kghalli' OR ward_number = 27) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 27, '27 - K.G.Halli', '27-kghalli', 'North', 28238);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '51-rajamahal' OR ward_number = 51) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 51, '51 - Rajamahal', '51-rajamahal', 'West', 24705);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '2-chokkasandra' OR ward_number = 2) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 2, '2 - Chokkasandra', '2-chokkasandra', 'West', 27117);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '31-freedom-fighter-ward' OR ward_number = 31) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 31, '31 - Freedom Fighter Ward', '31-freedom-fighter-ward', 'West', 18985);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '31-kalyan-nagar' OR ward_number = 31) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 31, '31 - Kalyan Nagar', '31-kalyan-nagar', 'North', 23746);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '112-hosakerehalli' OR ward_number = 112) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 112, '112 - Hosakerehalli', '112-hosakerehalli', 'West', 23619);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '11-dodda-bidarakallu' OR ward_number = 11) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 11, '11 - Dodda Bidarakallu', '11-dodda-bidarakallu', 'West', 25777);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '32-laggere' OR ward_number = 32) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 32, '32 - Laggere', '32-laggere', 'West', 20508);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '100-srinagar' OR ward_number = 100) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 100, '100 - Srinagar', '100-srinagar', 'West', 19229);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '74-pattegar-palya' OR ward_number = 74) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 74, '74 - Pattegar Palya', '74-pattegar-palya', 'West', 20465);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'sarvagnanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '26-samadhana-nagar' OR ward_number = 26) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 26, '26 - Samadhana Nagar', '26-samadhana-nagar', 'North', 20684);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '96-kathriguppe' OR ward_number = 96) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 96, '96 - Kathriguppe', '96-kathriguppe', 'West', 27696);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'yeshwanthapura' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '17-nagadevanahalli' OR ward_number = 17) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 17, '17 - Nagadevanahalli', '17-nagadevanahalli', 'West', 23269);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '99-tr-shamanna-nagar' OR ward_number = 99) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 99, '99 - T.R Shamanna Nagar', '99-tr-shamanna-nagar', 'West', 22292);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '103-nr-colony' OR ward_number = 103) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 103, '103 - N.R Colony', '103-nr-colony', 'West', 27603);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '104-thyagarajnagar' OR ward_number = 104) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 104, '104 - Thyagarajnagar', '104-thyagarajnagar', 'West', 21082);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '105-yediyuru' OR ward_number = 105) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 105, '105 - Yediyuru', '105-yediyuru', 'West', 23023);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '101-kempambudhi-ward' OR ward_number = 101) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 101, '101 - Kempambudhi Ward', '101-kempambudhi-ward', 'West', 19310);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '111-ittamadu' OR ward_number = 111) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 111, '111 - Ittamadu', '111-ittamadu', 'West', 19028);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '75-marenahalli-west' OR ward_number = 75) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 75, '75 - Marenahalli West', '75-marenahalli-west', 'West', 23915);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '109-kamakya-layout' OR ward_number = 109) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 109, '109 - Kamakya Layout', '109-kamakya-layout', 'West', 28151);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '110-chikkalasandra' OR ward_number = 110) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 110, '110 - Chikkalasandra', '110-chikkalasandra', 'West', 20242);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '106-devagiri-temple-ward' OR ward_number = 106) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 106, '106 - Devagiri Temple Ward', '106-devagiri-temple-ward', 'West', 19352);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'padmanabanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '108-ganesh-mandira-ward' OR ward_number = 108) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 108, '108 - Ganesh Mandira Ward', '108-ganesh-mandira-ward', 'West', 24265);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '76-moodalapalya' OR ward_number = 76) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 76, '76 - Moodalapalya', '76-moodalapalya', 'West', 19590);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '53-malleshwaram' OR ward_number = 53) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 53, '53 - Malleshwaram', '53-malleshwaram', 'West', 21827);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '91-gali-anjaneya-temple-ward' OR ward_number = 91) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 91, '91 - Gali Anjaneya Temple Ward', '91-gali-anjaneya-temple-ward', 'West', 22841);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '40-mahalakshmipuram' OR ward_number = 40) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 40, '40 - Mahalakshmipuram', '40-mahalakshmipuram', 'West', 28125);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajarajeshwarinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '30-kempegowda-layout' OR ward_number = 30) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 30, '30 - Kempegowda Layout', '30-kempegowda-layout', 'West', 20026);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '62-rama-mandira' OR ward_number = 62) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 62, '62 - Rama Mandira', '62-rama-mandira', 'West', 22322);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '43-kethamaranahalli' OR ward_number = 43) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 43, '43 - Kethamaranahalli', '43-kethamaranahalli', 'West', 28154);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '1-nagasandra' OR ward_number = 1) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 1, '1 - Nagasandra', '1-nagasandra', 'West', 24974);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '45-shakthi-ganapathi-nagara' OR ward_number = 45) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 45, '45 - Shakthi Ganapathi Nagara', '45-shakthi-ganapathi-nagara', 'West', 20838);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'govindraj-nagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '78-anubhava-nagara' OR ward_number = 78) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 78, '78 - Anubhava Nagara', '78-anubhava-nagara', 'West', 23375);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '94-deepanjali-nagara' OR ward_number = 94) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 94, '94 - Deepanjali Nagara', '94-deepanjali-nagara', 'West', 27561);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '84-hosahalli' OR ward_number = 84) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 84, '84 - Hosahalli', '84-hosahalli', 'West', 27966);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '6-shivapura' OR ward_number = 6) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 6, '6 - Shivapura', '6-shivapura', 'West', 26408);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '42-raja-mayura-varma-ward' OR ward_number = 42) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 42, '42 - Raja Mayura Varma Ward', '42-raja-mayura-varma-ward', 'West', 27523);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '44-shankar-mutt' OR ward_number = 44) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 44, '44 - Shankar Mutt', '44-shankar-mutt', 'West', 28358);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '36-nalwadi-krishnaraja-wadiyar-ward' OR ward_number = 36) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 36, '36 - Nalwadi Krishnaraja Wadiyar Ward', '36-nalwadi-krishnaraja-wadiyar-ward', 'West', 28281);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '37-dr-puneeth-rajkumar-ward' OR ward_number = 37) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 37, '37 - Dr. Puneeth Rajkumar Ward', '37-dr-puneeth-rajkumar-ward', 'West', 25126);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'vijayanagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '85-adi-chunchanagiri-ward' OR ward_number = 85) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 85, '85 - Adi Chunchanagiri Ward', '85-adi-chunchanagiri-ward', 'West', 26463);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '67-basaveshwara-nagara' OR ward_number = 67) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 67, '67 - Basaveshwara Nagara', '67-basaveshwara-nagara', 'West', 20769);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '39-jai-maruthi-nagar' OR ward_number = 39) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 39, '39 - Jai Maruthi Nagar', '39-jai-maruthi-nagar', 'West', 27166);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '46-kamalanagara' OR ward_number = 46) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 46, '46 - Kamalanagara', '46-kamalanagara', 'West', 28196);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'mahalakshmi-layout' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '47-vrishabhavathi-nagar' OR ward_number = 47) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 47, '47 - Vrishabhavathi Nagar', '47-vrishabhavathi-nagar', 'West', 28346);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'basavanagudi' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '98-ashoka-nagara' OR ward_number = 98) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 98, '98 - Ashoka Nagara', '98-ashoka-nagara', 'West', 28420);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'dasarahalli' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '8-hegganahalli' OR ward_number = 8) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 8, '8 - Hegganahalli', '8-hegganahalli', 'West', 28416);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'malleshwaram' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '50-sadashiva-nagara' OR ward_number = 50) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 50, '50 - Sadashiva Nagara', '50-sadashiva-nagara', 'West', 19596);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '48-azad-nagar' OR ward_number = 48) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 48, '48 - Azad Nagar', '48-azad-nagar', 'Central', 20270);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '56-gopalpura' OR ward_number = 56) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 56, '56 - Gopalpura', '56-gopalpura', 'Central', 26986);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '57-cottonpete' OR ward_number = 57) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 57, '57 - Cottonpete', '57-cottonpete', 'Central', 27147);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'gandhinagara' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '54-binnypete' OR ward_number = 54) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 54, '54 - Binnypete', '54-binnypete', 'Central', 25018);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'chamrajapet' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '47-ipd-salappa-ward' OR ward_number = 47) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 47, '47 - IPD Salappa Ward', '47-ipd-salappa-ward', 'Central', 20622);
  END IF;

  SELECT id INTO v_ac_id FROM assembly_constituencies WHERE slug = 'rajajinagar' LIMIT 1;

  IF NOT EXISTS (SELECT 1 FROM wards WHERE slug = '61-dara-bendre-ward' OR ward_number = 61) THEN
    INSERT INTO wards (city_id, ac_id, ward_number, name, slug, corporation, population)
    VALUES (v_city_id, v_ac_id, 61, '61 - Da.Ra. Bendre Ward', '61-dara-bendre-ward', 'West', 20756);
  END IF;

END $$;
