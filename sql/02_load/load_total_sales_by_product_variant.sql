TRUNCATE TABLE total_sales_by_product_variant_raw;

\copy total_sales_by_product_variant_raw(product_title,product_variant_title,product_variant_sku,net_items_sold,gross_sales,discounts,returns,net_sales,taxes,total_sales) FROM 'data/raw/total_sales_by_product_variant.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
