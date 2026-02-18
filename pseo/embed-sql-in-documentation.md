---
layout: default
title: "Embed SQL in Documentation — Interactive, Runnable Queries"
description: "Add interactive SQL to your docs and blog posts. Readers run and modify queries in-browser. No backend, no API keys."
permalink: /tools/embed-sql-in-documentation/
---

# Embed SQL in Documentation

Static code blocks show SQL. Interactive embeds let readers *run* SQL. PondPilot Widget turns your documentation into a hands-on learning experience.

## The Problem with Static SQL Snippets

You write great docs with SQL examples. Readers copy them, paste into their own environment, fix the schema differences, and maybe get it working. Most don't bother. The friction kills engagement.

## PondPilot Widget: Runnable SQL Embeds

[PondPilot Widget](https://widget.pondpilot.io) embeds a live SQL editor in any HTML page. Readers see your query, click Run, see results, then modify it to explore further.

- **Syntax highlighting** makes queries readable
- **Editable** so readers can experiment
- **Results render inline** — no context switching
- **Runs in the reader's browser** via DuckDB WASM

## Zero Backend Required

The widget is a client-side JavaScript component. No server, no API keys, no usage quotas. It works on GitHub Pages, Docusaurus, MkDocs, Hugo, plain HTML, or any static site generator.

## Use Cases

**API documentation:** Embed queries that demonstrate how to analyze your API's output format.

**Data platform docs:** Let internal users explore schema examples interactively.

**Open source projects:** Show users how to query your project's data format.

**Technical blog posts:** Make data analysis posts interactive. Readers learn by doing, not just reading.

**Internal wikis:** Add runnable SQL examples to your team's knowledge base.

## Pre-Load Data

Seed each widget with relevant sample data so readers have immediate context. They see a working example, understand the schema, and can modify queries to explore further.

## Lightweight Integration

Adding PondPilot Widget to a page takes a small HTML snippet. It loads asynchronously and doesn't block your page rendering.

## Get the Widget

Visit [widget.pondpilot.io](https://widget.pondpilot.io) for setup instructions and live demos.
