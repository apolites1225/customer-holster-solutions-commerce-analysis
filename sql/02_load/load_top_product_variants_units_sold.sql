TRUNCATE TABLE top_product_variants_units_sold_raw;

\copy top_product_variants_units_sold_raw(product_title,product_variant_sku,net_items_sold) FROM 'data/raw/top_variants_units_sold_2025.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
