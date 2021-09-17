
/*
   References:
   https://stackoverflow.com/questions/19054773/pl-sql-datastructure-like-hashmap
*/

-------------------------------------------------------------------- Summary Report ---------------------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

SET linesize 300
SET pagesize 1000

CREATE OR REPLACE PROCEDURE prc_employee_late_absence_report(year_input NUMBER) AS
   
    TYPE emp_rec_type IS RECORD (emp_job Job.JobPosition%TYPE, 
                                 emp_id Employee.EmployeeID%TYPE, 
                                 emp_name Employee.EmployeeName%TYPE, 
                                 emp_total_days NUMBER, 
                                 emp_late_times NUMBER, 
                                 emp_ontime_rates NUMBER,
                                 emp_absent_times NUMBER,
                                 emp_present_rates NUMBER
                                );
    TYPE map_varchar IS TABLE OF emp_rec_type INDEX BY VARCHAR2(30);
    l_emp emp_rec_type;
    l_map map_varchar;
    
    e_invalid_input_year EXCEPTION;
    data_no_found EXCEPTION;
    chkLateExistence BOOLEAN := FALSE;
    chkAbsentExistence BOOLEAN := FALSE;
    currentJob Job.JobPosition%TYPE := 'testjob';
    ctrler_JobDiff NUMBER := 0;
    sumTotalWorkingDays NUMBER := 0;
    sumTotalLate NUMBER := 0;
    sumTotalAbsent NUMBER := 0;
   
    CURSOR allWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.AttendanceDate) AS TOTAL_DAYS
        FROM Attendance A, Employee E, Job J
        WHERE A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID AND EXTRACT(YEAR FROM A.AttendanceDate) = year_input
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
    CURSOR allLateWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS LATE_TIMES
        FROM Attendance A, Employee E, Job J
        WHERE UPPER(A.Remarks) LIKE 'PRESENT LATE' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID AND EXTRACT(YEAR FROM A.AttendanceDate) = year_input
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
    CURSOR allAbsentWorker_cursor IS
        SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS ABSENT_TIMES
        FROM Attendance A, Employee E, Job J
        WHERE UPPER(A.Remarks) LIKE 'ABSENT' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID AND EXTRACT(YEAR FROM A.AttendanceDate) = year_input
        GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
    
BEGIN
    IF year_input < 2018 THEN
       RAISE e_invalid_input_year;
    ELSIF year_input > EXTRACT(YEAR FROM (SYSDATE - NUMTOYMINTERVAL(3, 'year'))) THEN
       RAISE data_no_found;
    END IF;
    
    FOR allWorker_rec IN allWorker_cursor LOOP

        chkLateExistence := FALSE;
        chkAbsentExistence := FALSE;

        l_emp.emp_job := allWorker_rec.JobPosition;
        l_emp.emp_id := allWorker_rec.EmployeeID;
        l_emp.emp_name := allWorker_rec.EmployeeName;
        l_emp.emp_total_days := allWorker_rec.TOTAL_DAYS;

        sumTotalWorkingDays := sumTotalWorkingDays + allWorker_rec.TOTAL_DAYS;

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

        sumTotalLate := sumTotalLate + l_emp.emp_late_times;

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

        sumTotalAbsent := sumTotalAbsent + l_emp.emp_absent_times;

        l_map(allWorker_rec.EmployeeID) := l_emp;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==========================================================', 95, ' '));
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('EMPLOYEE ATTENDANCE ANALYSIS REPORT', 81, ' ') || ' ' || year_input);
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==========================================================', 95, ' ') || chr(10));
    
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 11) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 18) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('JOB TYPE', 15) || '| ' || RPAD('EMPLOYEE ID', 11) || '| ' || RPAD('EMPLOYEE NAME', 20) || '| ' || RPAD('TOTAL WORKING DAYS', 18) || '| ' || RPAD('LATE TIMES', 12) || '| ' || RPAD('ON-TIME RATE (%)', 16) || '| ' || RPAD('ABSENT TIMES', 12) || '| ' || RPAD('PRESENT RATE (%)', 16) || '|');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 11) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 18) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+');
    
    FOR allWorker_rec IN allWorker_cursor LOOP

        IF l_map(allWorker_rec.EmployeeID).emp_job != currentJob THEN
            ctrler_JobDiff := ctrler_JobDiff + 1;
            currentJob := l_map(allWorker_rec.EmployeeID).emp_job;
            IF ctrler_JobDiff >= 2 THEN
              DBMS_OUTPUT.PUT_LINE('|' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 11) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 18) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '|');
            END IF;
        ELSE
           currentJob := '.';
        END IF;

        DBMS_OUTPUT.PUT_LINE('|' || RPAD(currentJob, 15) || '| ' || 
                             RPAD(l_map(allWorker_rec.EmployeeID).emp_id, 11) || '| ' ||
                             RPAD(l_map(allWorker_rec.EmployeeID).emp_name, 20) || '| ' ||
                             LPAD(l_map(allWorker_rec.EmployeeID).emp_total_days, 18) || '| ' ||
                             LPAD(l_map(allWorker_rec.EmployeeID).emp_late_times, 12) || '| ' ||
                             LPAD(l_map(allWorker_rec.EmployeeID).emp_ontime_rates, 16) || '| ' ||
                             LPAD(l_map(allWorker_rec.EmployeeID).emp_absent_times, 12) || '| ' ||
                             LPAD(l_map(allWorker_rec.EmployeeID).emp_present_rates, 16) || '|'
                            );
        currentJob := l_map(allWorker_rec.EmployeeID).emp_job;          
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '--' || RPAD('--------------------', 11) || '--' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 18) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+');
    
    
    DBMS_OUTPUT.PUT_LINE('|' || LPAD('OVERALL TOTAL: ', 50) || '| ' || 
                         LPAD(sumTotalWorkingDays, 18) || '| ' || 
                         LPAD(sumTotalLate, 12) || '| ' || 
                         LPAD(ROUND(((sumTotalWorkingDays - sumTotalLate)/sumTotalWorkingDays)*100, 2), 16) || '| ' ||
                         LPAD(sumTotalAbsent, 12) || '| ' ||
                         LPAD(ROUND(((sumTotalWorkingDays - sumTotalAbsent)/sumTotalWorkingDays)*100, 2), 16) || '|'
                        );
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '--' || RPAD('--------------------', 11) || '--' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 18) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 16) || '+');
EXCEPTION
    WHEN e_invalid_input_year THEN
        DBMS_OUTPUT.PUT_LINE (chr(10) || 'The year value must start from 2018!');
    WHEN data_no_found THEN
        DBMS_OUTPUT.PUT_LINE (chr(10) || 'No data found according to your input! Please enter correct year (start from 2018)!');
END;
/
EXEC prc_employee_late_absence_report(2017)
EXEC prc_employee_late_absence_report(2019)
EXEC prc_employee_late_absence_report(2018)
