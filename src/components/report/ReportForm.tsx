import { useState, useRef } from 'react';
import booleanPointInPolygon from '@turf/boolean-point-in-polygon';
import { point } from '@turf/helpers';
import { BottomSheet } from '../common/BottomSheet';
import { useAppStore } from '../../store/useAppStore';
import { useGeolocation } from '../../hooks/useGeolocation';
import { useFingerprint } from '../../hooks/useFingerprint';
import { CATEGORIES } from '../../lib/constants';
import { supabase } from '../../lib/supabase';

export function ReportForm() {
  const { showReportForm, setShowReportForm, addReport, wardsGeoJSON, setShowSuccessSheet, setSubmittedReport } = useAppStore();
  const { latitude, longitude, loading: gpsLoading, locate } = useGeolocation();
  const fingerprint = useFingerprint();

  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [description, setDescription] = useState('');
  const [photo, setPhoto] = useState<File | null>(null);
  const [photoPreview, setPhotoPreview] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const [success, setSuccess] = useState(false);
  const [outOfBoundsError, setOutOfBoundsError] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  const handlePhotoChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      setPhoto(file);
      const reader = new FileReader();
      reader.onload = () => setPhotoPreview(reader.result as string);
      reader.readAsDataURL(file);
    }
  };

  const removePhoto = () => {
    setPhoto(null);
    setPhotoPreview(null);
    if (fileRef.current) fileRef.current.value = '';
  };

  const resetForm = () => {
    setSelectedCategory(null);
    setDescription('');
    removePhoto();
    setOutOfBoundsError(false);
  };

  const handleSubmit = async () => {
    if (!selectedCategory) return;
    if (!latitude || !longitude) {
      locate();
      return;
    }

    setSubmitting(true);
    setOutOfBoundsError(false);

    let matchedFeature: any = null;

    // Validate location is inside GBA
    if (wardsGeoJSON) {
      const pt = point([longitude, latitude]);
      const isInside = wardsGeoJSON.features.some((feature: any) => {
        try {
          if (booleanPointInPolygon(pt, feature)) {
            matchedFeature = feature;
            return true;
          }
          return false;
        } catch (e) {
          return false;
        }
      });

      if (!isInside) {
        setOutOfBoundsError(true);
        setSubmitting(false);
        return;
      }
    }

    try {
      // Get city and category IDs from Supabase
      const { data: cityData } = await supabase
        .from('cities')
        .select('id')
        .eq('slug', 'bengaluru')
        .single();

      const { data: catData } = await supabase
        .from('categories')
        .select('id')
        .eq('slug', selectedCategory)
        .single();

      if (!cityData || !catData) {
        console.error('City or category not found');
        return;
      }

      // Lookup ward
      let dbWardId: string | null = null;
      if (matchedFeature) {
        const properties = matchedFeature.properties as any;
        if (properties.ward_id) {
          const { data: wardData } = await supabase
            .from('wards')
            .select('id')
            .eq('city_id', cityData.id)
            .eq('ward_number', properties.ward_id)
            .single();
          
          if (wardData) {
            dbWardId = wardData.id;
          }
        }
      }

      // Upload photo if present
      let photoUrls: string[] = [];
      if (photo) {
        const fileName = `${Date.now()}-${photo.name}`;
        const { error: uploadError } = await supabase.storage
          .from('report-photos')
          .upload(fileName, photo);
        if (!uploadError) {
          const { data: urlData } = supabase.storage
            .from('report-photos')
            .getPublicUrl(fileName);
          if (urlData) photoUrls.push(urlData.publicUrl);
        }
      }

      // Insert into Supabase
      const { data: insertedReport, error } = await supabase
        .from('reports')
        .insert({
          city_id: cityData.id,
          ward_id: dbWardId,
          category_id: catData.id,
          latitude,
          longitude,
          description: description || null,
          severity: 'medium',
          photo_urls: photoUrls,
          device_fingerprint: fingerprint,
        })
        .select('*')
        .single();

      if (error) {
        console.error('Submit failed:', error);
        return;
      }

      // Add to local store immediately
      if (insertedReport) {
        const fullReport = {
          ...insertedReport,
          category_id: selectedCategory,
          ward_id: dbWardId,
          location: { lat: insertedReport.latitude, lng: insertedReport.longitude },
          cleanup_photo_urls: [],
          cleanup_submitted_at: null,
          cleanup_verified_at: null,
          resolved_after_days: null,
          ip_hash: null,
          is_flagged: false,
          flag_reason: null,
          duplicate_of: null,
        };
        addReport(fullReport);
        console.log('Setting submitted report (Supabase):', fullReport);
        setSubmittedReport(fullReport);
      } else {
        // Fallback for mock if supabase fails or is not used
        console.log('Setting submitted report (Mock)');
        setSubmittedReport({
          id: 'mock-id',
          category_id: selectedCategory,
          location: { lat: latitude, lng: longitude },
          address: null,
          landmark: null,
          ward_id: dbWardId,
          description: description || null,
          severity: 'medium',
          status: 'submitted',
          upvote_count: 0,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
          city_id: 'mock-city',
          photo_urls: photoUrls,
          cleanup_photo_urls: [],
          cleanup_submitted_at: null,
          cleanup_verified_at: null,
          resolved_after_days: null,
          device_fingerprint: fingerprint,
          ip_hash: null,
          is_flagged: false,
          flag_reason: null,
          duplicate_of: null,
        });
      }

      setSuccess(true);
      setTimeout(() => {
        setShowReportForm(false);
        setSuccess(false);
        resetForm();
        console.log('Opening success sheet!');
        setShowSuccessSheet(true);
      }, 1000);
    } catch (err) {
      console.error('Submit failed:', err);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <BottomSheet
      isOpen={showReportForm}
      onClose={() => setShowReportForm(false)}
      title="Report an Issue"
      tall
    >
      <div className="report-form">
        {success ? (
          <div className="report-form__success">
            <span className="report-form__success-icon">✅</span>
            <p>Report submitted successfully!</p>
          </div>
        ) : (
          <>
            {/* Photo Capture */}
            <div className="report-form__photo">
              <input
                ref={fileRef}
                type="file"
                accept="image/*"
                capture="environment"
                onChange={handlePhotoChange}
                style={{ display: 'none' }}
              />
              {photoPreview ? (
                <div className="report-form__preview">
                  <img src={photoPreview} alt="Preview" />
                  <button
                    className="report-form__preview-remove"
                    onClick={removePhoto}
                    type="button"
                    aria-label="Remove photo"
                  >
                    ✕
                  </button>
                  <button
                    className="report-form__preview-change"
                    onClick={() => fileRef.current?.click()}
                    type="button"
                  >
                    📷 Retake
                  </button>
                </div>
              ) : (
                <button className="report-form__capture-btn" onClick={() => fileRef.current?.click()}>
                  📸 Take Photo
                </button>
              )}
            </div>

            {/* Category Picker */}
            <div className="report-form__categories">
              <p className="report-form__label">Category</p>
              <div className="report-form__pills">
                {CATEGORIES.map((cat) => (
                  <button
                    key={cat.slug}
                    className={`report-form__pill ${selectedCategory === cat.slug ? 'report-form__pill--active' : ''}`}
                    onClick={() => setSelectedCategory(cat.slug)}
                    style={selectedCategory === cat.slug ? { backgroundColor: cat.color, color: '#fff' } : {}}
                  >
                    {cat.icon} {cat.shortName}
                  </button>
                ))}
              </div>
            </div>

            {/* Description */}
            <div className="report-form__field">
              <textarea
                className="report-form__textarea"
                placeholder="Describe the issue (optional)"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                rows={3}
              />
            </div>

            {/* GPS Status */}
            <div className="report-form__gps">
              {latitude && longitude ? (
                <span className="report-form__gps-ok">📍 Location detected</span>
              ) : (
                <button className="report-form__gps-btn" onClick={locate} disabled={gpsLoading}>
                  {gpsLoading ? '⏳ Getting location...' : '📍 Get Location'}
                </button>
              )}
            </div>

            {/* Error Message for GBA Bounds */}
            {outOfBoundsError && (
              <div className="report-form__error" style={{ background: '#fef2f2', padding: '12px', borderRadius: '8px', borderLeft: '4px solid #ef4444' }}>
                <p style={{ color: '#991b1b', fontSize: '13px', margin: 0, fontWeight: 500 }}>
                  📍 This location is outside the Greater Bengaluru Authority (GBA) area. NammaDooru currently covers only the 369 GBA wards. We're working on expanding to other areas.
                </p>
              </div>
            )}

            {/* Submit */}
            <button
              className="report-form__submit"
              onClick={handleSubmit}
              disabled={!selectedCategory || submitting}
            >
              {submitting ? 'Submitting...' : 'Submit Report'}
            </button>
          </>
        )}
      </div>
    </BottomSheet>
  );
}
