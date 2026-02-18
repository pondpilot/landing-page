---
layout: post
title: "Why PondPilot Now Ships with Its Own CORS Proxy"
date: 2025-11-18
author: "Polly"
image: "/blog/images/proxy-feature.png"
description: "PondPilot now ships a CORS proxy on Cloudflare Workers so you can query remote CSV, Parquet, and DuckDB files without CORS headaches."
---

> *"Data already lives on the internet — your browser just wants a chaperone."*

When you paste the URL of a DuckDB file on S3 or a CSV hosted on GitHub into PondPilot, the browser immediately asks a simple question: **"Did that server give me permission to read this?"** If the server does not explicitly bless requests that originate from `https://app.pondpilot.io`, the browser refuses to even show us the bytes. That hard stop is called **CORS** (Cross‑Origin Resource Sharing). It is brilliant for security, but infuriating when you are trying to explore public datasets that you do not control.

Today we are introducing the **PondPilot CORS Proxy**, hosted at [`cors-proxy.pondpilot.io`](https://cors-proxy.pondpilot.io) and powered by Cloudflare Workers. It removes most of the day‑to‑day friction of working with remote files directly from the browser — without forcing you to run an extra backend.

## Why Browsers Block Helpful Requests

Your browser isolates every web page by "origin" (`scheme + host + port`). PondPilot runs at `https://app.pondpilot.io`, so any file hosted elsewhere counts as a "cross origin" request. Before the request leaves your laptop, the browser checks whether the remote server previously sent an `Access-Control-Allow-Origin` header that includes PondPilot. If not, the browser blocks the transfer to prevent a malicious page from exfiltrating private data out of your cookies or internal services.

That means every remote dataset you want to query has only two options:

1. **Update the server’s CORS policy** to allow PondPilot (or `*`). Great when you own the bucket. Impossible when you do not.
2. **Proxy the request** through a service that *does* share PondPilot’s origin and can add the missing headers on the way back.

Until now you had to build or run that proxy alone. We decided to host one for the community.

## Meet `cors-proxy.pondpilot.io`

We built an open‑source proxy (see [github.com/pondpilot/cors-proxy](https://github.com/pondpilot/cors-proxy)) and deployed it to Cloudflare’s edge network. Here is what it does:

- Accepts HTTPS requests from PondPilot, forwards them to the target URL, and **adds the proper CORS headers** on the response.
- **Streams data** so DuckDB can start reading immediately — no temporary storage on our servers.
- **Automatically retries** failed fetches when PondPilot detects a CORS error, so most users never see the popup.
- Provides a **manual override**: when entering a URL you can toggle “Use PondPilot CORS Proxy,” or simply prefix the URL with  
  `proxy:https://data.example.com/tpch.duckdb`.

Example query in PondPilot:

```sql
ATTACH 's3://pondpilot/chinook.duckdb' AS chinook;
SELECT * FROM chinook.albums LIMIT 5;
```

Behind the scenes we only pass along GET/HEAD requests and immediately relay the response back into your browser session.

## Security, Privacy, and Limits

Opening a public proxy without guardrails would be a gift to attackers, so we shipped production‑grade protections by default:

- **Origin allowlist** — only PondPilot domains can call the hosted proxy.
- **Domain allowlist & SSRF protection** — private networks (`127.0.0.1`, `10.0.0.0/8`, metadata IPs) are blocked, as are redirects to internal services.
- **HTTPS enforcement & size limits** — we require TLS in production and cap files at 500 MB per request to prevent resource abuse.
- **No logging** — the worker does not store URLs, payloads, or metadata. Requests stream straight through Cloudflare’s memory.
- **Rate limiting** — per‑IP quotas ensure a single user cannot starve everyone else.

If your compliance requirements forbid any shared services, you can self‑host the same proxy via Docker (see the [`self-hosted`](https://github.com/pondpilot/cors-proxy/tree/main/self-hosted) guide). The Cloudflare Worker version lives under [`cloudflare-worker`](https://github.com/pondpilot/cors-proxy/tree/main/cloudflare-worker).

## When You Need It (and When You Don’t)

- **Need the proxy** when a public dataset lacks CORS headers and you do not control the origin (government portals, Kaggle mirrors, research S3 buckets, GitHub release assets, etc.).
- **Skip the proxy** when you manage the bucket — just add `Access-Control-Allow-Origin: https://app.pondpilot.io` (or `*`) so PondPilot can fetch directly.
- **Cannot use the proxy** for private/authenticated data. It cannot attach your credentials, refresh signed URLs, or reach networks that are not public.

PondPilot automatically tests the direct path first and only falls back to the proxy when the browser says “No.” That keeps the fastest route for datasets that already advertise permissive CORS policies and quietly unblocks the stubborn ones. Prefer to make every routing decision yourself? You can disable **Auto CORS Proxy** in *Settings → Data Access* and opt in per URL with the `proxy:` prefix.

## Start Querying Remote Files Again

1. Paste any HTTPS URL into the PondPilot file picker or run `ATTACH 'https://…'` in the SQL editor.
2. If the remote host allows cross‑origin access, nothing changes.
3. If the browser raises a CORS error, PondPilot transparently retries through `cors-proxy.pondpilot.io`.
4. For reproducible scripts, wrap the target URL yourself (as shown above) to always go through the proxy.

That is it — no servers to maintain, no browser extensions, and no more “Why does this URL work in curl but not in PondPilot?” We are excited to see what far‑flung public datasets you attach next. If you hit an edge case or want to extend the proxy, open an issue or pull request in [github.com/pondpilot/cors-proxy](https://github.com/pondpilot/cors-proxy).

Happy querying! 🦆
