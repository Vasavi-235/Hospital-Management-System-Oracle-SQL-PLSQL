/*
-------------------------------------------------------
Hospital Management System
Package : PKG_BILLING
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE PACKAGE PKG_BILLING
AS
    PROCEDURE GENERATE_BILL
    (
        P_PATIENT_ID       IN NUMBER,
        P_APPOINTMENT_ID   IN NUMBER,
        P_CONSULTATION_FEE IN NUMBER,
        P_LABS_CHARGES     IN NUMBER,
        P_MEDICINE_CHARGES IN NUMBER
    );

    PROCEDURE UPDATE_PAYMENT_STATUS
    (
        P_BILL_ID IN NUMBER,
        P_STATUS  IN VARCHAR2
    );

    FUNCTION GET_TOTAL_REVENUE
    RETURN NUMBER;
END PKG_BILLING;
/

CREATE OR REPLACE PACKAGE BODY PKG_BILLING
AS

    PROCEDURE GENERATE_BILL
    (
        P_PATIENT_ID       IN NUMBER,
        P_APPOINTMENT_ID   IN NUMBER,
        P_CONSULTATION_FEE IN NUMBER,
        P_LABS_CHARGES     IN NUMBER,
        P_MEDICINE_CHARGES IN NUMBER
    )
    AS
        V_TOTAL_AMOUNT NUMBER(10,2);
    BEGIN
        V_TOTAL_AMOUNT :=
              P_CONSULTATION_FEE
            + P_LABS_CHARGES
            + P_MEDICINE_CHARGES;

        INSERT INTO BILLS
        (
            BILL_ID,
            PATIENT_ID,
            APPOINTMENT_ID,
            BILL_DATE,
            CONSULTATION_FEE,
            LAB_CHARGES,
            MEDICINE_CHARGES,
            TOTAL_AMOUNT,
            PAYMENT_STATUS
        )
        VALUES
        (
            BILL_SEQ.NEXTVAL,
            P_PATIENT_ID,
            P_APPOINTMENT_ID,
            SYSDATE,
            P_CONSULTATION_FEE,
            P_LABS_CHARGES,
            P_MEDICINE_CHARGES,
            V_TOTAL_AMOUNT,
            'PENDING'
        );

        COMMIT;
    END GENERATE_BILL;

    PROCEDURE UPDATE_PAYMENT_STATUS
    (
        P_BILL_ID IN NUMBER,
        P_STATUS  IN VARCHAR2
    )
    AS
    BEGIN
        UPDATE BILLS
        SET PAYMENT_STATUS = UPPER(P_STATUS)
        WHERE BILL_ID = P_BILL_ID;

        COMMIT;
    END UPDATE_PAYMENT_STATUS;

    FUNCTION GET_TOTAL_REVENUE
    RETURN NUMBER
    AS
        V_REVENUE NUMBER;
    BEGIN
        SELECT NVL(SUM(TOTAL_AMOUNT), 0)
        INTO V_REVENUE
        FROM BILLS
        WHERE PAYMENT_STATUS = 'PAID';

        RETURN V_REVENUE;
    END GET_TOTAL_REVENUE;

END PKG_BILLING;
/
