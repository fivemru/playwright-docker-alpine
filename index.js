const { chromium } = require('playwright-chromium');

async function run() {
  const browser = await chromium.launch({
    executablePath: process.env.CHROME_BIN,
  });

  const page = await browser.newPage();
  page.setViewportSize({ width: 600, height: 400 });

  const res = await page.goto('https://ifconfig.io/ip');
  await page.screenshot({ path: `./screen.png` });

  const body = await res.body();

  console.log('body', body.toString());

  await browser.close();
}

run();
