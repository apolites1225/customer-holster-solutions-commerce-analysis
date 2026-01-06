-- =========================================================
-- 03_cleaning/create_sales_by_customer_name_clean.sql
-- =========================================================

DROP TABLE IF EXISTS sales_by_customer_name_clean;

CREATE TABLE sales_by_customer_name_clean AS
SELECT
  customer_name,
  customer_email,

  NULLIF(orders::text, '')::integer AS orders,

  NULLIF(REPLACE(gross_sales::text, '$', ''), '')::numeric AS gross_sales,
  NULLIF(REPLACE(net_sales::text, '$', ''), '')::numeric AS net_sales,
  NULLIF(REPLACE(total_sales::text, '$', ''), '')::numeric AS total_sales

FROM sales_by_customer_name_raw
WHERE customer_name IS NOT NULL;
