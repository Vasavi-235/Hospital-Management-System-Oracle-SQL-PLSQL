/*
-------------------------------------------------------
Hospital Management System
View : VW_DOCTOR_REVENUE
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_DOCTOR_REVENUE AS
SELECT
    D.DOCTOR_ID,
    D.DOCTOR_NAME,
    COUNT(B.BILL_ID) AS TOTAL_BILLS,
    NVL(SUM(B.TOTAL_AMOUNT), 0) AS TOTAL_REVENUE
FROM DOCTORS D
LEFT JOIN APPOINTMENTS A
    ON D.DOCTOR_ID = A.DOCTOR_ID
LEFT JOIN BILLS B
    ON A.PATIENT_ID = B.PATIENT_ID
GROUP BY
    D.DOCTOR_ID,
    D.DOCTOR_NAME;
/
