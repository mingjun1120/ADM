-------------------------------------------- Procedure 2: Add Overtime Employee Salary ----------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN
SET linesize 90
SET pagesize 100

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';
CREATE OR REPLACE PROCEDURE prc_add_overtime_salary(input_month IN NUMBER, input_year IN NUMBER) AS

    increment Employee.Salary%TYPE;
    v_newSalary Employee.Salary%TYPE;
    e_invalid_input_month EXCEPTION;
    e_invalid_input_year EXCEPTION;
    otHour NUMBER;
    otMinute NUMBER;
    is_found_rec boolean := FALSE;
    chkSameID Employee.EmployeeID%TYPE := 'test';
    latestSal Employee.Salary%TYPE;

    CURSOR employee_cursor IS
        SELECT E.EmployeeID, E.EmployeeName, E.Salary AS Salary, J.BasicSalary, A.Remarks, A.Check_In_Time, A.Check_Out_Time, A.AttendanceDate 
        FROM Employee E, Attendance A, Job J
        WHERE E.EmployeeID = A.EmployeeID AND E.JobID = J.JobID AND EXTRACT(MONTH FROM A.AttendanceDate) = input_month AND EXTRACT(YEAR FROM A.AttendanceDate) = input_year
        ORDER BY E.EmployeeID;
BEGIN
    IF input_month NOT BETWEEN 1 AND 12 THEN
      RAISE e_invalid_input_month;
    END IF;
    
    IF input_year < 2018 THEN
      RAISE e_invalid_input_year;
    END IF;

    FOR employee_rec IN employee_cursor LOOP
        is_found_rec := TRUE;
        
        IF employee_rec.EmployeeID LIKE chkSameID THEN
            latestSal := v_newSalary;
        ELSE
            latestSal := employee_rec.Salary;
        END IF;
        
        IF UPPER(employee_rec.Remarks) = 'PRESENT AND WORK OVERTIME' THEN
            DBMS_OUTPUT.PUT_LINE('=============================================');
            DBMS_OUTPUT.PUT_LINE('Employee Name       : ' || employee_rec.EmployeeName || ' (' || employee_rec.EmployeeID || ')');
            DBMS_OUTPUT.PUT_LINE('Check-Out Time      : ' || CONCAT(employee_rec.Check_Out_Time, CASE WHEN EXTRACT(hour FROM employee_rec.Check_Out_Time) BETWEEN 0 AND 12 THEN ' AM' ELSE ' PM' END));
            DBMS_OUTPUT.PUT_LINE('Attendance Date     : ' || employee_rec.AttendanceDate);
            DBMS_OUTPUT.PUT_LINE('Initial Salary (RM) : ' || latestSal);

            IF TO_CHAR(employee_rec.Check_Out_Time, 'HH24:MI') > '19:00' THEN
    
                otHour := EXTRACT(HOUR FROM employee_rec.Check_Out_Time) - 19;
                otMinute := EXTRACT(MINUTE FROM employee_rec.Check_Out_Time);
                    
                IF otHour >= 1 THEN
                    increment := (employee_rec.BasicSalary / 6 / 8) * 1.5 * otHour;
                    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Add RM' || increment || ' due to overtime for ' || otHour || ' hour.' || chr(10));
                
                ELSIF otMinute >= 30 AND otHour = 0 THEN
                    increment := (employee_rec.BasicSalary / 6 / 8);
                    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Add RM' || increment || ' due to overtime for ' || otMinute || ' minutes.' || chr(10));
                END IF;
                
                UPDATE Employee
                SET Salary = latestSal + increment
                WHERE EmployeeID = employee_rec.EmployeeID;
                v_newSalary := latestSal + increment;
                
                DBMS_OUTPUT.PUT_LINE('Final Salary (RM)   : ' || v_newSalary);
                DBMS_OUTPUT.PUT_LINE('=============================================' || chr(10));
                chkSameID := employee_rec.EmployeeID;
            END IF;
        END IF;
    END LOOP;
    
    IF NOT is_found_rec THEN
        DBMS_OUTPUT.PUT_LINE('No data was found according to your entered details!');
    END IF;
    
EXCEPTION
    WHEN e_invalid_input_month THEN
        DBMS_OUTPUT.PUT_LINE ('The month value must be between 1-12!');
    WHEN e_invalid_input_year THEN
        DBMS_OUTPUT.PUT_LINE ('The year value must start from 2018!');
END;
/
EXEC prc_add_overtime_salary(3, 2018)
-- Feb, March

-- COLUMN Check_Out_Time FORMAT A14
-- SELECT E.EmployeeID, E.EmployeeName, E.Salary, J.BasicSalary, A.Check_Out_Time, COUNT(EmployeeName) AS TOTAL_OT_DAYS
-- FROM Employee E, Attendance A, Job J
-- WHERE E.EmployeeID = A.EmployeeID AND E.JobID = J.JobID AND EXTRACT(MONTH FROM A.AttendanceDate) = 4 
--     AND EXTRACT(YEAR FROM A.AttendanceDate) = 2018 AND UPPER(A.Remarks) = 'PRESENT AND WORK OVERTIME'
-- GROUP BY E.EmployeeID, E.EmployeeName, E.Salary, J.BasicSalary,  A.Check_Out_Time
-- ORDER BY E.EmployeeName;
