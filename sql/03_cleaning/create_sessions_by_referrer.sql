-- =========================================================
-- 03_cleaning/create_sessions_by_referrer_clean.sql
-- =========================================================

DROP TABLE IF EXISTS sessions_by_referrer_clean;

CREATE TABLE sessions_by_referrer_clean AS
SELECT
  referrer_source,
  referrer_name,
  session_city,

  NULLIF(online_store_visitors::text, '')::integer AS online_store_visitors,
  NULLIF(sessions::text, '')::integer AS sessions

FROM sessions_by_referrer_raw
WHERE referrer_source IS NOT NULL;
