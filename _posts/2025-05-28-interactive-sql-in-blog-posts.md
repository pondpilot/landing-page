---
layout: post
title: "Interactive SQL snippets for any website"
date: 2025-05-28
author: "Polly"
image: "/blog/images/interactive-sql-widget.jpeg"
---

Today, we're excited to demonstrate how you can transform static SQL code blocks into interactive, browser-based SQL editors using the PondPilot widget. This powerful tool lets your readers run SQL queries directly in their browser without any backend infrastructure!

## What is PondPilot Widget?

PondPilot Widget is a lightweight JavaScript library that brings SQL interactivity to any web page. It's powered by DuckDB WebAssembly, meaning all queries run entirely in the browser with zero backend requirements.

## Live Examples

Let's start with a simple query. Click "Run" to execute it:

<pre class="pondpilot-snippet">
SELECT
  'Hello from PondPilot!' as greeting,
  STRFTIME(CURRENT_DATE, '%Y-%m-%d') as today_str,
  42 as answer_to_everything;
</pre>

### Working with Data

You can create tables and work with data entirely in the browser:

<pre class="pondpilot-snippet">
-- Create a sample sales table
CREATE TABLE sales AS
SELECT * FROM (VALUES
    ('2025-01-01', 'Product A', 100, 25.99),
    ('2025-01-01', 'Product B', 50, 15.49),
    ('2025-01-02', 'Product A', 120, 25.99),
    ('2025-01-02', 'Product C', 80, 35.00),
    ('2025-01-03', 'Product B', 90, 15.49)
) AS t(date, product, quantity, price);

-- Analyze the data
SELECT
    product,
    COUNT(*) as total_orders,
    SUM(quantity) as total_quantity,
    ROUND(SUM(quantity * price), 2) as total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;
</pre>

### Advanced Analytics

Here's a more complex example showing window functions and CTEs, reading from a remote Parquet file:

<pre class="pondpilot-snippet">
    WITH customer_agg AS (
        SELECT
            o_custkey,
            COUNT(*) AS orders_count,
            SUM(CAST(REPLACE(CAST(o_totalprice AS VARCHAR), ',', '') AS DOUBLE)) AS total_spent
        FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/orders.parquet'
        GROUP BY o_custkey
    ),
    customer_ranked AS (
        SELECT
            o_custkey,
            orders_count,
            total_spent,
            RANK() OVER (ORDER BY total_spent DESC) AS cust_rank
        FROM customer_agg
    )
    SELECT
        o.o_orderkey,
        o.o_custkey,
        o.o_orderdate,
        o.o_orderpriority,
        CAST(REPLACE(CAST(o.o_totalprice AS VARCHAR), ',', '') AS DOUBLE) AS o_totalprice,
        cr.orders_count,
        cr.total_spent,
        cr.cust_rank,
        AVG(CAST(REPLACE(CAST(o.o_totalprice AS VARCHAR), ',', '') AS DOUBLE))
            OVER (PARTITION BY o.o_custkey ORDER BY o.o_orderdate ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
            AS rolling_avg_price_last5,
        COUNT(*) OVER (PARTITION BY o.o_orderpriority) AS orders_per_priority
    FROM
        'https://shell.duckdb.org/data/tpch/0_01/parquet/orders.parquet' o
        JOIN customer_ranked cr ON o.o_custkey = cr.o_custkey
    WHERE
        cr.cust_rank <= 10
    ORDER BY
        cr.cust_rank, o.o_orderdate
    LIMIT 50;
</pre>

### Data Visualization with SQL

You can even create ASCII charts directly in SQL:

<pre class="pondpilot-snippet">
-- Generate sample time series data
WITH daily_sales AS (
    SELECT
        date,
        ROUND(100 + 50 * SIN(EXTRACT(DOY FROM date) * 0.1) + RANDOM() * 20, 2) as revenue
    FROM generate_series(
        DATE '2025-01-01',
        DATE '2025-01-31',
        INTERVAL 1 DAY
    ) AS t(date)
),
chart_data AS (
    SELECT
        date,
        revenue,
        ROUND((revenue - MIN(revenue) OVER()) /
              (MAX(revenue) OVER() - MIN(revenue) OVER()) * 20) as bar_height
    FROM daily_sales
)
SELECT
    date,
    revenue,
    REPEAT('█', bar_height::INT) as chart
FROM chart_data
ORDER BY date;
</pre>

## How to Add This to Your Blog

Adding interactive SQL to your blog is incredibly simple:

1. **Include the widget script** in your HTML:
   ```html
   <script src="https://unpkg.com/pondpilot-widget"></script>
   ```

2. **Mark your SQL code blocks** with the `pondpilot-snippet` class:
   ```html
   <pre class="pondpilot-snippet">
   SELECT * FROM your_data;
   </pre>
   ```

3. **That's it!** The widget automatically transforms your static SQL into interactive editors.

## Configuration Options

You can customize the widget's appearance and behavior:

```javascript
// Set dark theme
window.PondPilot.config.theme = 'dark';

// Hide the "Powered by" footer
window.PondPilot.config.showPoweredBy = false;

// Set custom height
window.PondPilot.config.height = '400px';
```

## Use Cases

This widget is perfect for:

- **Technical tutorials**: Let readers experiment with SQL concepts hands-on
- **Data analysis posts**: Share interactive data explorations
- **Documentation**: Provide runnable examples in your docs
- **Educational content**: Teach SQL with immediate feedback
- **Portfolio pieces**: Showcase your SQL skills interactively

## Conclusion

The PondPilot widget transforms static SQL documentation into an engaging, interactive experience. Your readers can modify queries, see immediate results, and truly understand the concepts you're explaining. Best of all, it requires no backend infrastructure and works entirely in the browser!

Try modifying any of the queries above to see how it works. Happy querying!

PondPilot Widget is opensource and available on [GitHub](https://github.com/pondpilot/pondpilot-widget)
