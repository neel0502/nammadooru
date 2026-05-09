import { GeoJSON } from 'react-leaflet';
import { useAppStore } from '../../store/useAppStore';
import { COLORS } from '../../lib/constants';
import type { Feature } from 'geojson';
import type { Layer, PathOptions } from 'leaflet';
import type { WardFeatureProperties } from '../../types';
import { useMemo } from 'react';

interface Props {
  data: GeoJSON.FeatureCollection;
}

export function WardLayer({ data }: Props) {
  const { setSelectedWard, reports } = useAppStore();

  // Count reports per ward_id (GeoJSON ward_id number) for choropleth
  const reportCounts = useMemo(() => {
    const counts: Record<string, number> = {};
    reports.forEach((r) => {
      if (r.ward_id) {
        counts[r.ward_id] = (counts[r.ward_id] || 0) + 1;
      }
    });
    return counts;
  }, [reports]);

  const maxCount = useMemo(() => Math.max(...Object.values(reportCounts), 1), [reportCounts]);

  const style = (feature?: Feature): PathOptions => {
    const props = feature?.properties as WardFeatureProperties;
    const wardId = props?.ward_id?.toString() || '';
    const count = reportCounts[wardId] || 0;
    const intensity = maxCount > 0 ? Math.min(count / maxCount, 1) : 0;
    // Base: 8% opacity, scale up to max 20% opacity with reports
    const opacity = 0.08 + intensity * 0.12;

    return {
      color: COLORS.wardBorder,
      weight: 1.5,
      dashArray: '6,4',
      fillColor: COLORS.wardFill,   // #dc2626 red
      fillOpacity: opacity,
    };
  };

  const onEachFeature = (feature: Feature, layer: Layer) => {
    const props = feature.properties as WardFeatureProperties;
    const wardId = props.ward_id?.toString() || '';
    const count = reportCounts[wardId] || 0;
    // Parse ward name: "25 - Vinayaka Layout" → "Vinayaka Layout"
    const displayName = props.ward_name?.includes(' - ')
      ? props.ward_name.split(' - ').slice(1).join(' - ')
      : props.ward_name || 'Unknown';

    layer.bindTooltip(
      `<div style="font-family:'DM Sans',sans-serif;font-size:13px">
        <strong>${displayName}</strong> (#${props.ward_id})<br/>
        <span style="color:#666">${props.Corporation} · ${props.ac}</span><br/>
        <span style="color:#888">Pop: ${(props.TOT_P || 0).toLocaleString()}</span>
        ${count > 0 ? `<br/><span style="color:#dc2626">${count} report${count !== 1 ? 's' : ''}</span>` : ''}
      </div>`,
      { sticky: true, className: 'ward-tooltip' }
    );

    layer.on({
      mouseover: (e) => {
        const target = e.target;
        target.setStyle({
          fillOpacity: 0.4,
          weight: 2.5,
          dashArray: '',
        });
      },
      mouseout: (e) => {
        const target = e.target;
        target.setStyle(style(feature));
      },
      click: () => {
        setSelectedWard(feature as any);
      },
    });
  };

  return <GeoJSON key={JSON.stringify(reportCounts)} data={data} style={style} onEachFeature={onEachFeature} />;
}
