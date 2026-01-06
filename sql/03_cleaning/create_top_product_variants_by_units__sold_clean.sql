-- =========================================================
-- 03_cleaning/create_top_product_variants_by_units_sold_clean.sql
-- =========================================================

DROP TABLE IF EXISTS top_product_variants_units_sold_clean;

CREATE TABLE top_product_variants_units_sold_clean AS
SELECT
  product_title,
  product_variant_sku,

  -- Basic numeric cleanup
  NULLIF(net_items_sold::text, '')::numeric AS net_items_sold

FROM top_product_variants_units_sold_raw
WHERE product_title IS NOT NULL;
