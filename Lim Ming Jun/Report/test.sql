
/*
   References:
   https://stackoverflow.com/questions/19054773/pl-sql-datastructure-like-hashmap
*/

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

SET linesize 130
SET pagesize 100

CREATE OR REPLACE PROCEDURE prc_employee_late_absence_report(input_month IN NUMBER, input_year IN NUMBER) AS
   
    TYPE emp_rec_type IS RECORD (emp_job Job.JobPosition%TYPE, 
                                 emp_id Employee.EmployeeID%TYPE, 
                                 emp_name Employee.EmployeeName%TYPE, 
                                 emp_total_days NUMBER, 
                                 emp_late_times NUMBER, 
                                 emp_ontime_rates NUMBER(4, 2),
                                 emp_absent_times NUMBER,
                                 emp_present_rates NUMBER(4, 2)
                                );
    TYPE map_varchar IS TABLE OF emp_rec_type INDEX BY VARCHAR2(30);
    l_emp emp_rec_type;
    l_map map_varchar;

    chkLateExistence BOOLEAN := FALSE;
    chkAbsentExistence BOOLEAN := FALSE;
   
    CURSOR allWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.AttendanceDate) AS TOTAL_DAYS
        FROM Attendance A, Employee E, Job J
        WHERE A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
    CURSOR allLateWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS LATE_TIMES
        FROM Attendance A, Employee E, Job J
        WHERE UPPER(A.Remarks) LIKE 'PRESENT LATE' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
    CURSOR allAbsentWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS ABSENT_TIMES
        FROM Attendance A, Employee E, Job J
        WHERE UPPER(A.Remarks) LIKE 'ABSENT' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
BEGIN
    
    FOR allWorker_rec IN allWorker_cursor LOOP

        chkLateExistence := FALSE;
        chkAbsentExistence := FALSE;

        l_emp.emp_job := allWorker_rec.JobPosition;
        l_emp.emp_id := allWorker_rec.EmployeeID;
        l_emp.emp_name := allWorker_rec.EmployeeName;
        l_emp.emp_total_days := allWorker_rec.TOTAL_DAYS;

        FOR allLateWorker_rec IN allLateWorker_cursor LOOP
            
            IF allLateWorker_rec.EmployeeID = allWorker_rec.EmployeeID THEN
               
               chkLateExistence := TRUE;
               l_emp.emp_late_times := allLateWorker_rec.LATE_TIMES;
               l_emp.emp_ontime_rates := ROUND(((allWorker_rec.TOTAL_DAYS - allLateWorker_rec.LATE_TIMES)/allWorker_rec.TOTAL_DAYS)*100, 2);

            END IF;
        END LOOP;
        
        IF chkLateExistence = FALSE THEN
          l_emp.emp_late_times := 0;
          l_emp.emp_ontime_rates := ROUND(((allWorker_rec.TOTAL_DAYS - 0)/allWorker_rec.TOTAL_DAYS)*100, 2);
        END IF;

        FOR allAbsentWorker_rec IN allAbsentWorker_cursor LOOP
            
            IF allAbsentWorker_rec.EmployeeID = allWorker_rec.EmployeeID THEN
                
                chkAbsentExistence := TRUE;
                l_emp.emp_absent_times := allAbsentWorker_rec.ABSENT_TIMES;
                l_emp.emp_present_rates := ROUND(((allWorker_rec.TOTAL_DAYS - allAbsentWorker_rec.ABSENT_TIMES)/allWorker_rec.TOTAL_DAYS)*100, 2);
                
            END IF;
        END LOOP;

        IF chkAbsentExistence = FALSE THEN
          l_emp.emp_absent_times := 0;
          l_emp.emp_present_rates := ROUND(((allWorker_rec.TOTAL_DAYS - 0)/allWorker_rec.TOTAL_DAYS)*100, 2);
        END IF;

        l_map(allWorker_rec.EmployeeID) := l_emp;
    END LOOP;
END;
/