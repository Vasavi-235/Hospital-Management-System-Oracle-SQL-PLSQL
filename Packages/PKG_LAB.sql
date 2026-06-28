/*
-------------------------------------------------------
Hospital Management System
Package : PKG_LAB
Author  : Vasavi
-------------------------------------------------------
*/

CREATE OR REPLACE PACKAGE PKG_LAB
AS
    PROCEDURE INSERT_LAB_RESULT
    (
        P_PATIENT_ID      IN NUMBER,
        P_APPOINTMENT_ID  IN NUMBER,
        P_TEST_NAME       IN VARCHAR2,
        P_TEST_RESULT     IN VARCHAR2
    );

    FUNCTION GET_LAB_COUNT
    RETURN NUMBER;
END PKG_LAB;
/

CREATE OR REPLACE PACKAGE BODY PKG_LAB
AS

    PROCEDURE INSERT_LAB_RESULT
    (
        P_PATIENT_ID      IN NUMBER,
        P_APPOINTMENT_ID  IN NUMBER,
        P_TEST_NAME       IN VARCHAR2,
        P_TEST_RESULT     IN VARCHAR2
    )
    AS
    BEGIN
        INSERT INTO LAB_RESULTS
        (
            LAB_ID,
            PATIENT_ID,
            APPOINTMENT_ID,
            TEST_NAME,
            TEST_RESULT,
            TEST_DATE
        )
        VALUES
        (
            LAB_SEQ.NEXTVAL,
            P_PATIENT_ID,
            P_APPOINTMENT_ID,
            P_TEST_NAME,
            P_TEST_RESULT,
            SYSDATE
        );

        COMMIT;
    END INSERT_LAB_RESULT;

    FUNCTION GET_LAB_COUNT
    RETURN NUMBER
    AS
        V_COUNT NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO V_COUNT
        FROM LAB_RESULTS;

        RETURN V_COUNT;
    END GET_LAB_COUNT;

END PKG_LAB;
/
