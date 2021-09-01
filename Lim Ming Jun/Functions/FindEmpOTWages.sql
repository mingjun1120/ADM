-- Function 2

CREATE OR REPLACE FUNCTION FIND_OT_WAGES(empJobID VARCHAR2, empID VARCHAR2, entered_month NUMBER, entered_year NUMBER) RETURN NUMBER IS
    
    CURSOR employee_cursor IS
        SELECT E.EmployeeID, E.EmployeeName, E.Salary, J.BasicSalary, A.Check_In_Time, A.Check_Out_Time, A.AttendanceDate
        FROM   Employee E, Attendance A, Job J
        WHERE  E.EmployeeID = A.EmployeeID AND
               E.JobID = J.JobID AND
               EXTRACT(MONTH FROM A.AttendanceDate) = entered_month AND 
               EXTRACT(YEAR FROM A.AttendanceDate) = entered_year AND
               E.EmployeeID = empID AND 
               J.JobID = empJobID AND
               UPPER(A.Remarks) LIKE 'PRESENT AND WORK OVERTIME'
        ORDER BY E.EmployeeID;
    
    otHour NUMBER;
    otMinute NUMBER;
    increment Employee.Salary%TYPE := 0;
    is_found_rec BOOLEAN := FALSE;

BEGIN
    FOR employee_rec IN employee_cursor LOOP
        is_found_rec := TRUE;
        IF TO_CHAR(employee_rec.Check_Out_Time, 'HH24:MI') > '19:00' THEN
           
            otHour := EXTRACT(HOUR FROM employee_rec.Check_Out_Time) - 19;
            otMinute := EXTRACT(MINUTE FROM employee_rec.Check_Out_Time);
        
            IF otHour >= 1 THEN
                increment := increment + (employee_rec.BasicSalary / 6 / 8) * 1.5 * otHour;     
            ELSIF otMinute >= 30 AND otHour = 0 THEN
                increment := increment + (employee_rec.BasicSalary / 6 / 8);
            END IF;
        END IF;
    END LOOP;
    
    IF NOT is_found_rec THEN
        RETURN 0;
    ELSE
        RETURN increment;
    END IF;
    
EXCEPTION 
    WHEN OTHERS THEN RETURN 0;
END;
/