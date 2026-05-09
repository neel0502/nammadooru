import { useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { useAppStore } from '../store/useAppStore';
import type { Report } from '../types';

/**
 * Subscribe to real-time report inserts from Supabase.
 * Maps raw Supabase rows to our Report interface and adds to store.
 */
export function useRealtime() {
  const addReport = useAppStore((s) => s.addReport);

  useEffect(() => {
    const channel = supabase
      .channel('reports-realtime')
      .on(
        'postgres_changes',
        { event: 'INSERT', schema: 'public', table: 'reports' },
        (payload) => {
          const row = payload.new as any;
          const mapped: Report = {
            id: row.id,
            city_id: row.city_id,
            category_id: row.category_id, // UUID — will need slug lookup
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
          };
          addReport(mapped);
        }
      )
      .subscribe();

    return () => {
      supabase.removeChannel(channel);
    };
  }, [addReport]);
}
