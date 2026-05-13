import { useState } from 'react';
import booleanPointInPolygon from '@turf/boolean-point-in-polygon';
import { point } from '@turf/helpers';
import { useAppStore } from '../../store/useAppStore';
import { BottomSheet } from '../common/BottomSheet';
import { CATEGORY_ICON_MAP, CATEGORIES } from '../../lib/constants';
import { getDepartment, whatsappComplaintLink } from '../../lib/departments';
import { shareReport, whatsappShareLink } from '../../lib/share';
import { lookupAccountability } from '../../lib/accountability-data';

export function ReportSuccessSheet() {
  const { showSuccessSheet, setShowSuccessSheet, submittedReport, wardsGeoJSON } = useAppStore();
  const [toast, setToast] = useState<string | null>(null);

  if (!submittedReport || !showSuccessSheet) return null;

  const r = submittedReport;
  const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
  const catName = CATEGORIES.find((c) => c.slug === r.category_id)?.name || r.category_id;
  
  // Find ward and accountability
  let wardName = '';
  let wardNumber = r.ward_id?.toString() || '';
  let acName = '';
  
  if (wardsGeoJSON && r.location) {
    const pt = point([r.location.lng, r.location.lat]);
    const wardFeature = wardsGeoJSON.features.find((f: any) => {
      try {
        return booleanPointInPolygon(pt, f);
      } catch (e) {
        return false;
      }
    });
    if (wardFeature) {
      acName = (wardFeature.properties as any)?.ac || '';
      wardName = (wardFeature.properties as any)?.ward_name || '';
      if (!wardNumber) wardNumber = (wardFeature.properties as any)?.ward_id?.toString() || '';
    }
  }

  const { ac } = lookupAccountability(acName);
  const dept = getDepartment(r.category_id);

  const reportUrl = `${window.location.origin}/report/${r.id}`;
  const date = new Date(r.created_at).toLocaleDateString('en-IN', {
    day: 'numeric', month: 'short', year: 'numeric'
  });

  const complaintOpts = {
    title: r.description || catName,
    address: r.address || undefined,
    wardName: wardName || undefined,
    wardNumber: wardNumber || undefined,
    acName: acName || undefined,
    category: catName,
    date,
    reportUrl,
  };

  const shareOpts = {
    report: r,
    categoryName: catName,
    wardName: wardName || undefined,
    mlaName: ac?.mla?.name || undefined,
  };

  const handleShare = async () => {
    const result = await shareReport(shareOpts);
    if (result === 'copied') {
      setToast('Copied to clipboard!');
      setTimeout(() => setToast(null), 2000);
    }
  };

  const close = () => setShowSuccessSheet(false);

  return (
    <BottomSheet isOpen={showSuccessSheet} onClose={close}>
      <div className="report-success">
        <div className="report-success__header">
          <div className="report-success__icon">✅</div>
          <h2>Report Submitted!</h2>
        </div>

        <div className="report-success__summary">
          <p className="report-success__title">
            {catIcon} {r.description || `${catName} Issue`}
          </p>
          <p className="report-success__location">
            📍 {wardName ? `${wardName} Ward` : (r.address || 'Unknown Location')}
          </p>
        </div>

        <div className="report-success__call-to-action">
          <p>
            Now make it count — share with your MLA or report directly to the department:
          </p>
        </div>

        {dept && (
          <a
            href={whatsappComplaintLink(dept.whatsapp, complaintOpts)}
            target="_blank"
            rel="noopener noreferrer"
            className="report-success__btn report-success__btn--primary"
          >
            💬 Send to {dept.shortName} via WhatsApp
          </a>
        )}

        <div className="report-success__secondary-actions">
          <button className="report-success__btn" onClick={handleShare}>
            📤 Share Report
          </button>
          <a
            href={whatsappShareLink(shareOpts)}
            target="_blank"
            rel="noopener noreferrer"
            className="report-success__btn report-success__btn--wa-share"
          >
            💬 Share to WhatsApp
          </a>
        </div>

        <button className="report-success__skip" onClick={close}>
          ✕ Skip
        </button>

        {toast && <div className="success-toast">{toast}</div>}
      </div>
    </BottomSheet>
  );
}
