-- =========================================================
-- q5_traffic_sources.sql
-- Business Question #5:
-- Which traffic sources generate the most sessions?
-- =========================================================

-- 1) Top traffic sources by sessions
SELECT
  referrer_source,
  referrer_name,
  SUM(sessions) AS total_sessions
FROM sessions_by_referrer_clean
GROUP BY
  referrer_source,
  referrer_name
ORDER BY total_sessions DESC
LIMIT 10;

-- 2) Traffic concentration (cumulative % of sessions)
WITH ranked_referrers AS (
  SELECT
    referrer_source,
    referrer_name,
    SUM(sessions) AS total_sessions
  FROM sessions_by_referrer_clean
  GROUP BY
    referrer_source,
    referrer_name
),
cumulative AS (
  SELECT
    referrer_source,
    referrer_name,
    total_sessions,
    SUM(total_sessions) OVER () AS all_sessions,
    SUM(total_sessions) OVER (
      ORDER BY total_sessions DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sessions
  FROM ranked_referrers
)
SELECT
  referrer_source,
  referrer_name,
  total_sessions,
  ROUND(100.0 * cumulative_sessions / all_sessions, 1) AS cumulative_sessions_pct
FROM cumulative
ORDER BY total_sessions DESC
LIMIT 15;
