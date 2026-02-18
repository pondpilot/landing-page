---
layout: default
title: "SQL Lineage Visualization — Trace Data Flow in SQL"
description: "Visualize SQL data lineage at the column level. FlowScope parses SQL and maps data flow — open source, multi-dialect, Rust+WASM."
permalink: /tools/sql-lineage-visualization/
---

# SQL Lineage Visualization

Understanding how data flows through SQL transformations is critical for debugging, auditing, and refactoring pipelines. FlowScope, part of the PondPilot family, gives you column-level SQL lineage visualization.

## What SQL Lineage Shows You

Given a SQL query (or chain of queries), lineage visualization answers:

- Where does each output column come from?
- Which source tables and columns feed into this transformation?
- How does data flow through CTEs, subqueries, and JOINs?

This is essential for impact analysis ("if I change this column, what breaks?") and regulatory compliance ("prove how this metric is calculated").

## FlowScope: Column-Level Lineage

[FlowScope](https://pondpilot.io/flowscope/) is a Rust-based SQL lineage engine compiled to WebAssembly. It parses SQL statements and produces column-level lineage graphs.

**Multi-dialect support:** FlowScope handles different SQL dialects — not just DuckDB, but the SQL variants you actually use in production.

**Column-level precision:** Table-level lineage tells you which tables are involved. Column-level lineage tells you exactly which columns map to which — far more useful for debugging and auditing.

**Client-side execution:** Like everything in the PondPilot family, FlowScope runs in your browser. Your SQL statements aren't sent to any server.

## Use Cases

**Data pipeline debugging:** Paste a complex transformation query and see exactly how columns map from source to target.

**Compliance and auditing:** Regulators want to know how metrics are derived. Lineage visualization provides that proof.

**Refactoring:** Before changing a column name or removing a table, see what downstream transformations depend on it.

**Onboarding:** Help new team members understand complex SQL pipelines visually instead of reading hundreds of lines of SQL.

## Try FlowScope

Visit [FlowScope](https://pondpilot.io/flowscope/) to paste SQL and see lineage visualized instantly. Open source, free, no signup.
