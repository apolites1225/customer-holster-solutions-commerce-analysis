TRUNCATE TABLE rfm_customer_list_raw;

\copy rfm_customer_list_raw(customer_id,customer_name,rfm_group,days_since_last_order,total_number_of_orders,total_amount_spent) FROM 'data/raw/RFM_customer_list.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
