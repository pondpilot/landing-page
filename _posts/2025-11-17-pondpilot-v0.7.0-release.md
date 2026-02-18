---
layout: post
title: "PondPilot v0.7.0: Compare, Connect, and Collaborate"
date: 2025-11-17
author: "Polly"
image: "/blog/images/v0.7.0.png"
description: "PondPilot v0.7.0 adds dataset comparison, remote data access via CORS proxy, and collaboration features. Compare production vs staging data."
---

PondPilot v0.7.0 introduces several improvements focused on collaboration, remote data access, and dataset comparison. Below is an overview of the key updates in this release.

## 📊 Introducing PondPilot Compare

Ever needed to validate data transformations? Compare production vs. staging data? Track changes over time? Meet **PondPilot Compare** — a tool designed to simplify dataset comparison.

### Side-by-Side Visual Comparison ✨

PondPilot Compare lets you:
- **Compare datasets side-by-side** with visual highlighting of differences
- **Identify discrepancies efficiently** with clear visual highlighting
- **Validate data transformations** before they go to production
- **Track changes over time** by comparing snapshots
- **Compare different environments** (dev, staging, production)

Perfect for data quality assurance, migration validation, and ensuring your data pipelines are working exactly as expected. No more manual row-by-row checking or complex SQL joins just to find what changed!

## 🌐 Seamless Remote Database Access

Working with remote databases and cloud storage is now easier thanks to improved **CORS Proxy Support**.

### Automatic CORS Error Handling 🚀

Here's the problem we solved: accessing remote databases and data files from your browser often fails due to CORS (Cross-Origin Resource Sharing) restrictions. S3 buckets, cloud databases, and remote files are frequently inaccessible because of missing CORS headers.

With v0.7.0, PondPilot now:
- **Automatically detects CORS errors** and retries through a transparent proxy
- **Supports S3 buckets** with automatic URL conversion
- **Works with all cloud storage providers** (AWS S3, Google Cloud Storage, Azure Blob)
- **Requires zero configuration** - just paste your URL and go!

Example use cases:
```sql
-- Access remote DuckDB database
ATTACH 'https://example.com/remote.duckdb' AS remote_db;

-- Query S3 bucket directly
ATTACH 's3://pondpilot/chinook.duckdb' AS chinook;
SELECT * FROM chinook.albums;
```

PondPilot manages CORS handling automatically to reduce common access issues.

## 💬 Built-in Feedback System

We’ve added a **built‑in feedback reporter** to streamline communication and issue reporting.

### Share Your Thoughts Without Leaving the App 🎯

The in‑app feedback system allows you to:
- **Submit bug reports** with detailed context
- **Request features** you'd love to see
- **Share feedback** on your experience
- **Get help** when something isn't working

Key capabilities include:
- **Smart context capture** - automatically includes browser info, app version, and error details
- **Categorized reporting** - bug reports, feature requests, performance issues, and more
- **No account needed** - feedback is anonymous by default
- **Lightning fast** - share your thoughts in seconds

This feature is intended to make feedback submission straightforward and efficient.

## 🚀 Enterprise-Ready Deployment

For organizations running multiple services under one domain, this update may be especially useful. **Subdirectory deployment support** makes it easy to integrate PondPilot into your existing infrastructure.

### Flexible Deployment Options 🏢

Now you can:
- **Deploy PondPilot in a subdirectory** (e.g., `example.com/pondpilot/`)
- **Run alongside other services** under the same domain
- **Configure custom base paths** via environment variables
- **Use comprehensive nginx examples** from our deployment guide

This is useful for enterprises that need to:
- Centralize tools under a single domain
- Integrate PondPilot into existing portals
- Maintain consistent URL structures
- Simplify access management

## 🐛 Quality Improvements

We've also squashed some important bugs in this release:
- **Fixed clipboard handling** for Safari and Firefox browsers
- **Improved comparison page header** behavior
- **Enhanced S3 URL rewriting** for better compatibility


## 🚀 Try It Now

You can try the new comparison and remote data access features immediately at the link below.

Ready to compare datasets and access remote data without headaches? Head over to [app.pondpilot.io](https://app.pondpilot.io) and try these new features!

### Quick Start: Try Comparison

1. Load two CSV files with similar structures
2. Look for the new "Compare" option in the interface
3. Watch as differences are highlighted automatically

### Quick Start: Remote Database

```sql
-- Try accessing a public DuckDB database
ATTACH 's3://pondpilot/chinook.duckdb' AS chinook;
SELECT * FROM chinook.artists LIMIT 10;
```

The new feedback option is also available if you encounter issues or have suggestions.

We appreciate feedback from the community. Check out the full [changelog on GitHub](https://github.com/pondpilot/pondpilot/releases/tag/v0.7.0) for complete details.

Happy data exploring! 🦆✨

---

_PondPilot is your browser-based data exploration companion, powered by DuckDB and designed for privacy-first analytics. All processing happens locally in your browser - your data never leaves your device._
