-- =========================================================
-- 03_cleaning/validate_rfm_customer_list_clean.sql
-- =========================================================

-- 1) Row counts
SELECT
  (SELECT COUNT(*) FROM rfm_customer_list_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM rfm_customer_list_clean) AS clean_rows;

-- 2) Null checks
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id,
  COUNT(*) FILTER (WHERE customer_name IS NULL OR customer_name = '') AS null_customer_name,
  COUNT(*) FILTER (WHERE rfm_group IS NULL OR rfm_group = '') AS null_rfm_group
FROM rfm_customer_list_clean;

-- 3) Basic sanity checks
SELECT
  COUNT(*) FILTER (WHERE days_since_last_order < 0) AS negative_days_since_last_order,
  COUNT(*) FILTER (WHERE total_number_of_orders < 0) AS negative_total_orders,
  COUNT(*) FILTER (WHERE total_amount_spent < 0) AS negative_total_spent
FROM rfm_customer_list_clean;

-- 4) Quick peek: top spenders
SELECT
  customer_id,
  customer_name,
  rfm_group,
  total_number_of_orders,
  total_amount_spent,
  days_since_last_order
FROM rfm_customer_list_clean
ORDER BY total_amount_spent DESC NULLS LAST
LIMIT 10;

-- 5) Duplicate customer IDs
SELECT
  customer_id,
  COUNT(*) AS row_count
FROM rfm_customer_list_clean
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY row_count DESC;
