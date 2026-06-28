/*
-------------------------------------------------------
Hospital Management System
Package : PKG_DOCTOR
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE PACKAGE PKG_DOCTOR
AS
    PROCEDURE REGISTER_DOCTOR
    (
        P_DOCTOR_NAME    IN VARCHAR2,
        P_SPECIALIZATION IN VARCHAR2,
        P_MOBILE_NO      IN VARCHAR2
    );

    FUNCTION GET_DOCTOR_COUNT
    RETURN NUMBER;
END PKG_DOCTOR;
/

CREATE OR REPLACE PACKAGE BODY PKG_DOCTOR
AS

    PROCEDURE REGISTER_DOCTOR
    (
        P_DOCTOR_NAME    IN VARCHAR2,
        P_SPECIALIZATION IN VARCHAR2,
        P_MOBILE_NO      IN VARCHAR2
    )
    IS
    BEGIN

        INSERT INTO DOCTORS
        (
            DOCTOR_ID,
            DOCTOR_NAME,
            SPECIALIZATION,
            MOBILE_NO
        )
        VALUES
        (
            DOCTOR_SEQ.NEXTVAL,
            P_DOCTOR_NAME,
            P_SPECIALIZATION,
            P_MOBILE_NO
        );

        COMMIT;

    END REGISTER_DOCTOR;

    FUNCTION GET_DOCTOR_COUNT
    RETURN NUMBER
    IS
        V_COUNT NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO V_COUNT
        FROM DOCTORS;

        RETURN V_COUNT;
    END GET_DOCTOR_COUNT;

END PKG_DOCTOR;
/
