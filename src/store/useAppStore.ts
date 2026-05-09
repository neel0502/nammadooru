// ============================================================
// NammaDooru — Zustand Global Store
// ============================================================

import { create } from 'zustand';
import type { Filters, ViewMode, Report, SeverityLevel, ReportStatus } from '../types';
import type { WardFeatureProperties } from '../types';
import type { Feature, Polygon, MultiPolygon } from 'geojson';

interface AppState {
  // --- Selected Entities ---
  selectedWard: Feature<Polygon | MultiPolygon, WardFeatureProperties> | null;
  selectedReport: Report | null;

  // --- Filters ---
  filters: Filters;

  // --- View Mode ---
  viewMode: ViewMode;

  // --- UI Toggles ---
  showReportForm: boolean;
  showWardSheet: boolean;
  showReportDetail: boolean;

  // --- User Location ---
  userLocation: { lat: number; lng: number } | null;

  // --- GeoJSON Data ---
  wardsGeoJSON: GeoJSON.FeatureCollection | null;

  // --- Mock Reports (used when Supabase is not configured) ---
  reports: Report[];

  // --- Actions ---
  setSelectedWard: (ward: Feature<Polygon | MultiPolygon, WardFeatureProperties> | null) => void;
  setSelectedReport: (report: Report | null) => void;
  setFilters: (filters: Partial<Filters>) => void;
  resetFilters: () => void;
  toggleCategory: (slug: string) => void;
  setSeverityFilter: (severity: SeverityLevel | null) => void;
  setStatusFilter: (status: ReportStatus | null) => void;
  setViewMode: (mode: ViewMode) => void;
  toggleView: () => void;
  setShowReportForm: (show: boolean) => void;
  setShowWardSheet: (show: boolean) => void;
  setShowReportDetail: (show: boolean) => void;
  setUserLocation: (loc: { lat: number; lng: number } | null) => void;
  setWardsGeoJSON: (data: GeoJSON.FeatureCollection) => void;
  setReports: (reports: Report[]) => void;
  addReport: (report: Report) => void;
}

const DEFAULT_FILTERS: Filters = {
  severity: null,
  status: null,
  categories: [],
};

export const useAppStore = create<AppState>((set) => ({
  // Initial state
  selectedWard: null,
  selectedReport: null,
  filters: { ...DEFAULT_FILTERS },
  viewMode: 'map',
  showReportForm: false,
  showWardSheet: false,
  showReportDetail: false,
  userLocation: null,
  wardsGeoJSON: null,
  reports: [],

  // Actions
  setSelectedWard: (ward) =>
    set({ selectedWard: ward, showWardSheet: !!ward, showReportDetail: false }),

  setSelectedReport: (report) =>
    set({ selectedReport: report, showReportDetail: !!report, showWardSheet: false }),

  setFilters: (newFilters) =>
    set((state) => ({ filters: { ...state.filters, ...newFilters } })),

  resetFilters: () => set({ filters: { ...DEFAULT_FILTERS } }),

  toggleCategory: (slug) =>
    set((state) => {
      const cats = state.filters.categories;
      const newCats = cats.includes(slug)
        ? cats.filter((c) => c !== slug)
        : [...cats, slug];
      return { filters: { ...state.filters, categories: newCats } };
    }),

  setSeverityFilter: (severity) =>
    set((state) => ({ filters: { ...state.filters, severity } })),

  setStatusFilter: (status) =>
    set((state) => ({ filters: { ...state.filters, status } })),

  setViewMode: (mode) => set({ viewMode: mode }),
  toggleView: () =>
    set((state) => ({ viewMode: state.viewMode === 'map' ? 'list' : 'map' })),

  setShowReportForm: (show) => set({ showReportForm: show }),
  setShowWardSheet: (show) => set({ showWardSheet: show }),
  setShowReportDetail: (show) => set({ showReportDetail: show }),
  setUserLocation: (loc) => set({ userLocation: loc }),
  setWardsGeoJSON: (data) => set({ wardsGeoJSON: data }),
  setReports: (reports) => set({ reports }),
  addReport: (report) => set((state) => ({ reports: [report, ...state.reports] })),
}));
