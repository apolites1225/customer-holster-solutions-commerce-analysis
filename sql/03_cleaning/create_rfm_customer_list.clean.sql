-- =========================================================
-- 03_cleaning/create_rfm_customer_list_clean.sql
-- =========================================================

DROP TABLE IF EXISTS rfm_customer_list_clean;

CREATE TABLE rfm_customer_list_clean AS
SELECT
  -- IDs
  NULLIF(customer_id::text, '')::bigint AS customer_id,

  -- Text fields
  customer_name,
  rfm_group,

  -- Metrics
  NULLIF(days_since_last_order::text, '')::integer AS days_since_last_order,
  NULLIF(total_number_of_orders::text, '')::integer AS total_number_of_orders,

  -- Amount (basic cleanup, in case $ appears)
  NULLIF(REPLACE(total_amount_spent::text, '$', ''), '')::numeric AS total_amount_spent

FROM rfm_customer_list_raw
WHERE customer_id IS NOT NULL;
