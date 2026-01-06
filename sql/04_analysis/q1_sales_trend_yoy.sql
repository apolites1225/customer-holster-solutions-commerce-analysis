-- =========================================================
-- 04_analysis/q1_sales_trend_yoy.sql
-- Business Question #1:
-- How is performance trending over time, and how does it compare YoY?
-- Source: orders_over_time_clean
-- =========================================================

-- 1) Month-by-month trend with YoY comparison
SELECT
  month_date,

  -- Current year (2025)
  orders AS orders_2025,
  avg_order_value AS aov_2025,
  qty_per_order AS items_per_order_2025,
  qty_returned AS qty_returned_2025,

  -- Previous year (2024) from export
  prev_year_orders AS orders_2024,
  prev_year_avg_order_value AS aov_2024,
  prev_year_qty_per_order AS items_per_order_2024,
  prev_year_qty_returned AS qty_returned_2024,

  -- YoY differences
  (orders - prev_year_orders) AS orders_yoy_diff,
  (avg_order_value - prev_year_avg_order_value) AS aov_yoy_diff,
  (qty_per_order - prev_year_qty_per_order) AS items_per_order_yoy_diff,
  (qty_returned - prev_year_qty_returned) AS qty_returned_yoy_diff,

  -- YoY % changes (protect divide-by-zero)
  ROUND(
    100.0 * (orders - prev_year_orders) / NULLIF(prev_year_orders, 0),
    1
  ) AS orders_yoy_pct,

  ROUND(
    100.0 * (avg_order_value - prev_year_avg_order_value) / NULLIF(prev_year_avg_order_value, 0),
    1
  ) AS aov_yoy_pct

FROM orders_over_time_clean
ORDER BY month_date;


-- 2) High-level summary for the period (single-row KPI summary)
SELECT
  COUNT(*) AS months_in_data,

  SUM(orders) AS total_orders_2025,
  SUM(prev_year_orders) AS total_orders_2024,
  (SUM(orders) - SUM(prev_year_orders)) AS orders_yoy_diff,
  ROUND(
    100.0 * (SUM(orders) - SUM(prev_year_orders)) / NULLIF(SUM(prev_year_orders), 0),
    1
  ) AS orders_yoy_pct,

  ROUND(AVG(avg_order_value), 2) AS avg_aov_2025,
  ROUND(AVG(prev_year_avg_order_value), 2) AS avg_aov_2024,
  ROUND(AVG(avg_order_value) - AVG(prev_year_avg_order_value), 2) AS aov_yoy_diff,
  ROUND(
    100.0 * (AVG(avg_order_value) - AVG(prev_year_avg_order_value)) / NULLIF(AVG(prev_year_avg_order_value), 0),
    1
  ) AS aov_yoy_pct

FROM orders_over_time_clean;


-- 3) Optional: Identify best/worst YoY months by orders
SELECT
  month_date,
  orders,
  prev_year_orders,
  (orders - prev_year_orders) AS orders_yoy_diff,
  ROUND(100.0 * (orders - prev_year_orders) / NULLIF(prev_year_orders, 0), 1) AS orders_yoy_pct
FROM orders_over_time_clean
ORDER BY orders_yoy_diff DESC
LIMIT 5;

SELECT
  month_date,
  orders,
  prev_year_orders,
  (orders - prev_year_orders) AS orders_yoy_diff,
  ROUND(100.0 * (orders - prev_year_orders) / NULLIF(prev_year_orders, 0), 1) AS orders_yoy_pct
FROM orders_over_time_clean
ORDER BY orders_yoy_diff ASC
LIMIT 5;
