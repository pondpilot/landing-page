---
layout: default
title: "DuckDB + Iceberg + WASM — Query Iceberg Tables from the Browser"
description: "The DuckDB Iceberg extension now works in WebAssembly. PondPilot puts it in a real SQL editor you can use today."
permalink: /use-cases/duckdb-iceberg-wasm/
---

# DuckDB + Iceberg + WASM

DuckDB's Iceberg extension [now runs in WebAssembly](https://duckdb.org/2025/12/16/iceberg-in-the-browser). This means a browser can connect to an Iceberg REST Catalog, resolve table metadata, and query Parquet data files — all without a server. PondPilot wraps this capability in a proper SQL editor with a real UI.

## The Stack

- **DuckDB** — fast analytical SQL engine
- **Iceberg extension** — reads Iceberg table metadata and data files
- **WebAssembly** — runs DuckDB natively in the browser
- **PondPilot** — provides the UI: editor, results viewer, schema browser, export

Each piece exists independently. PondPilot brings them together into something you can actually use without writing JavaScript glue code.

## What You Can Do

Connect to any Iceberg REST Catalog endpoint and run SQL:

```sql
-- Browse what's available
SHOW TABLES IN iceberg_catalog.production;

-- Query data
SELECT event_type, COUNT(*) 
FROM iceberg_catalog.production.events
WHERE event_date = CURRENT_DATE - INTERVAL '1 day'
GROUP BY event_type;
```

Results render in a data grid. Export to CSV or Parquet. No terminal, no notebooks, no infrastructure.

## Why This Matters for the Iceberg Ecosystem

Iceberg is becoming the standard open table format. But until now, querying Iceberg data required real infrastructure — Spark, Trino, Flink, or at minimum a running process. Browser-based access via WASM removes that barrier entirely for exploration and validation.

This isn't about replacing your production query engine. It's about making Iceberg data accessible for the "let me quickly check" moments that happen dozens of times a day.

## For Data Platform Teams

If you're building an internal data platform, PondPilot gives your users a zero-setup way to explore the Iceberg catalog. No client installations, no JDBC drivers, no VPN-specific configurations. Share a link to PondPilot and a catalog endpoint — that's the onboarding.

## Try It

Open [app.pondpilot.io](https://app.pondpilot.io) and connect to your Iceberg REST Catalog.

---

## Related

- [Iceberg Browser Client](/use-cases/iceberg-browser-client/)
- [Browse Iceberg Tables Online](/use-cases/browse-iceberg-tables-online/)
- [DuckDB WASM SQL Editor](/tools/duckdb-wasm-sql-editor/)
