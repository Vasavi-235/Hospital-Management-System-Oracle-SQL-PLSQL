/*
-------------------------------------------------------
Hospital Management System
View : VW_DOCTOR_APPOINTMENTS
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_DOCTOR_APPOINTMENTS AS
SELECT
    D.DOCTOR_ID,
    D.DOCTOR_NAME,
    D.SPECIALIZATION,
    COUNT(A.APPOINTMENT_ID) AS TOTAL_APPOINTMENTS
FROM DOCTORS D
LEFT JOIN APPOINTMENTS A
    ON D.DOCTOR_ID = A.DOCTOR_ID
GROUP BY
    D.DOCTOR_ID,
    D.DOCTOR_NAME,
    D.SPECIALIZATION;
/
