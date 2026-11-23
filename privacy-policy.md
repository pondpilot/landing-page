---
layout: page
title: "Privacy Policy"
permalink: /privacy-policy/
last_modified_at: 2026-11-23
---

Effective November 23, 2026.

This policy covers pondpilot.io, the marketing site for PondPilot. Dark Lake, LLC ("we") operates the site. Send questions and privacy requests to [hello@pondpilot.io](mailto:hello@pondpilot.io).

## Summary

pondpilot.io has no forms and no accounts, and we do not collect email addresses on it. We do not sell data. Two tools measure visits: Cloudflare Web Analytics counts page views without cookies, and Google Analytics sets cookies only after you click "Accept" in the cookie banner.

## The PondPilot app {#the-pondpilot-app}

The PondPilot app at [app.pondpilot.io](https://app.pondpilot.io) runs in your browser. DuckDB-WASM processes your files and query results on your device, and the app never uploads them. The app has no accounts, and its open-source code contains no analytics SDK. Cloudflare Pages serves the hosted app and adds the cookieless page-view counter described below.

The app contacts other servers only for features you start yourself. Querying a remote source fetches that source, in some cases through our CORS proxy. The optional AI assistant sends your prompt, your SQL and your table schema to the AI provider you select.

## What the site collects {#what-the-site-collects}

**Hosting.** GitHub Pages serves pondpilot.io behind the Fastly CDN. These providers process standard request data, such as your IP address and user agent, to deliver the pages.

**Cloudflare Web Analytics.** A Cloudflare script counts page views. It does not use cookies.

**Google Analytics 4.** We load Google Analytics through Google Tag Manager with Google Consent Mode v2. What it does depends on your choice in the cookie banner.

- Before you choose, and if you decline, Google Analytics sets no analytics cookies and stores no identifiers on your device. Google still receives cookieless signals about your visit.
- After you click "Accept", Google Analytics sets the cookies listed below. We use them to measure visits, pages viewed, and clicks on links to the app, the widget, GitHub, npm and FlowScope.

We never enable advertising storage or ad personalization, and Google signals are off. Google Analytics retains data for 14 months. We also export that data to BigQuery on Google Cloud for Dark Lake's internal reporting.

## Cookies

<div class="cookie-table-wrap">
<table class="cookie-table" role="table">
<thead role="rowgroup">
<tr role="row"><th role="columnheader" scope="col">Name</th><th role="columnheader" scope="col">Set by</th><th role="columnheader" scope="col">Purpose</th><th role="columnheader" scope="col">Lifetime</th></tr>
</thead>
<tbody role="rowgroup">
<tr role="row">
<td role="cell" data-label="Name"><code>_ga</code></td>
<td role="cell" data-label="Set by">Google&nbsp;Analytics, after&nbsp;“Accept”</td>
<td role="cell" data-label="Purpose">Distinguishes one visitor from&nbsp;another</td>
<td role="cell" data-label="Lifetime">Up to&nbsp;2&nbsp;years</td>
</tr>
<tr role="row">
<td role="cell" data-label="Name"><code>_ga_00W4N6QTDN</code></td>
<td role="cell" data-label="Set by">Google&nbsp;Analytics, after&nbsp;“Accept”</td>
<td role="cell" data-label="Purpose">Keeps the state of&nbsp;your&nbsp;session</td>
<td role="cell" data-label="Lifetime">Up to&nbsp;2&nbsp;years</td>
</tr>
<tr role="row">
<td role="cell" data-label="Name"><code>pp_cookie_consent</code></td>
<td role="cell" data-label="Set by">pondpilot.io, in&nbsp;your browser’s localStorage (not&nbsp;a&nbsp;cookie)</td>
<td role="cell" data-label="Purpose">Remembers whether you accepted or&nbsp;declined</td>
<td role="cell" data-label="Lifetime">Until you change it or&nbsp;clear site&nbsp;data</td>
</tr>
</tbody>
</table>
</div>

Clicking "Decline" deletes any `_ga` cookies that an earlier "Accept" left. To change your choice at any time, use "Cookie settings" in the site footer.

## Other services that load on some pages {#other-services-that-load-on-some-pages}

Each of these requests gives the service your IP address and user agent.

- Every page loads fonts from Fontshare and Google Fonts, and icons from cdnjs.
- Blog posts and the widget page load the PondPilot widget from unpkg, and the widget fetches DuckDB-WASM from jsDelivr.
- The app product page embeds a demo video from YouTube in privacy-enhanced mode (youtube-nocookie.com). YouTube may set cookies once you play it.

## Your rights

To ask what data we hold about you, or to have it deleted, email [hello@pondpilot.io](mailto:hello@pondpilot.io). If you are in the EU or the UK, the GDPR gives you the right to access your data, to have it deleted, to object to its processing, and to lodge a complaint with your supervisory authority. Analytics cookies rely on your consent, which you can withdraw at any time through "Cookie settings".
