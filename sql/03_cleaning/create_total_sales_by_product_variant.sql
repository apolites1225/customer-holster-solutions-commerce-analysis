-- =========================================================
-- 03_cleaning/create_total_sales_by_product_variant_clean.sql
-- =========================================================

DROP TABLE IF EXISTS total_sales_by_product_variant_clean;

CREATE TABLE total_sales_by_product_variant_clean AS
SELECT
  product_title,
  product_variant_title,
  product_variant_sku,

  NULLIF(net_items_sold::text, '')::integer AS net_items_sold,

  -- Basic currency cleanup (cast to text first, blank -> NULL)
  NULLIF(REPLACE(gross_sales::text, '$', ''), '')::numeric AS gross_sales,
  NULLIF(REPLACE(discounts::text, '$', ''), '')::numeric AS discounts,
  NULLIF(REPLACE(returns::text, '$', ''), '')::numeric AS returns,
  NULLIF(REPLACE(net_sales::text, '$', ''), '')::numeric AS net_sales,
  NULLIF(REPLACE(taxes::text, '$', ''), '')::numeric AS taxes,
  NULLIF(REPLACE(total_sales::text, '$', ''), '')::numeric AS total_sales

FROM total_sales_by_product_variant_raw;
