-- =========================================================
-- 04_analysis/q3_discounts_and_returns.sql
-- Business Question #3:
-- How much revenue is lost to discounts and returns?
-- Source: discounts_by_order_clean
-- =========================================================

-- 1) Overall discount and return impact (summary KPIs)
SELECT
  COUNT(*) FILTER (WHERE order_name IS NOT NULL) AS orders_with_activity,

  SUM(gross_sales) AS total_gross_sales,
  SUM(discounts) AS total_discounts,
  SUM(returns) AS total_returns,
  SUM(net_sales) AS total_net_sales,

  ROUND(
    100.0 * SUM(discounts) / NULLIF(SUM(gross_sales), 0),
    1
  ) AS discount_pct_of_gross,

  ROUND(
    100.0 * SUM(returns) / NULLIF(SUM(gross_sales), 0),
    1
  ) AS return_pct_of_gross

FROM discounts_by_order_clean
WHERE order_name IS NOT NULL;


-- 2) Monthly trend of discounts and returns
SELECT
  month_date,
  SUM(gross_sales) AS gross_sales,
  SUM(discounts) AS discounts,
  SUM(returns) AS returns,
  SUM(net_sales) AS net_sales,

  ROUND(
    100.0 * SUM(discounts) / NULLIF(SUM(gross_sales), 0),
    1
  ) AS discount_pct,

  ROUND(
    100.0 * SUM(returns) / NULLIF(SUM(gross_sales), 0),
    1
  ) AS return_pct

FROM discounts_by_order_clean
WHERE order_name IS NOT NULL
GROUP BY month_date
ORDER BY month_date;


-- 3) Orders with highest absolute discounts
SELECT
  order_name,
  gross_sales,
  discounts,
  net_sales
FROM discounts_by_order_clean
WHERE order_name IS NOT NULL
  AND discounts > 0
ORDER BY discounts DESC
LIMIT 10;
