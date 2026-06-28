/*
-------------------------------------------------------
Hospital Management System
View : VW_PATIENT_BILLING
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_PATIENT_BILLING AS
SELECT
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME,
    COUNT(B.BILL_ID) AS TOTAL_BILLS,
    NVL(SUM(B.TOTAL_AMOUNT), 0) AS TOTAL_AMOUNT
FROM PATIENTS P
LEFT JOIN BILLS B
    ON P.PATIENT_ID = B.PATIENT_ID
GROUP BY
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME;
/
