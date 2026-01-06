-- =========================================================
-- 04_analysis/q4_customer_value.sql
-- Business Question #4:
-- Who are the most valuable customers by spend and frequency?
--
-- Source Tables:
--   - sales_by_customer_name_clean
-- =========================================================

-- 1) Top customers by total net sales
SELECT
  customer_name,
  customer_email,
  orders,
  net_sales
FROM sales_by_customer_name_clean
WHERE customer_name IS NOT NULL
ORDER BY net_sales DESC
LIMIT 10;


-- 2) High spend vs high frequency customers
SELECT
  customer_name,
  orders,
  net_sales,
  ROUND(net_sales / NULLIF(orders, 0), 2) AS avg_order_value
FROM sales_by_customer_name_clean
WHERE orders > 0
ORDER BY net_sales DESC
LIMIT 15;


-- 3) Revenue concentration (Pareto analysis)
WITH ranked_customers AS (
  SELECT
    customer_name,
    net_sales,
    SUM(net_sales) OVER () AS total_revenue,
    SUM(net_sales) OVER (
      ORDER BY net_sales DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
  FROM sales_by_customer_name_clean
  WHERE net_sales > 0
)
SELECT
  customer_name,
  net_sales,
  ROUND(100.0 * cumulative_revenue / total_revenue, 1) AS cumulative_revenue_pct
FROM ranked_customers
ORDER BY net_sales DESC
LIMIT 20;
