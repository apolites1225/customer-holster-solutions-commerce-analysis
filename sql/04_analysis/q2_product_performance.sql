-- =========================================================
-- 04_analysis/q2_product_performance.sql
-- Business Question #2:
-- Which product variants drive the most revenue vs unit volume?
-- =========================================================

-- 1) Top product variants by total revenue
SELECT
  product_title,
  product_variant_sku,
  total_sales
FROM total_sales_by_product_variant_clean
WHERE product_title IS NOT NULL
ORDER BY total_sales DESC
LIMIT 10;


-- 2) Top product variants by units sold
SELECT
  product_title,
  product_variant_sku,
  net_items_sold
FROM top_product_variants_units_sold_clean
WHERE product_title IS NOT NULL
ORDER BY net_items_sold DESC
LIMIT 10;


-- 3) Revenue vs volume comparison (variants appearing in either top list)
WITH revenue_rank AS (
  SELECT
    product_title,
    product_variant_sku,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS revenue_rank
  FROM total_sales_by_product_variant_clean
),
volume_rank AS (
  SELECT
    product_title,
    product_variant_sku,
    net_items_sold,
    RANK() OVER (ORDER BY net_items_sold DESC) AS volume_rank
  FROM top_product_variants_units_sold_clean
)
SELECT
  COALESCE(r.product_title, v.product_title) AS product_title,
  COALESCE(r.product_variant_sku, v.product_variant_sku) AS product_variant_sku,
  r.total_sales,
  v.net_items_sold,
  r.revenue_rank,
  v.volume_rank
FROM revenue_rank r
FULL OUTER JOIN volume_rank v
  ON r.product_variant_sku = v.product_variant_sku
WHERE r.revenue_rank <= 10
   OR v.volume_rank <= 10
ORDER BY
  COALESCE(r.revenue_rank, 999),
  COALESCE(v.volume_rank, 999);
