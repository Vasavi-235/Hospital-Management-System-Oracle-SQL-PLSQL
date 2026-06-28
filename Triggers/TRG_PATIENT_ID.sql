/*
-------------------------------------------------------
Hospital Management System
Trigger : TRG_PATIENT_ID
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE TRIGGER TRG_PATIENT_ID
BEFORE INSERT ON PATIENTS
FOR EACH ROW
BEGIN
    :NEW.PATIENT_ID := PATIENT_SEQ.NEXTVAL;
END;
/

ALTER TRIGGER TRG_PATIENT_ID ENABLE;
