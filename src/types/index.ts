// ============================================================
// NammaDooru — TypeScript Type Definitions
// ============================================================

// --- Database Entities ---

export interface City {
  id: string;
  name: string;
  slug: string;
  state: string;
  config: Record<string, unknown>;
  is_active: boolean;
  created_at: string;
}

export interface ParliamentaryConstituency {
  id: string;
  city_id: string;
  name: string;
  slug: string;
  mp_name: string | null;
  mp_party: string | null;
  mp_photo_url: string | null;
  mp_phone: string | null;
  mp_email: string | null;
  mp_twitter: string | null;
  mp_since: string | null;
  created_at: string;
}

export interface AssemblyConstituency {
  id: string;
  city_id: string;
  pc_id: string;
  name: string;
  slug: string;
  number: number | null;
  mla_name: string | null;
  mla_party: string | null;
  mla_photo_url: string | null;
  mla_phone: string | null;
  mla_email: string | null;
  mla_twitter: string | null;
  mla_since: string | null;
  zone: string | null;
  created_at: string;
  // Joined
  parliamentary_constituency?: ParliamentaryConstituency;
}

export interface Ward {
  id: string;
  city_id: string;
  ac_id: string;
  ward_number: number;
  name: string;
  slug: string;
  corporation: string | null;
  former_ward_names: string[] | null;
  population: number | null;
  area_sq_km: number | null;
  corporator_name: string | null;
  corporator_party: string | null;
  corporator_phone: string | null;
  corporator_email: string | null;
  created_at: string;
  // Joined
  assembly_constituency?: AssemblyConstituency;
}

export interface Department {
  id: string;
  city_id: string;
  name: string;
  short_name: string;
  phone: string | null;
  email: string | null;
  whatsapp: string | null;
  helpline: string | null;
  categories: string[];
  created_at: string;
}

export interface Category {
  id: string;
  city_id: string | null;
  name: string;
  slug: string;
  icon: string | null;
  color: string | null;
  department_id: string | null;
  severity_default: string;
  is_active: boolean;
  sort_order: number;
  created_at: string;
}

export type ReportStatus =
  | 'submitted'
  | 'verified'
  | 'escalated'
  | 'in_progress'
  | 'cleanup_pending'
  | 'resolved'
  | 'rejected';

export type SeverityLevel = 'low' | 'medium' | 'high' | 'critical';

export interface Report {
  id: string;
  city_id: string;
  category_id: string;
  ward_id: string | null;
  location: { lat: number; lng: number };
  address: string | null;
  landmark: string | null;
  description: string | null;
  severity: SeverityLevel;
  photo_urls: string[];
  status: ReportStatus;
  cleanup_photo_urls: string[];
  cleanup_submitted_at: string | null;
  cleanup_verified_at: string | null;
  resolved_after_days: number | null;
  device_fingerprint: string | null;
  ip_hash: string | null;
  is_flagged: boolean;
  flag_reason: string | null;
  duplicate_of: string | null;
  upvote_count: number;
  created_at: string;
  updated_at: string;
  // Joined
  category?: Category;
  ward?: Ward;
  // Supabase raw fields (latitude/longitude)
  latitude?: number;
  longitude?: number;
}

export interface Upvote {
  id: string;
  report_id: string;
  device_fingerprint: string;
  created_at: string;
}

export interface Subscription {
  id: string;
  email: string;
  ward_id: string | null;
  city_id: string;
  is_active: boolean;
  created_at: string;
}

// --- UI / Filter Types ---

export interface Filters {
  severity: SeverityLevel | null;
  status: ReportStatus | null;
  categories: string[]; // category slugs
}

export type ViewMode = 'map' | 'list';

// --- Ward Stats ---

export interface WardStats {
  ward_id: string;
  ward_name: string;
  ward_slug: string;
  total_reports: number;
  open_reports: number;
  resolved_reports: number;
  avg_days: number | null;
}

// --- GeoJSON Ward Feature Properties (matching real GBA file) ---

export interface WardFeatureProperties {
  id: string;
  ward_id: number;
  ward_name: string;        // e.g. "25 - Vinayaka Layout"
  ward_name_kn: string;     // Kannada name
  Corporation: string;       // "West", "North", "East", "Central"
  corporation_kn: string;
  corporation_id: number;
  ac: string;                // Assembly constituency name
  ac_kn: string;
  ac_no: number;
  Assembly: string;          // "154 - Rajarajeshwarinagar"
  TOT_P: number;             // Total population
  TOT_M: number;
  TOT_F: number;
  SC_P: number;
  SC_M: number;
  SC_F: number;
  ST_P: number;
  ST_M: number;
  ST_F: number;
  low_range: number;
  high_range: number;
  RO_Code: number;
  RO_Division: string;
  ARO_Code: number;
  'ARO_ Sub Division': string;
  zone: string;
  zone_name: string;
}

// --- Report Submission ---

export interface ReportSubmission {
  category_slug: string;
  description: string;
  photo: File | null;
  latitude: number;
  longitude: number;
  severity?: SeverityLevel;
}
