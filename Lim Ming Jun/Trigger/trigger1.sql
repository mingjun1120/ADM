/*
   References:
   https://stackoverflow.com/questions/3015431/oracle-age-calculation-from-date-of-birth-and-today
*/

-------------------------------------------- Trigger 1: Check Employee Age ----------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN
SET linesize 180
SET pagesize 100
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
CREATE OR REPLACE TRIGGER trg_check_emp_age
BEFORE INSERT ON Employee
FOR EACH ROW
DECLARE
    v_actualAge NUMBER;
BEGIN
    -- Since we are assuming our pet shop is opearating in 2018, so we minus 3 years for sysdate so that the currnt year become 2018
    v_actualAge := (SYSDATE - NUMTOYMINTERVAL(3, 'year') - TO_DATE(:new.DOB, 'DD-MM-YYYY')) / 365.25;
    IF (v_actualAge < 18) THEN
        
        RAISE_APPLICATION_ERROR(-20100, 'Under age! The person has not officially turned 18!');
        
    ELSE
        
        DBMS_OUTPUT.PUT_LINE('A new employee with ID "' || :new.EmployeeID || '" was successfully added!');
        
    END IF;
END;
/
INSERT INTO Employee VALUES ('E012', 'J001', 'Tan Xiao Min', 'M', '016-3333567', TO_DATE('18-02-2001', 'DD-MM-YYYY'), TO_DATE('01-03-2018', 'DD-MM-YYYY'), 1800.00, 'tanxm@gmail.com', '33, Jalan Bukit Mewah, 5/7, Bukit Mewah, 59000, Kuala Lumpur');