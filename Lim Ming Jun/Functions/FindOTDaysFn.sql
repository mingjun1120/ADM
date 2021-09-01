CREATE OR REPLACE FUNCTION FIND_OT_DAYS(empJobID VARCHAR2, empID VARCHAR2, entered_month NUMBER, entered_year NUMBER) RETURN NUMBER IS
    V_OT_DAYS NUMBER := 0;
BEGIN
    SELECT COUNT(E.EmployeeID) INTO V_OT_DAYS
    FROM   Employee E, Attendance A, Job J
    WHERE  E.EmployeeID = A.EmployeeID AND
           E.JobID = J.JobID AND
           EXTRACT(MONTH FROM A.AttendanceDate) = entered_month AND
           EXTRACT(YEAR FROM A.AttendanceDate) = entered_year AND
           E.EmployeeID = empID AND
           J.JobID = empJobID AND
           UPPER(A.Remarks) LIKE 'PRESENT AND WORK OVERTIME'
    GROUP BY E.EmployeeName
    ORDER BY E.EmployeeID;
    
    RETURN V_OT_DAYS;
EXCEPTION 
    WHEN OTHERS THEN RETURN 0;
END;
/