import { TopBar } from '../components/common/TopBar';
import { FilterBar } from '../components/common/FilterBar';
import { MapView } from '../components/map/MapView';
import { IssueList } from '../components/list/IssueList';
import { WardSheet } from '../components/ward/WardSheet';
import { ReportDetail } from '../components/report/ReportDetail';
import { ReportForm } from '../components/report/ReportForm';
import { useAppStore } from '../store/useAppStore';
import { useRealtime } from '../hooks/useRealtime';

export function Home() {
  const { viewMode, showReportForm, setShowReportForm, showWardSheet, showReportDetail } = useAppStore();
  useRealtime();

  const anySheetOpen = showReportForm || showWardSheet || showReportDetail;

  return (
    <div className="home">
      <TopBar />
      <FilterBar />
      <main className="home__main">
        {viewMode === 'map' ? <MapView /> : <IssueList />}
      </main>
      {!anySheetOpen && (
        <button
          className="report-cta"
          onClick={() => setShowReportForm(true)}
        >
          📸 Report an Issue
        </button>
      )}
      <WardSheet />
      <ReportDetail />
      <ReportForm />
    </div>
  );
}
