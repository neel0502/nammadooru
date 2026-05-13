import { getDepartment, whatsappComplaintLink } from '../../lib/departments';
import type { Report } from '../../types';

interface Props {
  report: Report;
  categoryName: string;
  categoryColor: string;
  wardName?: string;
  wardNumber?: string;
  acName?: string;
}

export function DepartmentCard({ report, categoryName, categoryColor, wardName, wardNumber, acName }: Props) {
  const dept = getDepartment(report.category_id);
  if (!dept) return null;

  const reportUrl = `${window.location.origin}/report/${report.id}`;
  const date = new Date(report.created_at).toLocaleDateString('en-IN', {
    day: 'numeric', month: 'short', year: 'numeric'
  });

  const waLink = whatsappComplaintLink(dept.whatsapp, {
    title: report.description || categoryName,
    address: report.address || undefined,
    wardName,
    wardNumber,
    acName,
    category: categoryName,
    date,
    reportUrl,
  });

  return (
    <div className="dept-card" style={{ borderLeftColor: categoryColor }}>
      <div className="dept-card__header">
        <span className="dept-card__name">{dept.shortName}</span>
        <span className="dept-card__full">{dept.name}</span>
      </div>
      <div className="dept-card__actions">
        <a href={`tel:${dept.call}`} className="dept-card__btn dept-card__btn--call">
          📞 Call {dept.call}
        </a>
        <a
          href={waLink}
          target="_blank"
          rel="noopener noreferrer"
          className="dept-card__btn dept-card__btn--wa"
        >
          💬 WhatsApp
        </a>
      </div>
      {dept.extras && dept.extras.length > 0 && (
        <div className="dept-card__extras">
          {dept.extras.map((ex) => (
            <a
              key={ex.number}
              href={`tel:${ex.number}`}
              className="dept-card__extra"
            >
              📞 {ex.label}: {ex.number}
            </a>
          ))}
        </div>
      )}
    </div>
  );
}
