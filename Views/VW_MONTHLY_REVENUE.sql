/*
-------------------------------------------------------
Hospital Management System
View : VW_MONTHLY_REVENUE
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_MONTHLY_REVENUE AS
SELECT
    TO_CHAR(BILL_DATE, 'MON-YYYY') AS BILL_MONTH,
    COUNT(BILL_ID) AS TOTAL_BILLS,
    SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM BILLS
GROUP BY TO_CHAR(BILL_DATE, 'MON-YYYY')
ORDER BY MIN(BILL_DATE);
/
