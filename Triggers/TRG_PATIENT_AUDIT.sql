/*
-------------------------------------------------------
Hospital Management System
Trigger : TRG_PATIENT_AUDIT
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE TRIGGER TRG_PATIENT_AUDIT
AFTER INSERT ON PATIENTS
FOR EACH ROW
DECLARE
    V_USER VARCHAR2(50);
BEGIN
    V_USER := USER;

    INSERT INTO AUDIT_LOG
    (
        LOG_ID,
        TABLE_NAME,
        ACTION_TYPE,
        ACTION_DATE,
        USER_NAME
    )
    VALUES
    (
        AUDIT_SEQ.NEXTVAL,
        'PATIENTS',
        'INSERT',
        SYSDATE,
        V_USER
    );
END;
/

ALTER TRIGGER TRG_PATIENT_AUDIT ENABLE;
