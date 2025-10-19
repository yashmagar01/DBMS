-- step 1
SELECT SYSDATE() AS sysdate_value;

-- step 2
SELECT LAST_DAY(CURDATE()) AS last_day_of_current_month;

-- step 3
SELECT DAYOFWEEK(CURDATE()) AS day_of_week_index;

-- step 4
SELECT LAST_DAY(SYSDATE()) AS last_day_using_sysdate;

-- step 5
SELECT MONTH(NOW()) AS current_month_number;
