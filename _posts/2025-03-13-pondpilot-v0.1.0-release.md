---
layout: post
title: "PondPilot v0.1.0: Our First Official Release"
date: 2025-03-13
author: "Polly"
image: "/blog/images/v0.1.0.webp"
description: "PondPilot v0.1.0 is here — a fast, 100% client-side SQL data explorer powered by DuckDB. Query CSV, Parquet, and JSON files in your browser."
---

We're thrilled to announce the first official release of PondPilot v0.1.0! After months of development and testing, we've reached this important milestone in our journey to provide a fast, secure, and easy-to-use data exploration tool powered by DuckDB.

## What's in v0.1.0

This release includes all the core functionality we've been working on, now stabilized and ready for regular use:

- **Complete SQL Query Interface**: Write and execute SQL queries against your data files with syntax highlighting and basic autocompletion
- **Multi-File Support**: Easily work with CSV, Parquet, JSON, and native DuckDB files
- **Data Grid View**: View query results in a responsive, sortable data grid
- **Export Capabilities**: Export query results to CSV with a single click
- **Session Persistence**: Your workspace state persists between browser sessions
- **100% Client-Side Processing**: All data processing happens locally - your data never leaves your device

<img src="/blog/images/intro-pondpilot.webp" alt="PondPilot Interface" loading="lazy" />
*PondPilot v0.1.0 showing SQL query execution and results view*

## Technical Details

PondPilot v0.1.0 is built with:

- DuckDB-WASM v0.8.1 for in-browser SQL processing
- SvelteKit for the application framework
- TypeScript for type-safe code
- Modern browser APIs for file handling

## Getting Started

You can start using PondPilot today in two ways:

### Using the Web App
1. Visit [app.pondpilot.io](https://app.pondpilot.io)
2. Click "Add file" or use shortcut (Ctrl+F)
3. Start exploring your data!

### Running Locally
If you prefer to run it locally, you can use Docker:

```bash
docker run -d -p 4173:80 --name pondpilot ghcr.io/pondpilot/pondpilot:latest
```

Then visit `http://localhost:4173` to access PondPilot.

## What's Next

With v0.1.0 establishing a solid foundation, we're already working on exciting new features for upcoming releases:

- Enhanced visualization capabilities
- Advanced SQL editor improvements
- Additional file format support
- Performance optimizations for larger datasets
- More keyboard shortcuts for power users

We'd love to hear your feedback! Please report any issues or submit feature requests on our [GitHub repository](https://github.com/pondpilot/pondpilot/issues).

Thank you to everyone who has supported PondPilot's development. We're excited to continue building and improving this tool for all your data exploration needs!
