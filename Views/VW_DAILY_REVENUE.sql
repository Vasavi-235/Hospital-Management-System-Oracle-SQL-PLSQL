/*
-------------------------------------------------------
Hospital Management System
View : VW_DAILY_REVENUE
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_DAILY_REVENUE AS
SELECT
    BILL_DATE,
    COUNT(BILL_ID) AS TOTAL_BILLS,
    SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM BILLS
GROUP BY BILL_DATE
ORDER BY BILL_DATE;
/
