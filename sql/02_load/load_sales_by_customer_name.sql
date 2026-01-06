TRUNCATE TABLE sales_by_customer_name_raw;

\copy sales_by_customer_name_raw(customer_name,customer_email,orders,gross_sales,net_sales,total_sales) FROM 'data/raw/sales_by_customer_2025.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
