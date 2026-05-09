import { useMap } from 'react-leaflet';
import { useGeolocation } from '../../hooks/useGeolocation';
import { useAppStore } from '../../store/useAppStore';
import { useEffect } from 'react';

export function LocateButton() {
  const map = useMap();
  const { latitude, longitude, loading, locate } = useGeolocation();
  const setUserLocation = useAppStore((s) => s.setUserLocation);

  useEffect(() => {
    if (latitude && longitude) {
      setUserLocation({ lat: latitude, lng: longitude });
      map.flyTo([latitude, longitude], 15, { duration: 1 });
    }
  }, [latitude, longitude, map, setUserLocation]);

  return (
    <div className="locate-button-container">
      <button
        className="locate-button"
        onClick={locate}
        disabled={loading}
        title="Find my location"
        aria-label="Find my location"
      >
        {loading ? (
          <svg className="locate-spinner" viewBox="0 0 24 24" width="20" height="20">
            <circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="2" fill="none" strokeDasharray="30 70" />
          </svg>
        ) : (
          <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" strokeWidth="2">
            <circle cx="12" cy="12" r="3" />
            <path d="M12 2v4M12 18v4M2 12h4M18 12h4" />
          </svg>
        )}
      </button>
    </div>
  );
}
