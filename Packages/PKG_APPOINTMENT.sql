/*
-------------------------------------------------------
Hospital Management System
Package : PKG_APPOINTMENT
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE PACKAGE PKG_APPOINTMENT
AS
    PROCEDURE BOOK_APPOINTMENT
    (
        P_PATIENT_ID       IN NUMBER,
        P_DOCTOR_ID        IN NUMBER,
        P_APPOINTMENT_DATE IN DATE,
        P_STATUS           IN VARCHAR2
    );

    FUNCTION GET_APPOINTMENT_COUNT
    RETURN NUMBER;
END PKG_APPOINTMENT;
/

CREATE OR REPLACE PACKAGE BODY PKG_APPOINTMENT
AS

    PROCEDURE BOOK_APPOINTMENT
    (
        P_PATIENT_ID       IN NUMBER,
        P_DOCTOR_ID        IN NUMBER,
        P_APPOINTMENT_DATE IN DATE,
        P_STATUS           IN VARCHAR2
    )
    IS
    BEGIN
        INSERT INTO APPOINTMENTS
        (
            APPOINTMENT_ID,
            PATIENT_ID,
            DOCTOR_ID,
            APPOINTMENT_DATE,
            STATUS
        )
        VALUES
        (
            APPOINTMENT_SEQ.NEXTVAL,
            P_PATIENT_ID,
            P_DOCTOR_ID,
            P_APPOINTMENT_DATE,
            P_STATUS
        );

        COMMIT;
    END BOOK_APPOINTMENT;

    FUNCTION GET_APPOINTMENT_COUNT
    RETURN NUMBER
    IS
        V_COUNT NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO V_COUNT
        FROM APPOINTMENTS;

        RETURN V_COUNT;
    END GET_APPOINTMENT_COUNT;

END PKG_APPOINTMENT;
/
