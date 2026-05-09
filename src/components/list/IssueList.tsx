import { useReports } from '../../hooks/useReports';
import { useAppStore } from '../../store/useAppStore';
import { CATEGORY_COLOR_MAP, CATEGORY_ICON_MAP, SEVERITY_COLORS, SEVERITY_LABELS, STATUS_LABELS, googleMapsUrl } from '../../lib/constants';
import { timeAgo } from '../../lib/geo';

export function IssueList() {
  const { reports } = useReports();
  const { setSelectedReport, setViewMode } = useAppStore();

  const sorted = [...reports].sort((a, b) => b.upvote_count - a.upvote_count);

  return (
    <div className="issue-list">
      {sorted.length === 0 ? (
        <div className="issue-list__empty">
          <p>No reports match your filters</p>
        </div>
      ) : (
        sorted.map((r) => {
          const catColor = CATEGORY_COLOR_MAP[r.category_id] || '#6b7280';
          const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
          const hasPhoto = r.photo_urls && r.photo_urls.length > 0 && r.photo_urls[0];

          return (
            <div
              key={r.id}
              className="issue-card"
              onClick={() => {
                setSelectedReport(r);
                setViewMode('map');
              }}
            >
              {hasPhoto ? (
                <img
                  src={r.photo_urls[0]}
                  alt=""
                  className="issue-card__thumb"
                  loading="lazy"
                />
              ) : (
                <div className="issue-card__icon" style={{ backgroundColor: catColor }}>
                  {catIcon}
                </div>
              )}
              <div className="issue-card__content">
                <h4 className="issue-card__title">{r.description?.slice(0, 60) || 'Untitled'}</h4>
                <p className="issue-card__address">{r.address || 'Unknown location'}</p>
                <div className="issue-card__meta">
                  <span className="issue-card__severity" style={{ color: SEVERITY_COLORS[r.severity] }}>
                    {SEVERITY_LABELS[r.severity]}
                  </span>
                  <span className="issue-card__status">{STATUS_LABELS[r.status]}</span>
                  <span className="issue-card__time">{timeAgo(r.created_at)}</span>
                  <span className="issue-card__votes">👍 {r.upvote_count}</span>
                </div>
              </div>
              <a
                href={googleMapsUrl(r.location.lat, r.location.lng)}
                target="_blank"
                rel="noopener noreferrer"
                className="issue-card__maps"
                onClick={(e) => e.stopPropagation()}
              >📍</a>
            </div>
          );
        })
      )}
    </div>
  );
}
