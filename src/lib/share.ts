// ============================================================
// NammaDooru — Share Utilities
// Web Share API with clipboard fallback
// ============================================================

import type { Report } from '../types';
import { CATEGORY_ICON_MAP } from './constants';
import { getDepartment } from './departments';

interface ShareOpts {
  report: Report;
  categoryName: string;
  wardName?: string;
  mlaName?: string;
  departmentName?: string;
  helpline?: string;
}

function buildShareText(opts: ShareOpts): string {
  const icon = CATEGORY_ICON_MAP[opts.report.category_id] || '📌';
  const url = `${window.location.origin}/report/${opts.report.id}`;
  const dept = getDepartment(opts.report.category_id);

  const lines = [
    `${icon} ${opts.report.description || 'Civic issue reported'}`,
    opts.report.address ? `📍 ${opts.report.address}` : '',
    opts.wardName ? `🏘️ Ward: ${opts.wardName}` : '',
    `📋 ${opts.categoryName}`,
    opts.mlaName ? `🗳️ MLA: ${opts.mlaName}` : '',
    dept ? `📞 ${dept.shortName}: ${dept.call}` : '',
    `🔗 ${url}`,
    '',
    '#NammaDooru #Bengaluru',
  ].filter(Boolean);

  return lines.join('\n');
}

function getReportUrl(reportId: string): string {
  return `${window.location.origin}/report/${reportId}`;
}

/**
 * Share via Web Share API if available, otherwise copy to clipboard.
 * Returns true if shared/copied successfully.
 */
export async function shareReport(opts: ShareOpts): Promise<'shared' | 'copied' | 'failed'> {
  const text = buildShareText(opts);
  const url = getReportUrl(opts.report.id);
  const icon = CATEGORY_ICON_MAP[opts.report.category_id] || '📌';

  if (navigator.share) {
    try {
      await navigator.share({
        title: `${icon} ${opts.categoryName} issue${opts.wardName ? ` in ${opts.wardName}` : ''}`,
        text,
        url,
      });
      return 'shared';
    } catch (err) {
      // User cancelled or share failed — fall through to clipboard
      if ((err as Error).name === 'AbortError') return 'failed';
    }
  }

  // Clipboard fallback
  try {
    await navigator.clipboard.writeText(text);
    return 'copied';
  } catch {
    return 'failed';
  }
}

/**
 * Generate a WhatsApp share link for a report.
 */
export function whatsappShareLink(opts: ShareOpts): string {
  const text = encodeURIComponent(buildShareText(opts));
  return `https://wa.me/?text=${text}`;
}
