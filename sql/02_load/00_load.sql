\echo '--- Loading raw CSVs into *_raw tables ---'

\i projects/project_1/sql/02_load/load_orders_over_time.sql
\i projects/project_1/sql/02_load/load_discounts_by_order.sql
\i projects/project_1/sql/02_load/load_sales_by_customer_name.sql
\i projects/project_1/sql/02_load/load_sessions_by_referrer.sql
\i projects/project_1/sql/02_load/load_top_product_variants_units_sold.sql
\i projects/project_1/sql/02_load/load_total_sales_by_product_variant.sql
\i projects/project_1/sql/02_load/load_rfm_customer_list.sql

\echo '--- Done loading raw CSVs ---'
