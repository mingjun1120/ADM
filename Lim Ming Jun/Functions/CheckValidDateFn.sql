---------------------------------------- Function 1 ---------------------------------------------

CREATE OR REPLACE FUNCTION TEST_DATE(Date_Input VARCHAR2) RETURN VARCHAR2 IS
    V_DATE DATE;
BEGIN
    SELECT TO_DATE(Date_Input,'DD-MM-YYYY') INTO V_DATE FROM DUAL;
    RETURN 'VALID';
EXCEPTION 
    WHEN OTHERS THEN RETURN 'INVALID';
END;
/