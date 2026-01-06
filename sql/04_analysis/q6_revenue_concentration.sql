-- =========================================================
-- q6_revenue_concentration.sql
-- Business Question #6:
-- How concentrated is revenue across products and customers?
-- =========================================================

-- 1) Product revenue concentration (top products cumulative share)
WITH ranked_products AS (
  SELECT
    product_title,
    SUM(total_sales) AS product_revenue
  FROM total_sales_by_product_variant_clean
  WHERE total_sales > 0
  GROUP BY product_title
),
cumulative AS (
  SELECT
    product_title,
    product_revenue,
    SUM(product_revenue) OVER () AS total_revenue,
    SUM(product_revenue) OVER (
      ORDER BY product_revenue DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
  FROM ranked_products
)
SELECT
  product_title,
  product_revenue,
  ROUND(100.0 * cumulative_revenue / total_revenue, 1) AS cumulative_revenue_pct
FROM cumulative
ORDER BY product_revenue DESC
LIMIT 15;

-- 2) Customer revenue concentration summary
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
  COUNT(*) FILTER (WHERE cumulative_revenue / total_revenue <= 0.5) AS customers_for_50pct_revenue,
  COUNT(*) FILTER (WHERE cumulative_revenue / total_revenue <= 0.8) AS customers_for_80pct_revenue,
  COUNT(*) AS total_customers
FROM ranked_customers;
