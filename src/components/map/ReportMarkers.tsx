import { CircleMarker, Popup, useMap, useMapEvents } from 'react-leaflet';
import { useState, useMemo } from 'react';
import { useReports } from '../../hooks/useReports';
import { useAppStore } from '../../store/useAppStore';
import { CATEGORY_COLOR_MAP, CATEGORY_ICON_MAP, COLORS } from '../../lib/constants';
import { timeAgo } from '../../lib/geo';

// Simple grid-based clustering
function clusterReports(reports: any[], zoom: number) {
  if (zoom >= 14) return { clusters: [], singles: reports }; // Show individual at zoom 14+

  const cellSize = 0.02 / Math.pow(2, zoom - 10); // Adaptive grid size
  const grid: Record<string, { lat: number; lng: number; reports: any[] }> = {};

  reports.forEach((r) => {
    const gx = Math.floor(r.location.lat / cellSize);
    const gy = Math.floor(r.location.lng / cellSize);
    const key = `${gx}_${gy}`;
    if (!grid[key]) {
      grid[key] = { lat: 0, lng: 0, reports: [] };
    }
    grid[key].reports.push(r);
    grid[key].lat += r.location.lat;
    grid[key].lng += r.location.lng;
  });

  const clusters: { lat: number; lng: number; count: number; reports: any[] }[] = [];
  const singles: any[] = [];

  Object.values(grid).forEach((cell) => {
    if (cell.reports.length >= 2) {
      clusters.push({
        lat: cell.lat / cell.reports.length,
        lng: cell.lng / cell.reports.length,
        count: cell.reports.length,
        reports: cell.reports,
      });
    } else {
      singles.push(...cell.reports);
    }
  });

  return { clusters, singles };
}

export function ReportMarkers() {
  const { reports } = useReports();
  const setSelectedReport = useAppStore((s) => s.setSelectedReport);
  const map = useMap();
  const [zoom, setZoom] = useState(map.getZoom());

  useMapEvents({
    zoomend: () => setZoom(map.getZoom()),
  });

  const { clusters, singles } = useMemo(
    () => clusterReports(reports, zoom),
    [reports, zoom]
  );

  return (
    <>
      {/* Cluster markers — dark maroon circles with white count */}
      {clusters.map((cluster, i) => {
        const radius = Math.min(12 + Math.sqrt(cluster.count) * 4, 32);
        return (
          <CircleMarker
            key={`cluster-${i}`}
            center={[cluster.lat, cluster.lng]}
            radius={radius}
            pathOptions={{
              color: COLORS.clusterMaroon,
              fillColor: COLORS.clusterMaroon,
              fillOpacity: 0.9,
              weight: 2,
            }}
            eventHandlers={{
              click: () => {
                map.flyTo([cluster.lat, cluster.lng], Math.min(zoom + 2, 16), {
                  duration: 0.5,
                });
              },
            }}
          >
            <Popup className="cluster-popup" closeButton={false}>
              <div
                style={{
                  fontFamily: "'DM Sans', sans-serif",
                  textAlign: 'center',
                  padding: '4px 8px',
                }}
              >
                <strong style={{ fontSize: 16, color: COLORS.clusterMaroon }}>
                  {cluster.count}
                </strong>
                <span style={{ fontSize: 12, color: '#666', display: 'block' }}>
                  reports in this area
                </span>
              </div>
            </Popup>
          </CircleMarker>
        );
      })}

      {/* Individual markers — small colored dots by category */}
      {singles.map((report) => {
        const color = CATEGORY_COLOR_MAP[report.category_id] || '#6b7280';
        const icon = CATEGORY_ICON_MAP[report.category_id] || '📌';

        return (
          <CircleMarker
            key={report.id}
            center={[report.location.lat, report.location.lng]}
            radius={zoom >= 15 ? 7 : 5}
            pathOptions={{
              color: '#fff',
              fillColor: color,
              fillOpacity: 0.9,
              weight: 1.5,
            }}
            eventHandlers={{
              click: () => {
                setSelectedReport(report);
                map.flyTo([report.location.lat, report.location.lng], 15, {
                  duration: 0.5,
                });
              },
            }}
          >
            <Popup className="report-popup" closeButton={false}>
              <div style={{ fontFamily: "'DM Sans', sans-serif", minWidth: 180 }}>
                <div style={{ fontSize: 14, fontWeight: 600, marginBottom: 4 }}>
                  {icon} {report.description?.slice(0, 50)}
                </div>
                <div style={{ fontSize: 12, color: '#666' }}>
                  {report.address} · {timeAgo(report.created_at)}
                </div>
                <div style={{ fontSize: 12, color: '#888', marginTop: 4 }}>
                  👍 {report.upvote_count} upvotes
                </div>
              </div>
            </Popup>
          </CircleMarker>
        );
      })}
    </>
  );
}
