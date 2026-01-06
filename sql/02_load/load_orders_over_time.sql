TRUNCATE TABLE orders_over_time_raw;

\copy orders_over_time_raw(month,orders,qty_per_order,avg_order_value,qty_returned,prev_year_month,prev_year_orders,prev_year_qty_per_order,prev_year_avg_order_value,prev_year_qty_returned,prev_year_orders_2,prev_year_qty_per_order_2,prev_year_avg_order_value_2,prev_year_qty_returned_2) FROM 'data/raw/orders_over_time_2025.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
