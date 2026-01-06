-- =========================================================
-- 03_cleaning/validate_total_sales_by_product_variant_clean.sql
-- =========================================================

-- 1) Row counts
SELECT
  (SELECT COUNT(*) FROM total_sales_by_product_variant_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM total_sales_by_product_variant_clean) AS clean_rows;

-- 2) Null checks (product fields)
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE product_title IS NULL OR product_title = '') AS null_product_title,
  COUNT(*) FILTER (WHERE product_variant_title IS NULL OR product_variant_title = '') AS null_product_variant_title,
  COUNT(*) FILTER (WHERE product_variant_sku IS NULL OR product_variant_sku = '') AS null_product_variant_sku
FROM total_sales_by_product_variant_clean;

-- 3) Sanity checks (metrics should not be negative except discounts/returns)
SELECT
  COUNT(*) FILTER (WHERE net_items_sold < 0) AS negative_net_items_sold,
  COUNT(*) FILTER (WHERE gross_sales < 0) AS negative_gross_sales,
  COUNT(*) FILTER (WHERE net_sales < 0) AS negative_net_sales,
  COUNT(*) FILTER (WHERE taxes < 0) AS negative_taxes,
  COUNT(*) FILTER (WHERE total_sales < 0) AS negative_total_sales
FROM total_sales_by_product_variant_clean;

-- 4) Quick peek: top variants by total_sales
SELECT
  product_title,
  product_variant_title,
  product_variant_sku,
  net_items_sold,
  total_sales
FROM total_sales_by_product_variant_clean
ORDER BY total_sales DESC NULLS LAST
LIMIT 10;
