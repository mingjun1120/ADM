-------------------------------------------- Procedure 1: Deduct Employee Salary ----------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN
SET linesize 90
SET pagesize 100

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';
CREATE OR REPLACE PROCEDURE prc_deduct_salary(input_month IN NUMBER) AS

    v_salary Employee.Salary%TYPE;
    v_newSalary Employee.Salary%TYPE;
    e_invalid_input_month EXCEPTION;

    CURSOR employee_cursor IS
        SELECT E.EmployeeID, E.EmployeeName, E.Salary, A.Remarks, A.Check_In_Time, A.AttendanceDate 
        FROM Employee E, Attendance A
        WHERE E.EmployeeID = A.EmployeeID;
BEGIN
    IF input_month NOT BETWEEN 1 AND 12 THEN
      RAISE e_invalid_input_month;
    END IF;
    
    FOR employee_rec IN employee_cursor LOOP
	
        IF UPPER(employee_rec.Remarks) = 'PRESENT LATE' AND EXTRACT(MONTH FROM employee_rec.AttendanceDate) = input_month THEN
           DBMS_OUTPUT.PUT_LINE('=============================================');
           DBMS_OUTPUT.PUT_LINE('Employee Name       : ' || employee_rec.EmployeeName || ' (' || employee_rec.EmployeeID || ')');
           DBMS_OUTPUT.PUT_LINE('Initial Salary (RM) : ' || employee_rec.Salary);

		   IF employee_rec.Check_In_Time >= '10:30' THEN
             v_salary := 90;
             DBMS_OUTPUT.PUT_LINE(chr(10) || 'Deduct RM' || v_salary || ' due to late 30 minutes and above.' || chr(10));
		   ELSE 
             v_salary := 50;
             DBMS_OUTPUT.PUT_LINE(chr(10) || 'Deduct RM' || v_salary || ' due to late 10 - 29 minutes.' || chr(10));
           END IF;
		   
           UPDATE Employee
           SET Salary = employee_rec.Salary - v_salary
           WHERE EmployeeID = employee_rec.EmployeeID;
           v_newSalary := employee_rec.Salary - v_salary;

           DBMS_OUTPUT.PUT_LINE('Final Salary (RM)   : ' || v_newSalary);
           DBMS_OUTPUT.PUT_LINE('=============================================' || chr(10));
			 
        ELSIF UPPER(employee_rec.Remarks) = 'ABSENT' AND EXTRACT(MONTH FROM employee_rec.AttendanceDate) = input_month THEN
           DBMS_OUTPUT.PUT_LINE('=============================================');
           DBMS_OUTPUT.PUT_LINE('Employee Name       : ' || employee_rec.EmployeeName || ' (' || employee_rec.EmployeeID || ')');
           DBMS_OUTPUT.PUT_LINE('Initial Salary (RM) : ' || employee_rec.Salary);
          
           UPDATE Employee
           SET Salary = employee_rec.Salary - 100
           WHERE EmployeeID = employee_rec.EmployeeID;
           v_newSalary := employee_rec.Salary - 100;

           DBMS_OUTPUT.PUT_LINE(chr(10) || 'Deduct RM' || 100 || ' due to absent to work.' || chr(10));

           DBMS_OUTPUT.PUT_LINE('Final Salary (RM)   : ' || v_newSalary);
           DBMS_OUTPUT.PUT_LINE('=============================================' || chr(10));
        END IF;
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer does not exist');
    WHEN e_invalid_input_month then
        DBMS_OUTPUT.PUT_LINE ('Month value must be 1 - 12!');
END;
/
EXEC prc_deduct_salary(1)
-- I have tested for January and February


-- -- Testing
-- ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';
-- DECLARE
--   STARTTIME TIMESTAMP := '11:00';
--   ENDTIME TIMESTAMP := '9:00';
  
-- BEGIN
--   IF STARTTIME > '10:59' THEN
--     DBMS_OUTPUT.PUT_LINE(STARTTIME || ' is bigger');
--   ELSE
--     DBMS_OUTPUT.PUT_LINE(STARTTIME || ' is smaller');
--   END IF;
-- END;
-- /