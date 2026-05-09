import { useEffect, useState } from 'react';
import { useAppStore } from '../store/useAppStore';
import { supabase } from '../lib/supabase';
import type { Report } from '../types';

/**
 * Fetch reports from Supabase and apply local filters.
 * Falls back to empty array if Supabase is unreachable.
 */
export function useReports() {
  const { reports, setReports, filters } = useAppStore();
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    let cancelled = false;

    async function fetchReports() {
      try {
        const { data, error } = await supabase
          .from('reports')
          .select('*, categories(slug, name, icon, color)')
          .order('created_at', { ascending: false })
          .limit(500);

        if (error) {
          console.error('[NammaDooru] Failed to fetch reports:', error);
          return;
        }

        if (data && !cancelled) {
          const mapped: Report[] = data.map((row: any) => ({
            id: row.id,
            city_id: row.city_id,
            category_id: row.categories?.slug || row.category_id,
            ward_id: row.ward_id,
            location: { lat: row.latitude, lng: row.longitude },
            address: row.address,
            landmark: row.landmark,
            description: row.description,
            severity: row.severity,
            photo_urls: row.photo_urls || [],
            status: row.status,
            cleanup_photo_urls: row.cleanup_photo_urls || [],
            cleanup_submitted_at: row.cleanup_submitted_at,
            cleanup_verified_at: row.cleanup_verified_at,
            resolved_after_days: row.resolved_after_days,
            device_fingerprint: row.device_fingerprint,
            ip_hash: row.ip_hash,
            is_flagged: row.is_flagged,
            flag_reason: row.flag_reason,
            duplicate_of: row.duplicate_of,
            upvote_count: row.upvote_count || 0,
            created_at: row.created_at,
            updated_at: row.updated_at,
            category: row.categories ? {
              id: row.category_id,
              city_id: row.city_id,
              name: row.categories.name,
              slug: row.categories.slug,
              icon: row.categories.icon,
              color: row.categories.color,
              department_id: null,
              severity_default: 'medium',
              is_active: true,
              sort_order: 0,
              created_at: '',
            } : undefined,
          }));
          setReports(mapped);
        }
      } catch (err) {
        console.error('[NammaDooru] Reports fetch error:', err);
      } finally {
        if (!cancelled) setIsLoading(false);
      }
    }

    fetchReports();
    return () => { cancelled = true; };
  }, [setReports]);

  // Apply filters
  const filtered = reports.filter((r) => {
    if (filters.severity && r.severity !== filters.severity) return false;
    if (filters.status && r.status !== filters.status) return false;
    if (filters.categories.length > 0 && !filters.categories.includes(r.category_id)) return false;
    return true;
  });

  return { reports: filtered, allReports: reports, isLoading };
}
