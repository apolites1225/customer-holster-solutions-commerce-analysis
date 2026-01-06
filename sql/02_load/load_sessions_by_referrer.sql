TRUNCATE TABLE sessions_by_referrer_raw;

\copy sessions_by_referrer_raw(referrer_source, referrer_name, session_city, online_store_visitors, sessions) FROM 'C:/Users/apoli/Desktop/Data Analytics/C_H_S/data/raw/sessions_by_referrer_2025_clean.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', NULL '');
