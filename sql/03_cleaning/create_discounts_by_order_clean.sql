-- =========================================================
-- 03_cleaning/create_discounts_by_order_clean.sql
-- =========================================================

DROP TABLE IF EXISTS discounts_by_order_clean;

CREATE TABLE discounts_by_order_clean AS
SELECT
  -- Month assumed to be YYYY-MM-DD in source
  month::date AS month_date,

  sale_id,
  order_name,
  product_title_at_time_of_sale,

  -- Basic currency cleanup (cast to text first, blank -> NULL)
  NULLIF(REPLACE(gross_sales::text, '$', ''), '')::numeric AS gross_sales,
  NULLIF(REPLACE(line_item_discounts::text, '$', ''), '')::numeric AS line_item_discounts,
  NULLIF(REPLACE(order_level_discounts::text, '$', ''), '')::numeric AS order_level_discounts,
  NULLIF(REPLACE(discounts::text, '$', ''), '')::numeric AS discounts,
  NULLIF(REPLACE(returns::text, '$', ''), '')::numeric AS returns,
  NULLIF(REPLACE(net_sales::text, '$', ''), '')::numeric AS net_sales

FROM discounts_by_order_raw
WHERE month IS NOT NULL;
