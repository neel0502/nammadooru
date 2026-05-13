import { useState } from 'react';
import { useAppStore } from '../../store/useAppStore';
import { BottomSheet } from '../common/BottomSheet';
import { AccountabilityTree } from '../accountability/AccountabilityTree';
import { DepartmentCard } from '../department/DepartmentCard';
import { CATEGORY_COLOR_MAP, CATEGORY_ICON_MAP, SEVERITY_COLORS, SEVERITY_LABELS, STATUS_COLORS, STATUS_LABELS, googleMapsUrl } from '../../lib/constants';
import { lookupAccountability } from '../../lib/accountability-data';
import { timeAgo } from '../../lib/geo';
import { shareReport, whatsappShareLink } from '../../lib/share';

export function ReportDetail() {
  const { selectedReport, showReportDetail, setShowReportDetail, wardsGeoJSON } = useAppStore();
  const [shareToast, setShareToast] = useState<string | null>(null);

  if (!selectedReport) return null;

  const r = selectedReport;
  const catColor = CATEGORY_COLOR_MAP[r.category_id] || '#6b7280';
  const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
  const catName = r.category?.name || r.category_id;
  const hasPhoto = r.photo_urls && r.photo_urls.length > 0 && r.photo_urls[0];

  // Find ward info from GeoJSON
  let wardName = '';
  let acName = '';
  if (wardsGeoJSON && r.location) {
    const wardFeature = wardsGeoJSON.features.find((f: any) => {
      const wId = f.properties?.ward_id?.toString();
      return wId && wId === r.ward_id;
    });
    if (wardFeature) {
      acName = (wardFeature.properties as any)?.ac || '';
      wardName = (wardFeature.properties as any)?.ward_name || '';
    }
  }

  const { ac, pc } = lookupAccountability(acName);

  const shareOpts = {
    report: r,
    categoryName: catName,
    wardName: wardName || undefined,
    mlaName: ac?.mla?.name || undefined,
  };

  const handleShare = async () => {
    const result = await shareReport(shareOpts);
    if (result === 'copied') {
      setShareToast('Copied to clipboard!');
      setTimeout(() => setShareToast(null), 2000);
    }
  };

  return (
    <BottomSheet
      isOpen={showReportDetail}
      onClose={() => setShowReportDetail(false)}
    >
      <div className="report-detail">
        {/* Hero photo or category placeholder */}
        <div className="report-detail__hero">
          {hasPhoto ? (
            <img
              src={r.photo_urls[0]}
              alt="Report photo"
              className="report-detail__photo"
              loading="lazy"
            />
          ) : (
            <div className="report-detail__photo-placeholder" style={{ backgroundColor: catColor }}>
              <span className="report-detail__photo-emoji">{catIcon}</span>
            </div>
          )}
        </div>

        <div className="report-detail__badges">
          <span className="report-detail__badge" style={{ backgroundColor: catColor, color: '#fff' }}>
            {catIcon} {catName}
          </span>
          <span className="report-detail__badge" style={{ backgroundColor: SEVERITY_COLORS[r.severity], color: '#fff' }}>
            {SEVERITY_LABELS[r.severity]}
          </span>
          <span className="report-detail__badge" style={{ backgroundColor: STATUS_COLORS[r.status], color: '#fff' }}>
            {STATUS_LABELS[r.status]}
          </span>
        </div>

        <h3 className="report-detail__title">{r.description || 'Untitled Report'}</h3>

        <div className="report-detail__meta">
          {r.address && <p className="report-detail__address">📍 {r.address}</p>}
          <p className="report-detail__time">{timeAgo(r.created_at)}</p>
        </div>

        {/* Action buttons row */}
        <div className="report-detail__actions">
          <a
            href={googleMapsUrl(r.location.lat, r.location.lng)}
            target="_blank"
            rel="noopener noreferrer"
            className="report-detail__action-btn"
          >
            📍 Maps
          </a>
          <button className="report-detail__action-btn" onClick={handleShare}>
            📤 Share
          </button>
          <a
            href={whatsappShareLink(shareOpts)}
            target="_blank"
            rel="noopener noreferrer"
            className="report-detail__action-btn report-detail__action-btn--wa"
          >
            💬 Share to WhatsApp
          </a>
        </div>

        <div className="report-detail__upvote">
          <button className="report-detail__upvote-btn">
            👍 Upvote ({r.upvote_count})
          </button>
        </div>

        {/* Accountability */}
        <div className="report-detail__accountability">
          <h4>Who's Accountable?</h4>
          <AccountabilityTree
            corporator={null}
            mla={ac?.mla || null}
            mp={pc?.mp || null}
            acName={ac?.name}
            pcName={pc?.name}
          />
        </div>

        {/* Department Routing */}
        <div className="report-detail__department">
          <h4>Report to Department</h4>
          <DepartmentCard
            report={r}
            categoryName={catName}
            categoryColor={catColor}
            wardName={wardName || undefined}
            wardNumber={r.ward_id?.toString()}
            acName={acName || undefined}
          />
        </div>
      </div>

      {shareToast && <div className="success-toast">{shareToast}</div>}
    </BottomSheet>
  );
}
