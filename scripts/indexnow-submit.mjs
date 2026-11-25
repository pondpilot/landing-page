// Submits every URL in the live sitemap to IndexNow (Bing / Copilot, Yandex, Seznam).
//
// IndexNow tells Bing which URLs to (re)crawl instead of waiting for its own schedule.
// Same setup as the sibling sites (getantares.io, lakesentry.io, secondstack.ai).
//
// Reads the LIVE sitemap rather than _site/ so it runs independently of the
// GitHub Pages build. IndexNow only hands Bing a URL list and Bing crawls later,
// so a list that is a few minutes stale is harmless.
//
// The key must match the <KEY>.txt file at the repo root, which Jekyll copies to
// the site root as-is. IndexNow verifies ownership by fetching it. One key per
// host: reusing another site's key returns 403 UserForbiddedToAccessSite.
//
// Usage: node scripts/indexnow-submit.mjs

const HOST = 'pondpilot.io'
const KEY = '2a063aa0eded51d167f132b5f42c2e99'
const SITEMAP = `https://${HOST}/sitemap.xml`
const KEY_LOCATION = `https://${HOST}/${KEY}.txt`
const ENDPOINT = 'https://api.indexnow.org/indexnow'

// Cache-busting query so a CDN copy from before the deploy is not used for the checks.
const bust = `?indexnow=${Date.now()}`

// Check the key file CONTENT, not just the status: a missing file can still answer 200
// with an HTML page on some hosts.
const keyRes = await fetch(KEY_LOCATION + bust)
const keyBody = keyRes.ok ? (await keyRes.text()).trim() : ''
if (keyBody !== KEY) {
  console.error(`indexnow: ${KEY_LOCATION} is not serving the key (HTTP ${keyRes.status})`)
  process.exit(1)
}

const sitemapRes = await fetch(SITEMAP + bust)
if (!sitemapRes.ok) {
  console.error(`indexnow: could not fetch ${SITEMAP} (HTTP ${sitemapRes.status})`)
  process.exit(1)
}

const xml = await sitemapRes.text()
const urlList = [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1].trim())

if (urlList.length === 0) {
  console.error(`indexnow: no <loc> entries found in ${SITEMAP}`)
  process.exit(1)
}

const res = await fetch(ENDPOINT, {
  method: 'POST',
  headers: { 'Content-Type': 'application/json; charset=utf-8' },
  body: JSON.stringify({ host: HOST, key: KEY, keyLocation: KEY_LOCATION, urlList }),
})

// 200 = accepted. 202 = accepted, key validation still pending.
// A fresh key returns 202 for a minute or two; that is not a failure.
if (res.ok || res.status === 202) {
  console.log(`indexnow: submitted ${urlList.length} URLs (HTTP ${res.status})`)
} else {
  console.error(`indexnow: HTTP ${res.status}: ${await res.text()}`)
  process.exit(1)
}
