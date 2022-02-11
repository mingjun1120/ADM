/*
References:
    https://stackoverflow.com/questions/28888848/how-to-subtract-years-from-sysdate
*/

-------------------------------------------- Trigger 2: Validate Employee Salary Limit ----------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN
SET linesize 260
SET pagesize 100

CREATE OR REPLACE TRIGGER trg_check_sal_limit_when_update
BEFORE UPDATE OF SALARY ON EMPLOYEE
FOR EACH ROW
DECLARE
   
   v_JobType Job.JobPosition%TYPE;
   v_got_error BOOLEAN := FALSE;
   v_allowSalary Employee.Salary%TYPE;
   
BEGIN
    
    IF (:new.JobID = 'J001') THEN
    
        IF (:new.Salary >= 3700) THEN
            v_got_error := TRUE;
            v_JobType := 'Pet Groomer';
            v_allowSalary := 3700;
        END IF;
    
    ELSIF (:new.JobID = 'J002') THEN
    
        IF (:new.Salary >= 2600) THEN
            v_got_error := TRUE;
            v_JobType := 'Stock-keeper';
            v_allowSalary := 2600;
        END IF;
    
    ELSIF (:new.JobID = 'J003') THEN
    
        IF (:new.Salary >= 3100) THEN
            v_got_error := TRUE;
            v_JobType := 'Retailer';
            v_allowSalary := 3100;
        END IF;
    
    END IF;
    
    IF v_got_error = TRUE THEN
        
        RAISE_APPLICATION_ERROR(-20101, 'Salary too high! Please promote this employee to a higher seniority level to increase his/her salary. Thank You!');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary updated! The new salary is RM ' || :new.Salary || '.');
        DBMS_OUTPUT.PUT_LINE('=============================================');
    END IF;
END;
/

UPDATE Employee SET Salary = 4000 WHERE EmployeeID = 'E001';

-- EXCEPTION
--     WHEN e_salary_too_high THEN
--         DBMS_OUTPUT.PUT_LINE(chr(10) || '===================================================================================================');
--         DBMS_OUTPUT.PUT_LINE ('This employee "' || :old.EmployeeID || '" new salary exceeds the allowable range of his position (RM' || v_allowSalary || ').'
--             || chr(10) ||'Please promote this employee to a higher seniority level to increase his/her salary. Thank You!' 
--             || chr(10) ||'This employee "' || :old.EmployeeID || '" current salary will remain in RM ' || :old.Salary);
--         DBMS_OUTPUT.PUT_LINE('===================================================================================================');
