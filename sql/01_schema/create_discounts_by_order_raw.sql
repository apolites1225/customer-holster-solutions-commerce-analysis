-- Source: data/raw/discounts_by_order_2025.csv
DROP TABLE IF EXISTS discounts_by_order_raw;

CREATE TABLE discounts_by_order_raw (
  month TEXT,
  sale_id TEXT,
  order_name TEXT,
  product_title_at_time_of_sale TEXT,
  gross_sales TEXT,
  line_item_discounts TEXT,
  order_level_discounts TEXT,
  discounts TEXT,
  returns TEXT,
  net_sales TEXT
);
