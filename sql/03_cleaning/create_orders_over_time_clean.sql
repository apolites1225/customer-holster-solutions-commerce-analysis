-- =========================================================
-- 03_cleaning/create_orders_over_time_clean.sql
-- =========================================================

DROP TABLE IF EXISTS orders_over_time_clean;

CREATE TABLE orders_over_time_clean AS
SELECT
  -- Month assumed to be YYYY-MM-DD in source
  month::date AS month_date,

  -- Core metrics
  NULLIF(orders::text, '')::integer AS orders,
  NULLIF(qty_per_order::text, '')::numeric AS qty_per_order,
  NULLIF(avg_order_value::text, '')::numeric AS avg_order_value,
  NULLIF(qty_returned::text, '')::integer AS qty_returned,

  -- Prior year values
  prev_year_month::date AS prev_year_month_date,
  NULLIF(prev_year_orders::text, '')::integer AS prev_year_orders,
  NULLIF(prev_year_qty_per_order::text, '')::numeric AS prev_year_qty_per_order,
  NULLIF(prev_year_avg_order_value::text, '')::numeric AS prev_year_avg_order_value,
  NULLIF(prev_year_qty_returned::text, '')::integer AS prev_year_qty_returned,

  -- “_2” fields (likely YoY deltas / % changes) kept numeric
  NULLIF(prev_year_orders_2::text, '')::numeric AS prev_year_orders_2,
  NULLIF(prev_year_qty_per_order_2::text, '')::numeric AS prev_year_qty_per_order_2,
  NULLIF(prev_year_avg_order_value_2::text, '')::numeric AS prev_year_avg_order_value_2,
  NULLIF(prev_year_qty_returned_2::text, '')::numeric AS prev_year_qty_returned_2

FROM orders_over_time_raw
WHERE month IS NOT NULL;
