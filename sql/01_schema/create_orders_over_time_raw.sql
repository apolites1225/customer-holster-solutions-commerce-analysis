-- Source: data/raw/orders_over_time_2025.csv
DROP TABLE IF EXISTS orders_over_time_raw;

CREATE TABLE orders_over_time_raw (
  month TEXT,
  orders TEXT,
  qty_per_order TEXT,
  avg_order_value TEXT,
  qty_returned TEXT,

  prev_year_month TEXT,
  prev_year_orders TEXT,
  prev_year_qty_per_order TEXT,
  prev_year_avg_order_value TEXT,
  prev_year_qty_returned TEXT,

  -- duplicate previous_year columns from export (often caused by trailing spaces)
  prev_year_orders_2 TEXT,
  prev_year_qty_per_order_2 TEXT,
  prev_year_avg_order_value_2 TEXT,
  prev_year_qty_returned_2 TEXT
);
