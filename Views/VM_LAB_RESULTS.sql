/*
-------------------------------------------------------
Hospital Management System
View : VM_LAB_RESULTS
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VM_LAB_RESULTS AS
SELECT
    L.LAB_ID,
    P.FIRST_NAME || ' ' || P.LAST_NAME AS PATIENT_NAME,
    L.APPOINTMENT_ID,
    L.TEST_NAME,
    L.TEST_RESULT,
    L.TEST_DATE
FROM LAB_RESULTS L
JOIN PATIENTS P
    ON L.PATIENT_ID = P.PATIENT_ID;
/
