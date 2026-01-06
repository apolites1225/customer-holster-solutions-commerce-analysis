-- =========================================================
-- Eddie's Holsters | Full Pipeline Runner
-- =========================================================
-- This script runs the entire project end-to-end:
-- schema → load → cleaning → analysis
-- =========================================================

\echo '== 01_schema =='
\i sql/01_schema/00_schema.sql

\echo '== 02_load =='
\i sql/02_load/00_load.sql

\echo '== 03_cleaning =='
\i sql/03_cleaning/00_clean/00_clean_all.sql

\echo '== 04_analysis =='
\i sql/04_analysis/q1_sales_trend_yoy.sql
\i sql/04_analysis/q2_product_performance.sql
\i sql/04_analysis/q3_discounts_and_returns.sql
\i sql/04_analysis/q4_customer_value.sql
\i sql/04_analysis/q5_traffic_sources.sql
\i sql/04_analysis/q6_revenue_concentration.sql
