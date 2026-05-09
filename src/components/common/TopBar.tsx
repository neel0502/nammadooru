export function TopBar() {
  return (
    <header className="top-bar">
      <div className="top-bar__left">
        <h1 className="top-bar__logo">
          <span className="top-bar__logo-icon">📢</span>
          <span className="top-bar__logo-text">NammaDooru</span>
        </h1>
      </div>
      <div className="top-bar__right">
        <span className="top-bar__constituency">Byatarayanapura</span>
        <span className="top-bar__zone">North</span>
      </div>
    </header>
  );
}
