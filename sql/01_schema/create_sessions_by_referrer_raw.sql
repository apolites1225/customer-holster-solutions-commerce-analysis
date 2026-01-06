-- Source: data/raw/sessions_by_referrer_utf8.csv
DROP TABLE IF EXISTS sessions_by_referrer_raw;

CREATE TABLE sessions_by_referrer_raw (
  referrer_source TEXT,
  referrer_name TEXT,
  session_city TEXT,
  online_store_visitors TEXT,
  sessions TEXT
);