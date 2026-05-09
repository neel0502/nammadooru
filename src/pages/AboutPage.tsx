export function AboutPage() {
  return (
    <div style={{ padding: 24, fontFamily: "'DM Sans', sans-serif", maxWidth: 600, margin: '0 auto' }}>
      <h1>About NammaDooru</h1>
      <p><strong>ನಮ್ಮ ದೂರು</strong> — "Our Complaint" in Kannada</p>
      <p>
        NammaDooru is an anonymous, map-first civic complaints platform for Bengaluru.
        Report issues like garbage, potholes, water supply problems, broken streetlights,
        drainage issues, and encroachments — and see which elected officials are accountable.
      </p>
      <h2>How it works</h2>
      <ol>
        <li>📸 Take a photo of the issue</li>
        <li>📍 Your GPS location is auto-detected</li>
        <li>🏷️ Choose a category</li>
        <li>✅ Submit — it appears on the map instantly</li>
      </ol>
      <h2>Accountability</h2>
      <p>Every ward maps to a Corporator → MLA → MP chain. We show you who's responsible.</p>
      <p style={{ marginTop: 24 }}><a href="/">← Back to Map</a></p>
    </div>
  );
}
