/*
-------------------------------------------------------
Hospital Management System
Trigger : TRG_ORDER_ID
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE TRIGGER TRG_ORDER_ID
BEFORE INSERT ON LAB_ORDERS
FOR EACH ROW
BEGIN
    IF :NEW.ORDER_ID IS NULL THEN
        :NEW.ORDER_ID := ORDER_SEQ.NEXTVAL;
    END IF;
END;
/

ALTER TRIGGER TRG_ORDER_ID ENABLE;
