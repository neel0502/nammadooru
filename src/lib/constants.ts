// ============================================================
// NammaDooru — Constants & Configuration
// ============================================================

import type { SeverityLevel, ReportStatus } from '../types';

// --- Map Defaults ---
export const MAP_CENTER: [number, number] = [12.97, 77.59]; // Bengaluru center
export const MAP_ZOOM = 11;
export const MAP_MIN_ZOOM = 11;
export const MAP_MAX_ZOOM = 18;

export const MAP_BOUNDS: [[number, number], [number, number]] = [[12.80, 77.40], [13.17, 77.80]];
export const MAP_MAX_BOUNDS: [[number, number], [number, number]] = [
  [12.82, 77.42],  // southwest
  [13.15, 77.78]   // northeast
];

export const TILE_URL = 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
export const TILE_ATTRIBUTION = '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; <a href="https://carto.com/attributions">CARTO</a>';

// --- Brand Colors ---
export const COLORS = {
  brandRed: '#dc2626',
  brandGreen: '#16a34a',
  background: '#f5f0eb',
  textPrimary: '#111111',
  textSecondary: '#888888',
  textTertiary: '#999999',
  wardBorder: '#dc2626',
  wardFill: '#dc2626',
  wardFillHover: '#fca5a5',
  clusterMaroon: '#7f1d1d',   // dark maroon for cluster bubbles
  clusterText: '#ffffff',      // white count text
} as const;

// --- Category Configuration ---
export interface CategoryConfig {
  slug: string;
  name: string;
  icon: string;
  color: string;
  shortName: string;
}

export const CATEGORIES: CategoryConfig[] = [
  { slug: 'garbage', name: 'Garbage / Sanitation', icon: '🗑️', color: '#ef4444', shortName: 'Garbage' },
  { slug: 'pothole', name: 'Potholes / Roads', icon: '🕳️', color: '#f97316', shortName: 'Pothole' },
  { slug: 'water', name: 'Water Supply', icon: '💧', color: '#3b82f6', shortName: 'Water' },
  { slug: 'streetlight', name: 'Streetlights', icon: '💡', color: '#eab308', shortName: 'Lights' },
  { slug: 'drainage', name: 'Drainage / Flooding', icon: '🌊', color: '#06b6d4', shortName: 'Drainage' },
];

export const CATEGORY_COLOR_MAP: Record<string, string> = Object.fromEntries(
  CATEGORIES.map(c => [c.slug, c.color])
);

export const CATEGORY_ICON_MAP: Record<string, string> = Object.fromEntries(
  CATEGORIES.map(c => [c.slug, c.icon])
);

// --- Severity ---
export const SEVERITY_COLORS: Record<SeverityLevel, string> = {
  low: '#22c55e',
  medium: '#eab308',
  high: '#f97316',
  critical: '#ef4444',
};

export const SEVERITY_LABELS: Record<SeverityLevel, string> = {
  low: 'Low',
  medium: 'Medium',
  high: 'High',
  critical: 'Critical',
};

// --- Status ---
export const STATUS_COLORS: Record<ReportStatus, string> = {
  submitted: '#6b7280',
  verified: '#3b82f6',
  escalated: '#f97316',
  in_progress: '#eab308',
  cleanup_pending: '#a855f7',
  resolved: '#22c55e',
  rejected: '#ef4444',
};

export const STATUS_LABELS: Record<ReportStatus, string> = {
  submitted: 'Submitted',
  verified: 'Verified',
  escalated: 'Escalated',
  in_progress: 'In Progress',
  cleanup_pending: 'Cleanup Pending',
  resolved: 'Resolved',
  rejected: 'Rejected',
};

// --- Rate Limiting ---
export const MAX_REPORTS_PER_DAY = 5;

// --- Bengaluru City ID (placeholder — will be set from Supabase) ---
export const BENGALURU_CITY_SLUG = 'bengaluru';

// --- Google Maps ---
export const googleMapsUrl = (lat: number, lng: number) =>
  `https://www.google.com/maps?q=${lat},${lng}`;
