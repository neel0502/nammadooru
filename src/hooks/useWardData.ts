import { useMemo } from 'react';
import { useAppStore } from '../store/useAppStore';

// Static accountability data for Byatarayanapura AC
const ACCOUNTABILITY = {
  ac: {
    name: 'Byatarayanapura',
    number: 152,
    zone: 'North',
    mla_name: 'Krishna Byre Gowda',
    mla_party: 'INC',
    mla_since: '2008',
    mla_phone: null,
    mla_email: null,
    mla_twitter: '@aborneoffl',
  },
  pc: {
    name: 'Bangalore North',
    mp_name: 'Shobha Karandlaje',
    mp_party: 'BJP',
    mp_since: '2024',
    mp_phone: null,
    mp_email: null,
    mp_twitter: '@ShobhaBJP',
  },
};

export function useWardData(wardId: string | null) {
  const reports = useAppStore((s) => s.reports);

  const wardReports = useMemo(() => {
    if (!wardId) return [];
    return reports.filter((r) => r.ward_id === wardId);
  }, [wardId, reports]);

  const stats = useMemo(() => {
    const total = wardReports.length;
    const open = wardReports.filter((r) => !['resolved', 'rejected'].includes(r.status)).length;
    const resolved = wardReports.filter((r) => r.status === 'resolved').length;
    return { total, open, resolved };
  }, [wardReports]);

  return {
    reports: wardReports,
    stats,
    accountability: ACCOUNTABILITY,
  };
}
