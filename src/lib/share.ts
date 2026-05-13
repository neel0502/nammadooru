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
  const url = getReportUrl(opts.report.id);
  const dept = getDepartment(opts.report.category_id);

  let text = `${icon} ${opts.report.description || 'Civic issue'}\n`;
  if (opts.report.address) text += `📍 ${opts.report.address}\n`;
  
  if (opts.wardName || opts.mlaName) {
    const parts = [];
    if (opts.wardName) parts.push(`Ward: ${opts.wardName}`);
    if (opts.mlaName) parts.push(`MLA: ${opts.mlaName}`);
    text += `🏛️ ${parts.join(' | ')}\n`;
  }
  
  if (dept) {
    text += `📞 Dept: ${dept.name} (${dept.call})\n`;
  }
  
  text += `\nReport & upvote: ${url}`;
  return text;
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
