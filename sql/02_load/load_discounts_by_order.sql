TRUNCATE TABLE discounts_by_order_raw;

\copy discounts_by_order_raw(month,sale_id,order_name,product_title_at_time_of_sale,gross_sales,line_item_discounts,order_level_discounts,discounts,returns,net_sales) FROM 'data/raw/discounts_2025.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
