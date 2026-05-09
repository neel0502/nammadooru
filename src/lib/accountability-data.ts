// ============================================================
// NammaDooru — Full Accountability Data (2023 Karnataka Elections)
// Maps GeoJSON `ac` property → MLA → PC → MP
// ============================================================

export interface OfficialInfo {
  name: string;
  party: 'BJP' | 'INC' | 'JDS' | string;
  since: string;
  phone?: string | null;
  email?: string | null;
  whatsapp?: string | null;
}

export interface ACData {
  /** Canonical name (as in Supabase) */
  name: string;
  /** GeoJSON `ac` property value(s) that match this AC */
  geoJsonNames: string[];
  number: number;
  mla: OfficialInfo;
  pcSlug: string;
}

export interface PCData {
  name: string;
  slug: string;
  mp: OfficialInfo;
}

// ── Party Badge Colors ──────────────────────────────────────

export const PARTY_COLORS: Record<string, { bg: string; text: string }> = {
  BJP:  { bg: '#fff7ed', text: '#c2410c' },  // orange
  INC:  { bg: '#dbeafe', text: '#1d4ed8' },  // blue
  JDS:  { bg: '#dcfce7', text: '#166534' },  // green
};

export function getPartyColors(party: string) {
  return PARTY_COLORS[party] || { bg: '#f3f4f6', text: '#374151' };
}

// ── Parliamentary Constituencies ────────────────────────────

export const PC_DATA: Record<string, PCData> = {
  'bangalore-north': {
    name: 'Bangalore North',
    slug: 'bangalore-north',
    mp: { name: 'Shobha Karandlaje', party: 'BJP', since: '2024' },
  },
  'bangalore-central': {
    name: 'Bangalore Central',
    slug: 'bangalore-central',
    mp: { name: 'P.C. Mohan', party: 'BJP', since: '2014' },
  },
  'bangalore-south': {
    name: 'Bangalore South',
    slug: 'bangalore-south',
    mp: { name: 'Tejasvi Surya', party: 'BJP', since: '2019' },
  },
  'bangalore-rural': {
    name: 'Bangalore Rural',
    slug: 'bangalore-rural',
    mp: { name: 'Dr. C.N. Manjunath', party: 'BJP', since: '2024' },
  },
  'chikballapur': {
    name: 'Chikballapur',
    slug: 'chikballapur',
    mp: { name: 'Dr. K. Sudhakar', party: 'BJP', since: '2024' },
  },
};

// ── Assembly Constituencies ─────────────────────────────────
// geoJsonNames = exact values found in the GeoJSON `ac` property

export const AC_DATA: ACData[] = [
  // ── Bangalore North PC ──
  { name: 'Yelahanka',           geoJsonNames: ['Yelahanka'],           number: 153, pcSlug: 'bangalore-north',   mla: { name: 'S.R. Vishwanath',           party: 'BJP', since: '2023' } },
  { name: 'K.R. Pura',           geoJsonNames: ['K.R. Pura'],           number: 149, pcSlug: 'bangalore-north',   mla: { name: 'B.A. Basavaraja',           party: 'BJP', since: '2023' } },
  { name: 'Byatarayanapura',     geoJsonNames: ['Byatarayanapura'],     number: 152, pcSlug: 'bangalore-north',   mla: { name: 'Krishna Byregowda',         party: 'INC', since: '2023' } },
  { name: 'Yeshwanthapura',      geoJsonNames: ['Yeshwanthapura'],      number: 154, pcSlug: 'bangalore-north',   mla: { name: 'S.T. Somashekar',           party: 'BJP', since: '2023' } },
  { name: 'Dasarahalli',         geoJsonNames: ['Dasarahalli'],         number: 155, pcSlug: 'bangalore-north',   mla: { name: 'S. Muniraju',               party: 'BJP', since: '2023' } },
  { name: 'Mahalakshmi Layout',  geoJsonNames: ['Mahalakshmi Layout'],  number: 156, pcSlug: 'bangalore-north',   mla: { name: 'K. Gopalaiah',              party: 'BJP', since: '2023' } },
  { name: 'Malleshwaram',        geoJsonNames: ['Malleshwaram'],        number: 157, pcSlug: 'bangalore-north',   mla: { name: 'Dr. C.N. Ashwathnarayan',   party: 'BJP', since: '2023' } },
  { name: 'Hebbal',              geoJsonNames: ['Hebbal'],              number: 151, pcSlug: 'bangalore-north',   mla: { name: 'Suresha B.S.',              party: 'INC', since: '2023' } },

  // ── Bangalore Central PC ──
  { name: 'Pulakeshinagar',      geoJsonNames: ['Pulakeshinagar'],      number: 158, pcSlug: 'bangalore-central', mla: { name: 'A.C. Srinivasa',            party: 'INC', since: '2023' } },
  { name: 'Sarvagnanagar',       geoJsonNames: ['Sarvagnanagar'],       number: 159, pcSlug: 'bangalore-central', mla: { name: 'K.J. George',               party: 'INC', since: '2023' } },
  { name: 'C.V. Raman Nagar',    geoJsonNames: ['C.V. Raman Nagar'],   number: 160, pcSlug: 'bangalore-central', mla: { name: 'S. Raghu',                  party: 'BJP', since: '2023' } },
  { name: 'Shivajinagar',        geoJsonNames: ['Shivajinagar'],        number: 161, pcSlug: 'bangalore-central', mla: { name: 'Rizwan Arshad',             party: 'INC', since: '2023' } },
  { name: 'Shanthinagar',        geoJsonNames: ['Shanthinagar'],        number: 162, pcSlug: 'bangalore-central', mla: { name: 'N.A. Harris',               party: 'INC', since: '2023' } },
  { name: 'Gandhi Nagar',        geoJsonNames: ['Gandhinagara'],        number: 163, pcSlug: 'bangalore-central', mla: { name: 'Dinesh Gundu Rao',          party: 'INC', since: '2023' } },
  { name: 'Rajaji Nagar',        geoJsonNames: ['Rajajinagar'],         number: 164, pcSlug: 'bangalore-central', mla: { name: 'S. Suresh Kumar',           party: 'INC', since: '2023' } },
  { name: 'Chamrajpet',          geoJsonNames: ['Chamrajapet'],         number: 165, pcSlug: 'bangalore-central', mla: { name: 'B.Z. Zameer Ahmed Khan',    party: 'INC', since: '2023' } },
  { name: 'Mahadevapura',        geoJsonNames: ['Mahadevapura'],        number: 150, pcSlug: 'bangalore-central', mla: { name: 'Manjula S.',                party: 'BJP', since: '2023' } },

  // ── Bangalore South PC ──
  { name: 'Chickpet',            geoJsonNames: ['Chickpet'],            number: 166, pcSlug: 'bangalore-south',   mla: { name: 'Uday B. Garudachar',        party: 'BJP', since: '2023' } },
  { name: 'Basavanagudi',        geoJsonNames: ['Basavanagudi'],        number: 167, pcSlug: 'bangalore-south',   mla: { name: 'Ravi Subramanya L.A.',      party: 'BJP', since: '2023' } },
  { name: 'Padmanabhanagar',     geoJsonNames: ['Padmanabanagar'],      number: 168, pcSlug: 'bangalore-south',   mla: { name: 'R. Ashoka',                 party: 'BJP', since: '2023' } },
  { name: 'B.T.M. Layout',       geoJsonNames: ['B.T.M Layout'],        number: 169, pcSlug: 'bangalore-south',   mla: { name: 'Ramalinga Reddy',           party: 'INC', since: '2023' } },
  { name: 'Jayanagar',           geoJsonNames: ['Jayanagar'],           number: 170, pcSlug: 'bangalore-south',   mla: { name: 'C.K. Ramamurthy',           party: 'BJP', since: '2023' } },
  { name: 'Govindraj Nagar',     geoJsonNames: ['Govindraj Nagar'],     number: 171, pcSlug: 'bangalore-south',   mla: { name: 'Priya Krishna',             party: 'INC', since: '2023' } },
  { name: 'Vijay Nagar',         geoJsonNames: ['Vijayanagar'],         number: 172, pcSlug: 'bangalore-south',   mla: { name: 'H.R. Gaviyappa',            party: 'INC', since: '2023' } },
  { name: 'Bommanahalli',        geoJsonNames: ['Bommanahalli'],        number: 173, pcSlug: 'bangalore-south',   mla: { name: 'Satish Reddy M.',           party: 'BJP', since: '2023' } },

  // ── Bangalore Rural PC ──
  { name: 'Bangalore South',     geoJsonNames: ['Bangalore South'],     number: 174, pcSlug: 'bangalore-rural',   mla: { name: 'M. Krishnappa',             party: 'BJP', since: '2023' } },
  { name: 'Anekal',              geoJsonNames: ['Anekal'],              number: 175, pcSlug: 'bangalore-rural',   mla: { name: 'B. Shivanna',               party: 'INC', since: '2023' } },
  { name: 'Hoskote',             geoJsonNames: ['Hoskote'],             number: 148, pcSlug: 'bangalore-rural',   mla: { name: 'Sharath Kumar Bachegowda',  party: 'INC', since: '2023' } },

  // ── Chikballapur PC ──
  { name: 'Rajarajeshwarinagar', geoJsonNames: ['Rajarajeshwarinagar'], number: 147, pcSlug: 'chikballapur',      mla: { name: 'Munirathna',                party: 'BJP', since: '2023' } },
];

// ── Lookup: GeoJSON ac → ACData ─────────────────────────────

/** Pre-built index: normalized GeoJSON ac name → ACData */
const AC_LOOKUP: Map<string, ACData> = new Map();

function normalize(s: string): string {
  return s.toLowerCase().replace(/[.\s]+/g, '').trim();
}

// Build the lookup map
AC_DATA.forEach((ac) => {
  ac.geoJsonNames.forEach((gjName) => {
    AC_LOOKUP.set(normalize(gjName), ac);
  });
  // Also index by canonical name
  AC_LOOKUP.set(normalize(ac.name), ac);
});

/**
 * Look up accountability data from a GeoJSON ward's `ac` property.
 * Returns the AC data (with MLA) and the parent PC data (with MP).
 */
export function lookupAccountability(geoJsonAcName: string): {
  ac: ACData | null;
  pc: PCData | null;
} {
  const key = normalize(geoJsonAcName);
  const ac = AC_LOOKUP.get(key) || null;
  const pc = ac ? PC_DATA[ac.pcSlug] || null : null;
  return { ac, pc };
}
