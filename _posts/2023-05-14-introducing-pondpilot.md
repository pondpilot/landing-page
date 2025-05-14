---
layout: post
title: "Introducing PondPilot: Get Your Data in a Row"
date: 2023-05-14
author: "The PondPilot Team"
image: "/blog/images/intro-pondpilot.png"
---

We're excited to announce the launch of PondPilot, a blazing-fast, lightweight, 100% client-side data exploration tool powered by DuckDB. PondPilot makes it easy for data professionals to analyze their data quickly and securely, without any data leaving their device.

## Why We Built PondPilot

Data analysis shouldn't be complicated or require complex setup. Too often, analyzing data requires:

1. Setting up a database server
2. Creating schemas and importing data
3. Writing queries in a separate tool
4. Exporting results for visualization

PondPilot streamlines this entire process by bringing the power of DuckDB to your browser. Simply drag and drop your files, write SQL queries, and see the results instantly.

## Key Features

![PondPilot Dashboard](/blog/images/intro-pondpilot.png)
*PondPilot intuitive user interface with SQL query editor and results view*

- **100% Client-Side**: All processing happens in your browser - no data ever leaves your device
- **PWA Support**: Install PondPilot as a Progressive Web App for offline use
- **No Data-Copy**: Access files directly with real-time updates when files change externally
- **Read-Only**: PondPilot doesn't write to your files, ensuring your data stays safe
- **Cross-Session Persistence**: All data-handles and queries automatically saved between sessions
- **Powered by DuckDB**: Leverage the powerful SQL engine for blazing-fast analysis
- **Multiple File Formats**: Support for CSV, Parquet, JSON, DuckDB database and more

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

## What's Next?

This is just the beginning of our journey. We're working on several exciting features:

- Enhanced visualization capabilities
- More advanced SQL editor features
- Additional file format support
- Integration with popular data tools

We'd love to hear from you! Submit feature requests and feedback on [GitHub](https://github.com/pondpilot/pondpilot/issues).

Stay tuned for more updates, and happy data exploring!