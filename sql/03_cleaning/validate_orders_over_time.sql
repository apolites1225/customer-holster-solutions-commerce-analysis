-- =========================================================
-- 03_cleaning/validate_orders_over_time_clean.sql
-- =========================================================

-- 1) Row counts (raw vs clean)
SELECT
  (SELECT COUNT(*) FROM orders_over_time_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM orders_over_time_clean) AS clean_rows;

-- 2) Null month_date check
SELECT COUNT(*) AS null_month_date
FROM orders_over_time_clean
WHERE month_date IS NULL;

-- 3) Basic sanity checks
SELECT
  COUNT(*) FILTER (WHERE orders < 0) AS negative_orders_rows,
  COUNT(*) FILTER (WHERE avg_order_value < 0) AS negative_aov_rows,
  COUNT(*) FILTER (WHERE qty_per_order < 0) AS negative_qty_per_order_rows
FROM orders_over_time_clean;

-- 4) Quick peek (most recent months first)
SELECT
  month_date,
  orders,
  qty_per_order,
  avg_order_value,
  qty_returned,
  prev_year_month_date,
  prev_year_orders
FROM orders_over_time_clean
ORDER BY month_date DESC
LIMIT 12;
