---
layout: page
title: "Data Tool for Data Engineers — Inspect Parquet and Iceberg in the Browser"
description: "Sanity-check pipeline outputs, peek at Parquet and Iceberg files, and debug without spinning up infra. PondPilot runs DuckDB in your browser."
permalink: /audience/data-tool-for-data-engineers/
---


You just dropped a new Parquet partition into S3 and you want to confirm the row counts and schema before the downstream DAG picks it up. Spinning up a notebook, starting a cluster, or SSHing into the jumpbox is overkill. PondPilot gives you DuckDB in a browser tab — point it at a file and interrogate it.

## Quick Sanity Checks on Pipeline Outputs

Drag a Parquet file from your file manager into [app.pondpilot.io](https://app.pondpilot.io) and start inspecting:

```sql
-- Row count, null rates, min/max on the partition key
SELECT
  COUNT(*) AS rows,
  COUNT(*) FILTER (WHERE user_id IS NULL) AS null_user_id,
  MIN(event_ts) AS min_ts,
  MAX(event_ts) AS max_ts
FROM 'events_2024-12-15.parquet';
```

```sql
-- Schema introspection
DESCRIBE SELECT * FROM 'events_2024-12-15.parquet';
```

## Compare Two Runs

Diff yesterday's partition against today's to catch schema drift or silent volume drops:

```sql
WITH today AS (
  SELECT source, COUNT(*) AS n FROM 'events_2024-12-15.parquet' GROUP BY source
),
yesterday AS (
  SELECT source, COUNT(*) AS n FROM 'events_2024-12-14.parquet' GROUP BY source
)
SELECT
  COALESCE(t.source, y.source) AS source,
  y.n AS yesterday_rows,
  t.n AS today_rows,
  ROUND(100.0 * (t.n - y.n) / NULLIF(y.n, 0), 1) AS pct_change
FROM today t
FULL OUTER JOIN yesterday y USING (source)
ORDER BY ABS(COALESCE(pct_change, 0)) DESC;
```

## Iceberg and Remote Files

DuckDB's Iceberg and `httpfs` extensions let you read directly from object storage URLs. Query an Iceberg table snapshot or an S3-hosted Parquet without materializing locally — handy when the file is too large to download but you only need a slice.

## Verify dbt and Airflow Outputs

Before promoting a model, read the target file and check invariants:

```sql
-- No duplicate primary keys
SELECT order_id, COUNT(*) AS c
FROM 'dim_orders.parquet'
GROUP BY order_id HAVING COUNT(*) > 1;
```

If this returns zero rows, the uniqueness contract holds. Faster than waiting for the next scheduled run of a test suite.

## No Infra, No Credentials

You don't need Snowflake access, a warehouse role, or a Kubernetes pod to poke at a file. Your laptop has enough horsepower for multi-million-row scans, and the browser has an engine waiting.

## Scripts Live in Tabs

Save useful debugging queries as `.sql` files in the repo next to the DAG they're checking. Future-you, or the on-call engineer at 2am, will thank present-you.

## Works Offline

PWA-installable. Useful when you're debugging a local pipeline run on a plane or behind a firewall.

## Open the Tool

[app.pondpilot.io](https://app.pondpilot.io) — DuckDB in a browser, zero setup.

---

## Related

- [Browser SQL Analytics](/use-cases/browser-sql-analytics/)
- [DuckDB Online Playground](/duckdb/online-playground/)
- [Data Analysis for Startups](/audience/data-analysis-for-startups/)
