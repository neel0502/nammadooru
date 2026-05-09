// ============================================================
// NammaDooru — Department Routing Data
// Maps category slugs to responsible government departments
// ============================================================

export interface DepartmentInfo {
  name: string;
  shortName: string;
  call: string;
  whatsapp: string;
  /** Optional extra helplines (e.g. zone-specific) */
  extras?: { label: string; number: string }[];
}

const DEPARTMENTS: Record<string, DepartmentInfo> = {
  garbage: {
    name: 'GBA / BBMP Solid Waste Management',
    shortName: 'BBMP SWM',
    call: '1533',
    whatsapp: '9480685700',
  },
  pothole: {
    name: 'GBA / BBMP Engineering',
    shortName: 'BBMP Engineering',
    call: '1533',
    whatsapp: '9480685700',
  },
  water: {
    name: 'Bangalore Water Supply & Sewerage Board',
    shortName: 'BWSSB',
    call: '1916',
    whatsapp: '8762228888',
  },
  drainage: {
    name: 'Bangalore Water Supply & Sewerage Board',
    shortName: 'BWSSB',
    call: '1916',
    whatsapp: '8762228888',
    extras: [{ label: 'Sewage Helpline', number: '14420' }],
  },
  streetlight: {
    name: 'Bangalore Electricity Supply Company',
    shortName: 'BESCOM',
    call: '1912',
    whatsapp: '9449844640',
    extras: [
      { label: 'North Zone', number: '8277884014' },
      { label: 'South Zone', number: '8277884011' },
      { label: 'East Zone', number: '8277884013' },
      { label: 'West Zone', number: '8277884012' },
    ],
  },
  encroachment: {
    name: 'GBA / BBMP Revenue Section',
    shortName: 'BBMP Revenue',
    call: '1533',
    whatsapp: '9480685700',
  },
};

export function getDepartment(categorySlug: string): DepartmentInfo | null {
  return DEPARTMENTS[categorySlug] || null;
}

/**
 * Generate a WhatsApp deep link with pre-filled complaint message.
 */
export function whatsappComplaintLink(
  phone: string,
  opts: {
    title: string;
    address?: string;
    wardName?: string;
    category: string;
    date: string;
    reportUrl: string;
  }
): string {
  const lines = [
    `🚨 Complaint: ${opts.title}`,
    opts.address ? `📍 Location: ${opts.address}` : '',
    opts.wardName ? `🏘️ Ward: ${opts.wardName}` : '',
    `📋 Category: ${opts.category}`,
    `📅 Reported: ${opts.date}`,
    `🔗 View: ${opts.reportUrl}`,
  ].filter(Boolean);

  const text = encodeURIComponent(lines.join('\n'));
  return `https://wa.me/91${phone}?text=${text}`;
}
