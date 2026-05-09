import { useAppStore } from '../../store/useAppStore';
import { useWardData } from '../../hooks/useWardData';
import { BottomSheet } from '../common/BottomSheet';
import { WardStats } from './WardStats';
import { AccountabilityTree } from '../accountability/AccountabilityTree';
import { CATEGORY_ICON_MAP, googleMapsUrl } from '../../lib/constants';
import { lookupAccountability } from '../../lib/accountability-data';
import { timeAgo } from '../../lib/geo';
import type { WardFeatureProperties } from '../../types';

export function WardSheet() {
  const { selectedWard, showWardSheet, setShowWardSheet } = useAppStore();
  const props = selectedWard?.properties as WardFeatureProperties | undefined;
  const wardId = props?.ward_id?.toString() || null;
  const { reports, stats } = useWardData(wardId);

  if (!props) return null;

  // Parse display name from "25 - Vinayaka Layout" → "Vinayaka Layout"
  const displayName = props.ward_name?.includes(' - ')
    ? props.ward_name.split(' - ').slice(1).join(' - ')
    : props.ward_name || 'Unknown';

  // Look up accountability from the GeoJSON ac property
  const { ac, pc } = lookupAccountability(props.ac || '');

  const topReports = [...reports].sort((a, b) => b.upvote_count - a.upvote_count).slice(0, 5);

  return (
    <BottomSheet
      isOpen={showWardSheet}
      onClose={() => setShowWardSheet(false)}
      title={`${displayName} Ward`}
    >
      <div className="ward-sheet">
        <div className="ward-sheet__meta">
          <span className="ward-sheet__badge">#{props.ward_id}</span>
          <span className="ward-sheet__badge">{props.Corporation} Zone</span>
          <span className="ward-sheet__badge">{props.ac} AC</span>
        </div>

        {/* Population info */}
        {props.TOT_P > 0 && (
          <div className="ward-sheet__meta" style={{ marginTop: 6 }}>
            <span className="ward-sheet__badge">Pop: {props.TOT_P.toLocaleString()}</span>
            {props.ward_name_kn && (
              <span className="ward-sheet__badge">{props.ward_name_kn}</span>
            )}
          </div>
        )}

        <WardStats open={stats.open} resolved={stats.resolved} total={stats.total} />

        <div className="ward-sheet__section">
          <h3 className="ward-sheet__heading">Accountability</h3>
          <AccountabilityTree
            corporator={null}
            mla={ac?.mla || null}
            mp={pc?.mp || null}
            acName={ac?.name}
            pcName={pc?.name}
          />
        </div>

        {topReports.length > 0 && (
          <div className="ward-sheet__section">
            <h3 className="ward-sheet__heading">Recent Issues</h3>
            <ul className="ward-sheet__issues">
              {topReports.map((r) => (
                <li key={r.id} className="ward-sheet__issue">
                  <span className="ward-sheet__issue-icon">{CATEGORY_ICON_MAP[r.category_id] || '📌'}</span>
                  <div className="ward-sheet__issue-info">
                    <span className="ward-sheet__issue-title">{r.description?.slice(0, 60)}</span>
                    <span className="ward-sheet__issue-meta">
                      {r.address} · 👍 {r.upvote_count} · {timeAgo(r.created_at)}
                    </span>
                  </div>
                  <a
                    href={googleMapsUrl(r.location.lat, r.location.lng)}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="ward-sheet__maps-link"
                    title="Open in Google Maps"
                  >📍</a>
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>
    </BottomSheet>
  );
}
