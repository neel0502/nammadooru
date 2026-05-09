// ============================================================
// NammaDooru — Geo Helpers
// ============================================================

import booleanPointInPolygon from '@turf/boolean-point-in-polygon';
import { point } from '@turf/helpers';
import type { FeatureCollection, Feature, Polygon, MultiPolygon } from 'geojson';
import type { WardFeatureProperties } from '../types';

/**
 * Detect which ward a lat/lng coordinate falls in.
 * Uses @turf/boolean-point-in-polygon for client-side detection.
 */
export function detectWard(
  lat: number,
  lng: number,
  wardsGeoJSON: FeatureCollection
): Feature<Polygon | MultiPolygon, WardFeatureProperties> | null {
  const pt = point([lng, lat]);

  for (const feature of wardsGeoJSON.features) {
    if (
      feature.geometry.type === 'Polygon' ||
      feature.geometry.type === 'MultiPolygon'
    ) {
      if (booleanPointInPolygon(pt, feature as Feature<Polygon | MultiPolygon>)) {
        return feature as Feature<Polygon | MultiPolygon, WardFeatureProperties>;
      }
    }
  }

  return null;
}

/**
 * Calculate days since a date string.
 */
export function daysSince(dateStr: string): number {
  const then = new Date(dateStr).getTime();
  const now = Date.now();
  return Math.floor((now - then) / (1000 * 60 * 60 * 24));
}

/**
 * Format a relative time string (e.g., "2 days ago", "3 hours ago").
 */
export function timeAgo(dateStr: string): string {
  const seconds = Math.floor((Date.now() - new Date(dateStr).getTime()) / 1000);

  if (seconds < 60) return 'just now';
  if (seconds < 3600) return `${Math.floor(seconds / 60)}m ago`;
  if (seconds < 86400) return `${Math.floor(seconds / 3600)}h ago`;
  if (seconds < 604800) return `${Math.floor(seconds / 86400)}d ago`;
  return `${Math.floor(seconds / 604800)}w ago`;
}
