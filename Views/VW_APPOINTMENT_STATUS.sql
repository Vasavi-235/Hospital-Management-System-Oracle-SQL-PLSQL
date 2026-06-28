/*
-------------------------------------------------------
Hospital Management System
View : VW_APPOINTMENT_STATUS
Author : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE VIEW VW_APPOINTMENT_STATUS AS
SELECT
    STATUS,
    COUNT(*) AS TOTAL_APPOINTMENTS
FROM APPOINTMENTS
GROUP BY STATUS;
/
