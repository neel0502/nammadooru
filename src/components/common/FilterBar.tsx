import { useAppStore } from '../../store/useAppStore';
import { CATEGORIES, SEVERITY_LABELS } from '../../lib/constants';
import type { SeverityLevel, ReportStatus } from '../../types';

const STATUSES: { value: ReportStatus; label: string }[] = [
  { value: 'submitted', label: 'Submitted' },
  { value: 'verified', label: 'Verified' },
  { value: 'escalated', label: 'Escalated' },
  { value: 'in_progress', label: 'In Progress' },
  { value: 'resolved', label: 'Resolved' },
];

export function FilterBar() {
  const { filters, setSeverityFilter, setStatusFilter, toggleCategory, viewMode, toggleView } = useAppStore();

  return (
    <div className="filter-bar">
      <div className="filter-bar__dropdowns">
        <select
          className="filter-bar__select"
          value={filters.severity || ''}
          onChange={(e) => setSeverityFilter((e.target.value || null) as SeverityLevel | null)}
        >
          <option value="">All Severity</option>
          {(Object.entries(SEVERITY_LABELS) as [SeverityLevel, string][]).map(([key, label]) => (
            <option key={key} value={key}>{label}</option>
          ))}
        </select>

        <select
          className="filter-bar__select"
          value={filters.status || ''}
          onChange={(e) => setStatusFilter((e.target.value || null) as ReportStatus | null)}
        >
          <option value="">All Status</option>
          {STATUSES.map((s) => (
            <option key={s.value} value={s.value}>{s.label}</option>
          ))}
        </select>
      </div>

      <div className="filter-bar__categories">
        {CATEGORIES.map((cat) => (
          <button
            key={cat.slug}
            className={`filter-bar__pill ${filters.categories.includes(cat.slug) ? 'filter-bar__pill--active' : ''}`}
            onClick={() => toggleCategory(cat.slug)}
            style={filters.categories.includes(cat.slug) ? { backgroundColor: cat.color, color: '#fff' } : {}}
            title={cat.name}
          >
            <span>{cat.icon}</span>
          </button>
        ))}

        <button className="filter-bar__toggle" onClick={toggleView}>
          {viewMode === 'map' ? '📋 List' : '🗺️ Map'}
        </button>
      </div>
    </div>
  );
}
