/*
-------------------------------------------------------
Hospital Management System
View : VW_REVENUE_SUMMARY
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_REVENUE_SUMMARY AS
SELECT
    PAYMENT_STATUS,
    COUNT(*) AS TOTAL_BILLS,
    SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM BILLS
GROUP BY PAYMENT_STATUS;
/
