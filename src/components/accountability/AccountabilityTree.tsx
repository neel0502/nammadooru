import { OfficialCard } from './OfficialCard';
import type { OfficialInfo } from '../../lib/accountability-data';

interface Props {
  corporator: OfficialInfo | null;
  mla: OfficialInfo | null;
  mp: OfficialInfo | null;
  acName?: string;
  pcName?: string;
}

export function AccountabilityTree({ corporator, mla, mp, acName, pcName }: Props) {
  return (
    <div className="accountability-tree">
      {/* Corporator — always show, TBD if not available */}
      <OfficialCard
        role="Corporator"
        name={corporator?.name || 'TBD (GBA Elections Pending)'}
        party={corporator?.party || ''}
        since={corporator?.since}
        phone={corporator?.phone}
        email={corporator?.email}
        whatsapp={corporator?.whatsapp}
      />

      {/* MLA */}
      {mla && (
        <>
          <div className="accountability-tree__connector">
            <svg width="20" height="24" viewBox="0 0 20 24" fill="none">
              <path d="M10 0v20M4 14l6 6 6-6" stroke="#ccc" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </div>
          <OfficialCard
            role={acName ? `MLA · ${acName}` : 'MLA'}
            name={mla.name}
            party={mla.party}
            since={mla.since}
            phone={mla.phone}
            email={mla.email}
            whatsapp={mla.whatsapp}
          />
        </>
      )}

      {/* MP */}
      {mp && (
        <>
          <div className="accountability-tree__connector">
            <svg width="20" height="24" viewBox="0 0 20 24" fill="none">
              <path d="M10 0v20M4 14l6 6 6-6" stroke="#ccc" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
          </div>
          <OfficialCard
            role={pcName ? `MP · ${pcName}` : 'MP'}
            name={mp.name}
            party={mp.party}
            since={mp.since}
            phone={mp.phone}
            email={mp.email}
            whatsapp={mp.whatsapp}
          />
        </>
      )}
    </div>
  );
}
