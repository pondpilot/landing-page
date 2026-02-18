---
layout: page
title: "Iceberg REST Catalog Viewer — Browse Tables in Your Browser"
description: "Browse and explore Iceberg REST Catalog tables from your browser. See schemas, partitions, and snapshots without Spark or Trino."
permalink: /use-cases/iceberg-rest-catalog-viewer/
---


You have an Iceberg REST Catalog. You want to see what's in it — namespaces, tables, schemas, partitions. Normally that means firing up Spark, Trino, or at least a Python notebook with pyiceberg. PondPilot lets you browse it all from a browser tab.

## Browse Your Catalog

PondPilot connects to Iceberg REST Catalogs via DuckDB's [Iceberg support in WASM](https://duckdb.org/2025/12/16/iceberg-in-the-browser). Once connected, you can:

- List namespaces and tables
- Inspect table schemas and column types
- View partition specs
- Query data with SQL
- Export query results to CSV or Parquet

## Setup

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Enter your Iceberg REST Catalog endpoint
3. Provide credentials if required
4. Start browsing

No JVM. No Docker containers. No YAML configuration files. Just a URL and you're in.

## Ad-Hoc Exploration

The real value is speed. When a data engineer asks "what tables are in the prod catalog?" or "what does the schema of that new table look like?" — you don't need to SSH into a server or wait for a Spark session to start. Open PondPilot and check in seconds.

```sql
SELECT * FROM iceberg_catalog.analytics.user_events LIMIT 100
```

## Query Without Compute Infrastructure

PondPilot's SQL engine runs in your browser via WebAssembly. For exploration queries — previewing data, checking row counts, validating schemas — you don't need a compute cluster. The browser is the compute.

For heavy analytical queries over large datasets, you'll still want proper infrastructure. But for 90% of "let me just check something" moments, PondPilot is instant.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and connect to your Iceberg catalog.

---

## Related

- [Iceberg Browser Client](/use-cases/iceberg-browser-client/)
- [DuckDB Iceberg WASM](/use-cases/duckdb-iceberg-wasm/)
- [Iceberg Data Exploration Tool](/use-cases/iceberg-data-exploration-tool/)
