/*
-------------------------------------------------------
Hospital Management System
Trigger : TRG_BILL_AUDIT
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE TRIGGER TRG_BILL_AUDIT
AFTER UPDATE ON BILLS
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
        'BILLS',
        'UPDATE',
        SYSDATE,
        V_USER
    );
END;
/

ALTER TRIGGER TRG_BILL_AUDIT ENABLE;
