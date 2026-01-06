-- Source: data/raw/total_sales_by_product_variant_2025.csv
DROP TABLE IF EXISTS total_sales_by_product_variant_raw;

CREATE TABLE total_sales_by_product_variant_raw (
  product_title TEXT,
  product_variant_title TEXT,
  product_variant_sku TEXT,
  net_items_sold TEXT,
  gross_sales TEXT,
  discounts TEXT,
  returns TEXT,
  net_sales TEXT,
  taxes TEXT,
  total_sales TEXT
);
