-- =========================================================
-- 03_cleaning/validate_sales_by_customer_name_clean.sql
-- =========================================================

-- 1) Row counts
SELECT
  (SELECT COUNT(*) FROM sales_by_customer_name_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM sales_by_customer_name_clean) AS clean_rows;

-- 2) Null checks on key fields
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE customer_name IS NULL OR customer_name = '') AS null_customer_name,
  COUNT(*) FILTER (WHERE orders IS NULL) AS null_orders
FROM sales_by_customer_name_clean;

-- 3) Basic sanity checks (should not be negative)
SELECT
  COUNT(*) FILTER (WHERE orders < 0) AS negative_orders_rows,
  COUNT(*) FILTER (WHERE gross_sales < 0) AS negative_gross_sales_rows,
  COUNT(*) FILTER (WHERE net_sales < 0) AS negative_net_sales_rows,
  COUNT(*) FILTER (WHERE total_sales < 0) AS negative_total_sales_rows
FROM sales_by_customer_name_clean;

-- 4) Quick peek: top customers by total_sales
SELECT
  customer_name,
  customer_email,
  orders,
  gross_sales,
  net_sales,
  total_sales
FROM sales_by_customer_name_clean
ORDER BY total_sales DESC NULLS LAST
LIMIT 10;
