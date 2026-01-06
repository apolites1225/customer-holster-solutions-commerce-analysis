-- =========================================================
-- 03_cleaning/validate_top_product_variants_by_units_sold_clean.sql
-- =========================================================

-- 1) Row counts
SELECT
  (SELECT COUNT(*) FROM top_product_variants_units_sold_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM top_product_variants_by_units_sold_clean) AS clean_rows;

-- 2) Null checks
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE product_title IS NULL OR product_title = '') AS null_product_title,
  COUNT(*) FILTER (WHERE product_variant_sku IS NULL OR product_variant_sku = '') AS null_product_variant_sku
FROM top_product_variants_by_units_sold_clean;

-- 3) Sanity checks
SELECT
  COUNT(*) FILTER (WHERE net_items_sold < 0) AS negative_net_items_sold,
  COUNT(*) FILTER (WHERE net_items_sold = 0 OR net_items_sold IS NULL) AS zero_or_null_net_items_sold
FROM top_product_variants_by_units_sold_clean;

-- 4) Quick peek: top sellers
SELECT
  product_title,
  product_variant_sku,
  net_items_sold
FROM top_product_variants_by_units_sold_clean
ORDER BY net_items_sold DESC
LIMIT 10;
