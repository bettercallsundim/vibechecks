// Fallback OG renderer using Playwright. Use if no system Chromium.
//   npm i -D playwright && npx playwright install chromium
//   node scripts/generate-og.js
const { chromium } = require("playwright");
const path = require("path");

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 1200, height: 630 } });
  const src = "file://" + path.resolve(__dirname, "..", "og.html");
  await page.goto(src, { waitUntil: "networkidle" });
  // give webfonts a beat to settle
  await page.waitForTimeout(400);
  await page.screenshot({
    path: path.resolve(__dirname, "..", "og-image.png"),
    clip: { x: 0, y: 0, width: 1200, height: 630 },
  });
  await browser.close();
  console.log("✓ Wrote og-image.png");
})();
