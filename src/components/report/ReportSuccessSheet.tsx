
import booleanPointInPolygon from '@turf/boolean-point-in-polygon';
import { point } from '@turf/helpers';
import { useAppStore } from '../../store/useAppStore';
import { BottomSheet } from '../common/BottomSheet';
import { CATEGORY_ICON_MAP, CATEGORIES, googleMapsUrl, MLA_TEAM_PHONE } from '../../lib/constants';
import { getDepartment } from '../../lib/departments';

export function ReportSuccessSheet() {
  const { showSuccessSheet, setShowSuccessSheet, submittedReport, wardsGeoJSON } = useAppStore();

  if (!submittedReport || !showSuccessSheet) return null;

  const r = submittedReport;
  const catIcon = CATEGORY_ICON_MAP[r.category_id] || '📌';
  const catName = CATEGORIES.find((c) => c.slug === r.category_id)?.name || r.category_id;
  
  // Find ward and accountability
  let wardName = '';
  let wardNumber = r.ward_id?.toString() || '';
  
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
      wardName = (wardFeature.properties as any)?.ward_name || '';
      if (!wardNumber) wardNumber = (wardFeature.properties as any)?.ward_id?.toString() || '';
    }
  }

  const dept = getDepartment(r.category_id);

  const googleMapsLink = googleMapsUrl(r.location.lat, r.location.lng);
  const photoLink = (r.photo_urls && r.photo_urls.length > 0) ? r.photo_urls[0] : 'No photo attached';
  
  const message = `🚨 *NammaDooru Complaint*

📋 *Category:* ${catName}
📍 *Location:* ${r.address || 'Unknown Location'}
🗺️ *Google Maps:* ${googleMapsLink}
🏛️ *Ward:* ${wardName || wardNumber || 'Unknown Ward'}

📝 ${r.description || ''}

📸 Photo: ${photoLink}

Please take action. Thank you.
— Sent via NammaDooru (nammadooru.app)`;

  const encodedMessage = encodeURIComponent(message);

  const handleDepartmentWhatsApp = () => {
    if (dept?.whatsapp) {
      window.open(`https://wa.me/91${dept.whatsapp}?text=${encodedMessage}`, '_blank');
    }
  };

  const handleMLAWhatsApp = () => {
    window.open(`https://wa.me/91${MLA_TEAM_PHONE}?text=${encodedMessage}`, '_blank');
  };

  const close = () => setShowSuccessSheet(false);

  return (
    <BottomSheet isOpen={showSuccessSheet} onClose={close}>
      <div className="report-success" style={{ paddingBottom: '16px' }}>
        <div className="report-success__header" style={{ textAlign: 'center', marginBottom: '24px' }}>
          <div className="report-success__icon" style={{ fontSize: '48px', marginBottom: '12px' }}>✅</div>
          <h2 style={{ fontSize: '22px', fontWeight: 'bold', margin: 0, color: '#111827' }}>Complaint Submitted Successfully!</h2>
        </div>

        <div className="report-success__summary" style={{ background: '#f9fafb', borderRadius: '12px', padding: '16px', marginBottom: '24px', border: '1px solid #e5e7eb' }}>
          <p className="report-success__title" style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'flex', alignItems: 'center', gap: '8px', color: '#111827' }}>
            <span>{catIcon}</span> {catName}
          </p>
          <p className="report-success__location" style={{ fontSize: '14px', color: '#4b5563', marginBottom: '8px' }}>
            📍 {r.address || (wardName ? `${wardName} Ward` : 'Unknown Location')}
          </p>
          {r.description && (
            <p style={{ fontSize: '14px', color: '#6b7280', marginBottom: '12px', display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical', overflow: 'hidden' }}>
              📝 {r.description}
            </p>
          )}
          <a 
            href={googleMapsLink}
            target="_blank"
            rel="noopener noreferrer"
            style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', background: '#e0f2fe', color: '#0369a1', padding: '6px 12px', borderRadius: '6px', fontSize: '13px', fontWeight: '500', textDecoration: 'none' }}
          >
            🗺️ View on Google Maps
          </a>
        </div>

        <div className="report-success__actions" style={{ display: 'flex', flexDirection: 'column', gap: '12px', marginBottom: '16px' }}>
          {dept && dept.whatsapp && (
            <button
              onClick={handleDepartmentWhatsApp}
              style={{ width: '100%', padding: '14px', background: '#25D366', color: '#fff', border: 'none', borderRadius: '8px', fontSize: '16px', fontWeight: '600', cursor: 'pointer', display: 'flex', justifyContent: 'center', alignItems: 'center', gap: '8px' }}
            >
              💬 Send to {dept.shortName} via WhatsApp
            </button>
          )}

          <button
            onClick={handleMLAWhatsApp}
            style={{ width: '100%', padding: '14px', background: '#4f46e5', color: '#fff', border: 'none', borderRadius: '8px', fontSize: '16px', fontWeight: '600', cursor: 'pointer', display: 'flex', justifyContent: 'center', alignItems: 'center', gap: '8px' }}
          >
            💬 Notify MLA Team via WhatsApp
          </button>
        </div>

        <p style={{ fontSize: '13px', color: '#6b7280', textAlign: 'center', marginBottom: '24px' }}>
          Messages will be sent from your phone via WhatsApp
        </p>

        <button 
          onClick={close}
          style={{ width: '100%', padding: '12px', background: 'transparent', color: '#4b5563', border: 'none', fontSize: '15px', fontWeight: '600', cursor: 'pointer' }}
        >
          ← Back to Map
        </button>
      </div>
    </BottomSheet>
  );
}
