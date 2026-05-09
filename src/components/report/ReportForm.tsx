import { useState, useRef } from 'react';
import { BottomSheet } from '../common/BottomSheet';
import { useAppStore } from '../../store/useAppStore';
import { useGeolocation } from '../../hooks/useGeolocation';
import { useFingerprint } from '../../hooks/useFingerprint';
import { CATEGORIES } from '../../lib/constants';
import { supabase } from '../../lib/supabase';

export function ReportForm() {
  const { showReportForm, setShowReportForm, addReport } = useAppStore();
  const { latitude, longitude, loading: gpsLoading, locate } = useGeolocation();
  const fingerprint = useFingerprint();

  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [description, setDescription] = useState('');
  const [photo, setPhoto] = useState<File | null>(null);
  const [photoPreview, setPhotoPreview] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const [success, setSuccess] = useState(false);
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

  const handleSubmit = async () => {
    if (!selectedCategory) return;
    if (!latitude || !longitude) {
      locate();
      return;
    }

    setSubmitting(true);

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
          category_id: catData.id,
          latitude,
          longitude,
          description: description || CATEGORIES.find(c => c.slug === selectedCategory)?.name || 'New report',
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
        addReport({
          ...insertedReport,
          category_id: selectedCategory,
          location: { lat: insertedReport.latitude, lng: insertedReport.longitude },
          cleanup_photo_urls: [],
          cleanup_submitted_at: null,
          cleanup_verified_at: null,
          resolved_after_days: null,
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
        setSelectedCategory(null);
        setDescription('');
        removePhoto();
      }, 1500);
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
