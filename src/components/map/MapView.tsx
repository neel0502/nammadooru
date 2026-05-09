import { useEffect, useState, useMemo } from 'react';
import { MapContainer, TileLayer, ZoomControl, GeoJSON } from 'react-leaflet';
import { union, mask } from '@turf/turf';
import { MAP_BOUNDS, MAP_MAX_BOUNDS, MAP_MIN_ZOOM, MAP_MAX_ZOOM, TILE_URL, TILE_ATTRIBUTION } from '../../lib/constants';
import { useAppStore } from '../../store/useAppStore';
import { WardLayer } from './WardLayer';
import { ReportMarkers } from './ReportMarkers';
import { LocateButton } from './LocateButton';
import 'leaflet/dist/leaflet.css';

export function MapView() {
  const setWardsGeoJSON = useAppStore((s) => s.setWardsGeoJSON);
  const [geoData, setGeoData] = useState<GeoJSON.FeatureCollection | null>(null);

  // Compute inverted mask once when geoData loads
  const maskGeoJSON = useMemo(() => {
    if (!geoData) return null;
    try {
      const unioned = union(geoData as any);
      if (!unioned) return null;
      return mask(unioned);
    } catch (err) {
      console.error('Failed to generate GBA mask:', err);
      return null;
    }
  }, [geoData]);

  useEffect(() => {
    // Load GeoJSON after a short delay so map tiles render first.
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
        bounds={MAP_BOUNDS}
        maxBounds={MAP_MAX_BOUNDS}
        maxBoundsViscosity={1.0}
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
        
        {/* Render GBA mask (dimmed area outside boundaries) */}
        {maskGeoJSON && (
          <GeoJSON
            data={maskGeoJSON}
            style={{
              fillColor: '#ffffff',
              fillOpacity: 0.6,
              color: '#dc2626', // Solid red line for GBA boundary
              weight: 2.5,
              opacity: 1,
              dashArray: '',    // Solid line (no dash)
              className: 'gba-mask',
            }}
            interactive={false}
          />
        )}

        <ZoomControl position="bottomright" />
        {geoData && <WardLayer data={geoData} />}
        <ReportMarkers />
        <LocateButton />
      </MapContainer>
    </div>
  );
}
