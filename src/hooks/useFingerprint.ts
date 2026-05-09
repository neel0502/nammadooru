// ============================================================
// NammaDooru — Device Fingerprint Hook
// ============================================================

import { useState, useEffect } from 'react';
import FingerprintJS from '@fingerprintjs/fingerprintjs';

/**
 * Returns a stable device fingerprint for anonymous rate limiting.
 */
export function useFingerprint() {
  const [visitorId, setVisitorId] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;

    FingerprintJS.load()
      .then((fp) => fp.get())
      .then((result) => {
        if (!cancelled) {
          setVisitorId(result.visitorId);
        }
      })
      .catch(() => {
        // Fallback: generate a random ID and store in localStorage
        if (!cancelled) {
          let stored = localStorage.getItem('nd_device_id');
          if (!stored) {
            stored = crypto.randomUUID();
            localStorage.setItem('nd_device_id', stored);
          }
          setVisitorId(stored);
        }
      });

    return () => {
      cancelled = true;
    };
  }, []);

  return visitorId;
}
