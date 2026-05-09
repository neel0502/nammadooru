interface Props {
  open: number;
  resolved: number;
  total: number;
}

export function WardStats({ open, resolved, total }: Props) {
  return (
    <div className="ward-stats">
      <div className="ward-stats__item ward-stats__item--active">
        <span className="ward-stats__count">{open}</span>
        <span className="ward-stats__label">Active</span>
      </div>
      <div className="ward-stats__item ward-stats__item--resolved">
        <span className="ward-stats__count">{resolved}</span>
        <span className="ward-stats__label">Resolved</span>
      </div>
      <div className="ward-stats__item ward-stats__item--total">
        <span className="ward-stats__count">{total}</span>
        <span className="ward-stats__label">Total</span>
      </div>
    </div>
  );
}
