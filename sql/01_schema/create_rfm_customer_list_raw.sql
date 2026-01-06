-- Source: data/raw/rfm_customer_list.csv
DROP TABLE IF EXISTS rfm_customer_list_raw;

CREATE TABLE rfm_customer_list_raw (
  customer_id TEXT,
  customer_name TEXT,
  rfm_group TEXT,
  days_since_last_order TEXT,
  total_number_of_orders TEXT,
  total_amount_spent TEXT
);
