/*
-------------------------------------------------------
Hospital Management System
View : VW_PATIENT_APPOINTMENT_HISTORY
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_PATIENT_APPOINTMENT_HISTORY AS
SELECT
    P.PATIENT_ID,
    P.FIRST_NAME,
    P.LAST_NAME,
    A.APPOINTMENT_ID,
    A.APPOINTMENT_DATE,
    A.STATUS,
    D.DOCTOR_NAME
FROM PATIENTS P
JOIN APPOINTMENTS A
    ON P.PATIENT_ID = A.PATIENT_ID
JOIN DOCTORS D
    ON A.DOCTOR_ID = D.DOCTOR_ID;
/
