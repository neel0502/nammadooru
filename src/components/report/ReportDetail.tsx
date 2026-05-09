import { useAppStore } from '../../store/useAppStore';
import { BottomSheet } from '../common/BottomSheet';
import { AccountabilityTree } from '../accountability/AccountabilityTree';
import { CATEGORY_COLOR_MAP, CATEGORY_ICON_MAP, SEVERITY_COLORS, SEVERITY_LABELS, STATUS_COLORS, STATUS_LABELS, googleMapsUrl } from '../../lib/constants';
import { lookupAccountability } from '../../lib/accountability-data';
import { timeAgo } from '../../lib/geo';

export function ReportDetail() {
  const { selectedReport, showReportDetail, setShowReportDetail, wardsGeoJSON } = useAppStore();

  if (!selectedReport) return null;

  const r = selectedReport;
  const catColor = CATEGORY_COLOR_MAP[r.category_id] || '#6b7280';
  const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
  const catName = r.category?.name || r.category_id;

  // Try to find the ward's AC from GeoJSON to look up accountability
  let acName = '';
  if (wardsGeoJSON && r.location) {
    // Find the closest ward feature by checking which ward this report is in
    // For simplicity, we'll use a basic point-in-polygon check or just use ward_id
    // For now, try to find the ward from the store
    const wardFeature = wardsGeoJSON.features.find((f: any) => {
      const wId = f.properties?.ward_id?.toString();
      return wId && wId === r.ward_id;
    });
    if (wardFeature) {
      acName = (wardFeature.properties as any)?.ac || '';
    }
  }

  const { ac, pc } = lookupAccountability(acName);

  return (
    <BottomSheet
      isOpen={showReportDetail}
      onClose={() => setShowReportDetail(false)}
    >
      <div className="report-detail">
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

        <a
          href={googleMapsUrl(r.location.lat, r.location.lng)}
          target="_blank"
          rel="noopener noreferrer"
          className="report-detail__maps-btn"
        >
          📍 Open in Google Maps
        </a>

        <div className="report-detail__upvote">
          <button className="report-detail__upvote-btn">
            👍 Upvote ({r.upvote_count})
          </button>
        </div>

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
      </div>
    </BottomSheet>
  );
}
