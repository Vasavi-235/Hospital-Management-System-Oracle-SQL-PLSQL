/*
-------------------------------------------------------
Hospital Management System
View : VW_APPOINTMENT_DETAILS
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_APPOINTMENT_DETAILS AS
SELECT
    A.APPOINTMENT_ID,
    P.FIRST_NAME,
    D.DOCTOR_NAME,
    A.APPOINTMENT_DATE,
    A.STATUS
FROM APPOINTMENTS A
JOIN PATIENTS P
    ON A.PATIENT_ID = P.PATIENT_ID
JOIN DOCTORS D
    ON A.DOCTOR_ID = D.DOCTOR_ID;
/
