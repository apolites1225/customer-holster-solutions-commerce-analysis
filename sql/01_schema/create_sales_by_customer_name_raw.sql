-- Source: data/raw/sales_by_customer_name_2025.csv
DROP TABLE IF EXISTS sales_by_customer_name_raw;

CREATE TABLE sales_by_customer_name_raw (
  customer_name TEXT,
  customer_email TEXT,
  orders TEXT,
  gross_sales TEXT,
  net_sales TEXT,
  total_sales TEXT
);
