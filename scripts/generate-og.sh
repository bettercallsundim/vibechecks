#!/usr/bin/env bash
# Render og.html → og-image.png at 1200x630 using headless Chromium.
# Run from repo root: bash scripts/generate-og.sh
set -euo pipefail

OUT="og-image.png"
SRC="$(pwd)/og.html"
[ -f "$SRC" ] || { echo "og.html not found at repo root"; exit 1; }

# Pick a Chromium binary that exists on this system.
for bin in google-chrome chromium chromium-browser chrome \
           "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           "/Applications/Chromium.app/Contents/MacOS/Chromium"; do
  if command -v "$bin" >/dev/null 2>&1 || [ -x "$bin" ]; then
    CHROME="$bin"; break
  fi
done

if [ -z "${CHROME:-}" ]; then
  echo "No Chromium/Chrome found. Install one, or use:"
  echo "  npx playwright install chromium && node scripts/generate-og.js"
  exit 1
fi

"$CHROME" \
  --headless \
  --disable-gpu \
  --hide-scrollbars \
  --window-size=1200,630 \
  --screenshot="$(pwd)/$OUT" \
  "file://$SRC" \
  >/dev/null 2>&1

echo "✓ Wrote $OUT ($(du -h "$OUT" | cut -f1))"
echo "  Sanity check: open $OUT and verify it looks right before pushing."
