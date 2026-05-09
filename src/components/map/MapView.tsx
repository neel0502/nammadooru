import { useEffect, useState } from 'react';
import { MapContainer, TileLayer, ZoomControl } from 'react-leaflet';
import { MAP_CENTER, MAP_ZOOM, MAP_MIN_ZOOM, MAP_MAX_ZOOM, TILE_URL, TILE_ATTRIBUTION } from '../../lib/constants';
import { useAppStore } from '../../store/useAppStore';
import { WardLayer } from './WardLayer';
import { ReportMarkers } from './ReportMarkers';
import { LocateButton } from './LocateButton';
import 'leaflet/dist/leaflet.css';

export function MapView() {
  const setWardsGeoJSON = useAppStore((s) => s.setWardsGeoJSON);
  const [geoData, setGeoData] = useState<GeoJSON.FeatureCollection | null>(null);

  useEffect(() => {
    // Load GeoJSON after a short delay so map tiles render first.
    // Use setTimeout as a universal fallback (requestIdleCallback is NOT in Safari).
    const timer = setTimeout(() => {
      fetch('/data/bengaluru-wards.geojson')
        .then((r) => r.json())
        .then((data: GeoJSON.FeatureCollection) => {
          setGeoData(data);
          setWardsGeoJSON(data);
        })
        .catch((err) => console.error('Failed to load ward boundaries:', err));
    }, 100);
    return () => clearTimeout(timer);
  }, [setWardsGeoJSON]);

  return (
    <div className="map-container">
      <MapContainer
        center={MAP_CENTER}
        zoom={MAP_ZOOM}
        minZoom={MAP_MIN_ZOOM}
        maxZoom={MAP_MAX_ZOOM}
        zoomControl={false}
        style={{ height: '100%', width: '100%' }}
        className="nammadooru-map"
        /* @ts-expect-error Leaflet typing */
        tap={false}
        touchZoom={true}
        dragging={true}
        bounceAtZoomLimits={false}
      >
        <TileLayer url={TILE_URL} attribution={TILE_ATTRIBUTION} />
        <ZoomControl position="bottomright" />
        {geoData && <WardLayer data={geoData} />}
        <ReportMarkers />
        <LocateButton />
      </MapContainer>
    </div>
  );
}
