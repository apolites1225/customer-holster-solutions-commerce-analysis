-- Source: data/raw/top_product_variants_units_sold.csv
DROP TABLE IF EXISTS top_product_variants_units_sold_raw;

CREATE TABLE top_product_variants_units_sold_raw (
  product_title TEXT,
  product_variant_sku TEXT,
  net_items_sold TEXT
);
