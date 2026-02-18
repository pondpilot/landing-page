---
layout: page
title: "Iceberg Data Exploration Tool — SQL in the Browser"
description: "Explore Apache Iceberg data with SQL directly in your browser. No infrastructure, no JVM, no setup. Powered by DuckDB WASM."
permalink: /use-cases/iceberg-data-exploration-tool/
---


Exploration is how you build intuition about data. But with Iceberg, exploration has traditionally required the same heavy infrastructure as production queries. PondPilot changes that — connect to an Iceberg REST Catalog from your browser and start exploring immediately.

## Exploration-First Design

PondPilot is built for the discovery phase:

- **Schema browser** — see what columns and types exist before writing a query
- **Quick preview** — view sample rows without writing SQL
- **SQL editor** — write and iterate on queries with autocomplete
- **Result export** — save interesting subsets as CSV or Parquet for deeper analysis

## Connect to Any REST Catalog

If your Iceberg catalog exposes a REST API (most modern catalogs do — Tabular, Nessie, AWS Glue via REST, Polaris), PondPilot can connect to it. DuckDB's [Iceberg extension in WASM](https://duckdb.org/2025/12/16/iceberg-in-the-browser) handles the catalog protocol, metadata resolution, and data file reading.

## Exploration Patterns

**Data profiling:**
```sql
SELECT column_name, COUNT(*), COUNT(DISTINCT column_name), 
       MIN(column_name), MAX(column_name)
FROM catalog.schema.table
```

**Freshness check:**
```sql
SELECT MAX(updated_at) as latest_record FROM catalog.schema.orders
```

**Schema comparison** — open two tables side by side and compare their structures.

## Zero-Cost Exploration

There's no compute cost to starting an exploration session. No Spark cluster billing by the minute. No Trino coordinator to keep warm. Your browser is the compute engine, and it's already running.

For data teams that pay per-query or per-compute-hour, this means exploration doesn't have to compete with production workloads for budget.

## When to Use This vs. Production Infrastructure

Use PondPilot for: schema discovery, data previews, quick counts, validating recent writes, demoing data to stakeholders.

Use your production engine for: full table scans, complex joins across large tables, latency-sensitive dashboards.

## Get Started

Open [app.pondpilot.io](https://app.pondpilot.io) and explore your Iceberg data.

---

## Related

- [Iceberg Browser Client](/use-cases/iceberg-browser-client/)
- [Browse Iceberg Tables Online](/use-cases/browse-iceberg-tables-online/)
- [DuckDB Online Playground](/tools/duckdb-online-playground/)
