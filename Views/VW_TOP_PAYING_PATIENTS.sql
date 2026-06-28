/*
-------------------------------------------------------
Hospital Management System
View : VW_TOP_PAYING_PATIENTS
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_TOP_PAYING_PATIENTS AS
SELECT
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME,
    COUNT(B.BILL_ID) AS TOTAL_BILLS,
    SUM(B.TOTAL_AMOUNT) AS TOTAL_PAID
FROM PATIENTS P
JOIN BILLS B
    ON P.PATIENT_ID = B.PATIENT_ID
GROUP BY
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME
ORDER BY TOTAL_PAID DESC;
/
