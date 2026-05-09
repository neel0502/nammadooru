-- CITIES
CREATE TABLE cities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  state TEXT NOT NULL,
  boundary GEOMETRY(MultiPolygon, 4326),
  config JSONB DEFAULT '{}',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- PARLIAMENTARY CONSTITUENCIES
CREATE TABLE parliamentary_constituencies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id),
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  mp_name TEXT, mp_party TEXT, mp_photo_url TEXT, mp_phone TEXT, mp_email TEXT, mp_twitter TEXT, mp_since TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(city_id, slug)
);

-- ASSEMBLY CONSTITUENCIES
CREATE TABLE assembly_constituencies (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id),
  pc_id UUID NOT NULL REFERENCES parliamentary_constituencies(id),
  name TEXT NOT NULL, slug TEXT NOT NULL, number INTEGER,
  mla_name TEXT, mla_party TEXT, mla_photo_url TEXT, mla_phone TEXT, mla_email TEXT, mla_twitter TEXT, mla_since TEXT,
  zone TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(city_id, slug)
);

-- WARDS
CREATE TABLE wards (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id),
  ac_id UUID NOT NULL REFERENCES assembly_constituencies(id),
  ward_number INTEGER NOT NULL, name TEXT NOT NULL, slug TEXT NOT NULL,
  corporation TEXT,
  boundary GEOMETRY(MultiPolygon, 4326), centroid GEOMETRY(Point, 4326),
  former_ward_names TEXT[], population INTEGER, area_sq_km NUMERIC,
  corporator_name TEXT, corporator_party TEXT, corporator_phone TEXT, corporator_email TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(city_id, slug), UNIQUE(city_id, ward_number)
);

CREATE INDEX idx_wards_boundary ON wards USING GIST (boundary);
CREATE INDEX idx_wards_city ON wards(city_id);
CREATE INDEX idx_wards_ac ON wards(ac_id);

-- DEPARTMENTS
CREATE TABLE departments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id),
  name TEXT NOT NULL, short_name TEXT NOT NULL,
  phone TEXT, email TEXT, whatsapp TEXT, helpline TEXT,
  categories TEXT[] NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- CATEGORIES
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID REFERENCES cities(id),
  name TEXT NOT NULL, slug TEXT NOT NULL, icon TEXT, color TEXT,
  department_id UUID REFERENCES departments(id),
  severity_default TEXT DEFAULT 'medium',
  is_active BOOLEAN DEFAULT true, sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- REPORTS
CREATE TYPE report_status AS ENUM ('submitted','verified','escalated','in_progress','cleanup_pending','resolved','rejected');
CREATE TYPE severity_level AS ENUM ('low','medium','high','critical');

CREATE TABLE reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id UUID NOT NULL REFERENCES cities(id),
  category_id UUID NOT NULL REFERENCES categories(id),
  ward_id UUID REFERENCES wards(id),
  location GEOMETRY(Point, 4326) NOT NULL,
  address TEXT, landmark TEXT, description TEXT,
  severity severity_level DEFAULT 'medium',
  photo_urls TEXT[] NOT NULL DEFAULT '{}',
  status report_status DEFAULT 'submitted',
  cleanup_photo_urls TEXT[] DEFAULT '{}',
  cleanup_submitted_at TIMESTAMPTZ, cleanup_verified_at TIMESTAMPTZ,
  resolved_after_days INTEGER,
  device_fingerprint TEXT, ip_hash TEXT,
  is_flagged BOOLEAN DEFAULT false, flag_reason TEXT,
  duplicate_of UUID REFERENCES reports(id),
  upvote_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_reports_location ON reports USING GIST (location);
CREATE INDEX idx_reports_ward ON reports(ward_id);
CREATE INDEX idx_reports_city ON reports(city_id);
CREATE INDEX idx_reports_status ON reports(status);
CREATE INDEX idx_reports_category ON reports(category_id);
CREATE INDEX idx_reports_created ON reports(created_at DESC);
CREATE INDEX idx_reports_fingerprint ON reports(device_fingerprint, created_at);

-- UPVOTES
CREATE TABLE upvotes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  report_id UUID NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
  device_fingerprint TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(report_id, device_fingerprint)
);

-- MODERATION LOG
CREATE TABLE moderation_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  report_id UUID NOT NULL REFERENCES reports(id),
  action TEXT NOT NULL, reason TEXT, moderator TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- SUBSCRIPTIONS
CREATE TABLE subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT NOT NULL UNIQUE,
  ward_id UUID REFERENCES wards(id),
  city_id UUID NOT NULL REFERENCES cities(id),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);
