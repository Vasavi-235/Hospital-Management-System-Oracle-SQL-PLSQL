/*
-------------------------------------------------------
Hospital Management System
View : VW_COMPLETE_HOSPITAL_REPORT
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_COMPLETE_HOSPITAL_REPORT AS
SELECT
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME,
    D.DOCTOR_NAME,
    A.APPOINTMENT_DATE,
    A.STATUS,
    B.BILL_ID,
    B.TOTAL_AMOUNT
FROM PATIENTS P
JOIN APPOINTMENTS A
    ON P.PATIENT_ID = A.PATIENT_ID
JOIN DOCTORS D
    ON A.DOCTOR_ID = D.DOCTOR_ID
LEFT JOIN BILLS B
    ON P.PATIENT_ID = B.PATIENT_ID;
/
