---
layout: default
title: "Browse Iceberg Tables Online — No Spark, No Trino"
description: "Explore Apache Iceberg tables from your browser. Connect to REST Catalogs, browse schemas, query data — no infrastructure required."
permalink: /use-cases/browse-iceberg-tables-online/
---

# Browse Iceberg Tables Online

Apache Iceberg tables are everywhere now — but browsing them still feels like it requires a PhD in distributed systems. PondPilot lets you explore Iceberg tables from a browser tab. No Spark session, no Trino cluster, no Docker compose files.

## Connect and Browse

PondPilot connects to Iceberg REST Catalogs using DuckDB's [Iceberg extension running in WASM](https://duckdb.org/2025/12/16/iceberg-in-the-browser). Once connected:

- **Namespaces** — see all databases/schemas in your catalog
- **Tables** — list tables within each namespace
- **Schemas** — inspect column names, types, and nullability
- **Data** — preview rows or run full SQL queries

## No Setup Required

The traditional path to querying an Iceberg table:

1. Install Java
2. Set up Spark or Trino
3. Configure catalog properties
4. Write a query
5. Wait for the session to start

The PondPilot path:

1. Open [app.pondpilot.io](https://app.pondpilot.io)
2. Enter catalog URL
3. Query

That's a meaningful difference when you just want to check if yesterday's pipeline ran correctly.

## SQL Queries on Iceberg Data

Full DuckDB SQL works against Iceberg tables:

```sql
SELECT date_trunc('hour', created_at) as hour,
       COUNT(*) as events
FROM catalog.default.clickstream
WHERE created_at >= '2025-01-01'
GROUP BY 1
ORDER BY 1
```

## Who This Is For

- **Data engineers** validating pipeline outputs
- **Analytics engineers** exploring new tables before building models
- **Data scientists** who want to look at the data before writing code
- **Platform teams** who need a lightweight catalog browser for their org

## Limitations

This is browser-based compute. It's great for exploration, validation, and small-to-medium queries. For scanning terabytes of data, you'll want server-side DuckDB or a proper compute engine. But for the vast majority of "browse and check" workflows, it's more than enough.

## Get Started

Open [app.pondpilot.io](https://app.pondpilot.io) and connect your Iceberg catalog.

---

## Related

- [Iceberg REST Catalog Viewer](/use-cases/iceberg-rest-catalog-viewer/)
- [Iceberg Data Exploration Tool](/use-cases/iceberg-data-exploration-tool/)
- [DuckDB Iceberg WASM](/use-cases/duckdb-iceberg-wasm/)
