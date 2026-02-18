---
layout: page
title: "Iceberg Browser Client — Query Iceberg Catalogs from Your Browser"
description: "Connect to Iceberg REST Catalogs directly from your browser with PondPilot. No infrastructure, no JVM, no Spark cluster. Powered by DuckDB WASM."
permalink: /use-cases/iceberg-browser-client/
---


What if you could browse and query your Iceberg tables from a browser tab? No Spark cluster, no Trino deployment, no JVM. Just open PondPilot, point it at your Iceberg REST Catalog, and start running SQL.

This is real — and it's genuinely new.

## How It Works

PondPilot runs DuckDB as WebAssembly in your browser. DuckDB's [Iceberg extension](https://duckdb.org/2025/12/16/iceberg-in-the-browser) supports connecting to Iceberg REST Catalogs directly from WASM. That means your browser can read Iceberg table metadata, resolve snapshots, and query Parquet data files — all without a backend server.

## Getting Started

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Configure your Iceberg REST Catalog connection
3. Browse namespaces and tables
4. Run SQL queries against your Iceberg data

```sql
SELECT product_category, SUM(revenue) as total_revenue
FROM iceberg_catalog.sales.transactions
WHERE year = 2025
GROUP BY product_category
```

## Why This Matters

Iceberg adoption is exploding, but querying Iceberg data still requires heavy infrastructure — Spark, Trino, or at minimum a running DuckDB process. PondPilot eliminates that for exploration and ad-hoc analysis. Open a browser tab and you're querying production Iceberg tables.

## Use Cases

- **Data exploration** — browse what's in your Iceberg catalog without spinning up compute
- **Quick validation** — check that a pipeline wrote the right data
- **Demo and presentation** — show Iceberg data live without provisioning infrastructure
- **Schema discovery** — explore table schemas and partition layouts

## No Infrastructure to Manage

There's no server component. PondPilot connects directly from the browser to your Iceberg REST Catalog endpoint. You bring the catalog URL and credentials; PondPilot brings the SQL engine.

## Get Started

Visit [app.pondpilot.io](https://app.pondpilot.io) and connect to your Iceberg catalog.

---

## Related

- [DuckDB Iceberg WASM](/use-cases/duckdb-iceberg-wasm/)
- [Iceberg REST Catalog Viewer](/use-cases/iceberg-rest-catalog-viewer/)
- [Browse Iceberg Tables Online](/use-cases/browse-iceberg-tables-online/)
