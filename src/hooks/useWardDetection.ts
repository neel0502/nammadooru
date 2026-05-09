// ============================================================
// NammaDooru — Ward Detection Hook
// ============================================================

import { useCallback } from 'react';
import { useAppStore } from '../store/useAppStore';
import { detectWard } from '../lib/geo';
import type { WardFeatureProperties } from '../types';
import type { Feature, Polygon, MultiPolygon } from 'geojson';

/**
 * Hook to detect which ward a given lat/lng falls in,
 * using the loaded GeoJSON data from the store.
 */
export function useWardDetection() {
  const wardsGeoJSON = useAppStore((s) => s.wardsGeoJSON);

  const detect = useCallback(
    (lat: number, lng: number): Feature<Polygon | MultiPolygon, WardFeatureProperties> | null => {
      if (!wardsGeoJSON) return null;
      return detectWard(lat, lng, wardsGeoJSON);
    },
    [wardsGeoJSON]
  );

  return { detect, isReady: !!wardsGeoJSON };
}
