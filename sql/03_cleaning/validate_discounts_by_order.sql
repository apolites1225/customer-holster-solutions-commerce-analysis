-- =========================================================
-- 03_cleaning/validate_discounts_by_order_clean.sql
-- =========================================================

-- 1) Row counts (raw vs clean)
SELECT
  (SELECT COUNT(*) FROM discounts_by_order_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM discounts_by_order_clean) AS clean_rows;

-- 2) Null checks on key fields
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE month_date IS NULL) AS null_month_date,
  COUNT(*) FILTER (WHERE order_name IS NULL OR order_name = '') AS null_order_name
FROM discounts_by_order_clean;

-- 3) Money columns: how many NULLs after cleaning (helps spot blanks / weird formatting)
SELECT
  COUNT(*) FILTER (WHERE gross_sales IS NULL) AS gross_sales_nulls,
  COUNT(*) FILTER (WHERE discounts IS NULL) AS discounts_nulls,
  COUNT(*) FILTER (WHERE net_sales IS NULL) AS net_sales_nulls
FROM discounts_by_order_clean;

-- 4) Basic range check: any negative net sales? (not always wrong, but worth seeing)
SELECT
  COUNT(*) AS negative_net_sales_rows
FROM discounts_by_order_clean
WHERE net_sales < 0;

-- 5) Quick “top 10” sanity peek
SELECT
  month_date,
  order_name,
  gross_sales,
  discounts,
  returns,
  net_sales
FROM discounts_by_order_clean
ORDER BY net_sales DESC NULLS LAST
LIMIT 10;
