import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { CATEGORY_COLOR_MAP, CATEGORY_ICON_MAP, SEVERITY_COLORS, SEVERITY_LABELS, STATUS_COLORS, STATUS_LABELS, googleMapsUrl, CATEGORIES } from '../lib/constants';
import { lookupAccountability } from '../lib/accountability-data';
import { timeAgo } from '../lib/geo';
import { DepartmentCard } from '../components/department/DepartmentCard';
import { AccountabilityTree } from '../components/accountability/AccountabilityTree';
import { shareReport, whatsappShareLink } from '../lib/share';
import type { Report } from '../types';

export function ReportPage() {
  const { id } = useParams<{ id: string }>();
  const [report, setReport] = useState<Report | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [toast, setToast] = useState<string | null>(null);

  useEffect(() => {
    if (!id) return;

    async function fetchReport() {
      try {
        const { data, error: fetchErr } = await supabase
          .from('reports')
          .select('*, categories(slug, name, icon, color)')
          .eq('id', id)
          .single();

        if (fetchErr || !data) {
          setError('Report not found');
          return;
        }

        setReport({
          id: data.id,
          city_id: data.city_id,
          category_id: data.categories?.slug || data.category_id,
          ward_id: data.ward_id,
          location: { lat: data.latitude, lng: data.longitude },
          address: data.address,
          landmark: data.landmark,
          description: data.description,
          severity: data.severity,
          photo_urls: data.photo_urls || [],
          status: data.status,
          cleanup_photo_urls: data.cleanup_photo_urls || [],
          cleanup_submitted_at: data.cleanup_submitted_at,
          cleanup_verified_at: data.cleanup_verified_at,
          resolved_after_days: data.resolved_after_days,
          device_fingerprint: data.device_fingerprint,
          ip_hash: data.ip_hash,
          is_flagged: data.is_flagged,
          flag_reason: data.flag_reason,
          duplicate_of: data.duplicate_of,
          upvote_count: data.upvote_count || 0,
          created_at: data.created_at,
          updated_at: data.updated_at,
          category: data.categories ? {
            id: data.category_id,
            city_id: data.city_id,
            name: data.categories.name,
            slug: data.categories.slug,
            icon: data.categories.icon,
            color: data.categories.color,
            department_id: null,
            severity_default: 'medium',
            is_active: true,
            sort_order: 0,
            created_at: '',
          } : undefined,
        });
      } catch {
        setError('Failed to load report');
      } finally {
        setLoading(false);
      }
    }

    fetchReport();
  }, [id]);

  if (loading) {
    return (
      <div className="report-page">
        <div className="report-page__loading">
          <div className="loading-spinner__circle" />
        </div>
      </div>
    );
  }

  if (error || !report) {
    return (
      <div className="report-page">
        <div className="report-page__error">
          <h2>😕 {error || 'Report not found'}</h2>
          <p>This report may have been removed or the link is invalid.</p>
          <Link to="/" className="report-page__back">← Back to Map</Link>
        </div>
      </div>
    );
  }

  const r = report;
  const catColor = CATEGORY_COLOR_MAP[r.category_id] || '#6b7280';
  const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
  const catName = r.category?.name || CATEGORIES.find(c => c.slug === r.category_id)?.name || r.category_id;
  const hasPhoto = r.photo_urls && r.photo_urls.length > 0 && r.photo_urls[0];

  // Look up accountability (we don't have GeoJSON here, so try from ward_id)
  // For now, pass empty string — the accountability tree handles missing data gracefully
  const { ac, pc } = lookupAccountability('');

  const shareOpts = {
    report: r,
    categoryName: catName,
    mlaName: ac?.mla?.name || undefined,
  };

  const handleShare = async () => {
    const result = await shareReport(shareOpts);
    if (result === 'copied') {
      setToast('Copied to clipboard!');
      setTimeout(() => setToast(null), 2000);
    }
  };

  const formattedDate = new Date(r.created_at).toLocaleDateString('en-IN', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });

  return (
    <div className="report-page">
      {/* Header */}
      <header className="report-page__header">
        <Link to="/" className="report-page__back">← Map</Link>
        <span className="report-page__logo">📢 NammaDooru</span>
        <button className="report-page__share-btn" onClick={handleShare}>📤</button>
      </header>

      {/* Hero */}
      <div className="report-page__hero">
        {hasPhoto ? (
          <img
            src={r.photo_urls[0]}
            alt="Report photo"
            className="report-page__photo"
          />
        ) : (
          <div className="report-page__photo-placeholder" style={{ backgroundColor: catColor }}>
            <span className="report-page__photo-emoji">{catIcon}</span>
          </div>
        )}
      </div>

      {/* Content */}
      <div className="report-page__body">
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

        <h1 className="report-page__title">{r.description || 'Untitled Report'}</h1>

        <div className="report-page__meta">
          {r.address && <p className="report-page__address">📍 {r.address}</p>}
          <p className="report-page__date">📅 {formattedDate}</p>
          <p className="report-page__time-ago">{timeAgo(r.created_at)}</p>
        </div>

        {/* Action buttons */}
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

        {/* Upvote */}
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
            wardNumber={r.ward_id?.toString()}
            acName={ac?.name}
          />
        </div>

        {/* Footer */}
        <div className="report-page__footer">
          <Link to="/" className="report-page__map-link">
            🗺️ View all complaints on map
          </Link>
        </div>
      </div>

      {toast && <div className="success-toast">{toast}</div>}
    </div>
  );
}
