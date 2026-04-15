---
layout: page
title: "Log Analysis with SQL — Query JSON and CSV Logs in Your Browser"
description: "Aggregate, filter, and pivot log exports with SQL using PondPilot. Great for JSON and NDJSON log files. Runs locally in your browser."
permalink: /use-cases/log-analysis-with-sql/
---


`grep` is fine when you know what you're looking for. SQL is better when you want counts, groupings, percentiles, or trends across a log file. PondPilot runs DuckDB in your browser so you can query log exports without spinning up a log platform or uploading anything.

## When SQL Beats grep

- "How many 5xx responses per endpoint, per hour?"
- "What's the p95 latency for this service today vs last week?"
- "Which user IDs show up in auth failures across more than three IPs?"
- "Top 20 error messages by frequency in this 2 GB NDJSON dump?"

You can pipe `grep | awk | sort | uniq -c` for those, or you can write SQL once and iterate.

## NDJSON and JSON Logs

Most modern logging stacks export newline-delimited JSON. DuckDB reads it directly:

```sql
SELECT
  strftime(CAST(timestamp AS TIMESTAMP), '%Y-%m-%d %H:00') as hour,
  service,
  status_code,
  COUNT(*) as requests,
  quantile_cont(duration_ms, 0.95) as p95_ms
FROM 'app-logs.ndjson'
WHERE status_code >= 500
GROUP BY hour, service, status_code
ORDER BY hour DESC, requests DESC;
```

Drop the file into [PondPilot](https://app.pondpilot.io) and run. Your log data doesn't leave your machine — which matters when it contains user IDs, IP addresses, query strings, or internal hostnames.

## CSV Access Logs Too

Apache/Nginx combined logs, Cloudflare exports, CDN billing dumps — anything that exports as CSV is queryable the same way. Use regex functions to pull user-agents apart, `strptime` to parse odd date formats.

## Join Logs with Reference Data

Have a CSV of known bad IPs? JOIN it against your access log to flag matches. Have a service catalog? JOIN it in to attribute traffic to teams.

```sql
SELECT l.*, s.owning_team
FROM 'nginx-access.csv' l
JOIN 'service-catalog.csv' s ON l.host = s.hostname
WHERE l.status = 500;
```

## Big Files, Local Machine

DuckDB WASM handles multi-hundred-megabyte log exports on modern hardware. For the occasional "one-off incident triage" question, that's usually enough — no need to ingest into Loki, Elastic, or BigQuery for an answer you'll look at once.

## Privacy Bonus

Production logs often contain PII even when they're not "supposed to". Querying them on your laptop instead of uploading to a third-party analytics tool keeps the blast radius small.

## Try It

[Open PondPilot](https://app.pondpilot.io), drop in your log export, and start asking real questions.

---

## Related

- [Explore JSON Data Locally](/use-cases/explore-json-data-locally/)
- [Analyze CSV in Browser](/use-cases/analyze-csv-in-browser/)
- [Private Data Exploration](/privacy/private-data-exploration/)
