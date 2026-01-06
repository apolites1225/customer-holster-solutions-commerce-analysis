-- =========================================================
-- 03_cleaning/validate_sessions_by_referrer_clean.sql
-- =========================================================

-- 1) Row counts (raw vs clean)
SELECT
  (SELECT COUNT(*) FROM sessions_by_referrer_raw)  AS raw_rows,
  (SELECT COUNT(*) FROM sessions_by_referrer_clean) AS clean_rows;

-- 2) Null checks on key dimensions
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE referrer_source IS NULL OR referrer_source = '') AS null_referrer_source,
  COUNT(*) FILTER (WHERE referrer_name IS NULL OR referrer_name = '') AS null_referrer_name,
  COUNT(*) FILTER (WHERE session_city IS NULL OR session_city = '') AS null_session_city
FROM sessions_by_referrer_clean;

-- 3) Sanity checks on metrics
SELECT
  COUNT(*) FILTER (WHERE online_store_visitors < 0) AS negative_online_store_visitors,
  COUNT(*) FILTER (WHERE sessions < 0) AS negative_sessions
FROM sessions_by_referrer_clean;

-- 4) Quick sanity peek (top referrers by sessions)
SELECT
  referrer_source,
  referrer_name,
  session_city,
  online_store_visitors,
  sessions
FROM sessions_by_referrer_clean
ORDER BY sessions DESC NULLS LAST
LIMIT 10;
