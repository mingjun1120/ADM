------------------------------------------------------------------ On-Demand Report --------------------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

SET linesize 260
SET pagesize 500

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

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

CREATE OR REPLACE PROCEDURE prc_employee_ot_report(year_input NUMBER) AS
    
    TYPE emp_ot_rec_type IS RECORD (emp_job Job.JobPosition%TYPE, 
                                    emp_id Employee.EmployeeID%TYPE, 
                                    emp_name Employee.EmployeeName%TYPE, 
                                    emp_total_ot_days NUMBER,
                                    emp_basic_sal Job.BasicSalary%TYPE,
                                    emp_total_ot_wages NUMBER,
                                    emp_final_sal Employee.Salary%TYPE
                                );
    TYPE map_varchar IS TABLE OF emp_ot_rec_type INDEX BY VARCHAR2(30);
    l_emp emp_ot_rec_type;
    l_map map_varchar;

    e_invalid_input_year EXCEPTION;
    data_no_found EXCEPTION;
    
    v_empID_month VARCHAR2(8);
    v_chkMonth NUMBER := 111;
    v_chkMonthTXT VARCHAR2(10);
    ctrler_MonDiff NUMBER := 0;

    v_totalBasic NUMBER := 0;
    v_totalOTEarned NUMBER := 0;
    v_totalFinalSal NUMBER := 0;

    v_totalYearBasic NUMBER := 0;
    v_totalYearOTEarned NUMBER := 0;
    v_totalYearFinalSal NUMBER := 0;
    
    CURSOR empOT_cursor IS
        SELECT A.AttendanceDate, J.JobID, J.JobPosition, E.EmployeeName, E.EmployeeID, J.BasicSalary, A.Check_Out_Time
        FROM Employee E, Job J, Attendance A
        WHERE J.JobID = E.JobID AND A.EmployeeID = E.EmployeeID AND EXTRACT(YEAR FROM A.AttendanceDate) = year_input AND UPPER(A.Remarks) LIKE 'PRESENT AND WORK OVERTIME'
        ORDER BY A.AttendanceDate ASC;
    
    CURSOR empOT_each_mem_mon_cursor IS
        SELECT EXTRACT(MONTH FROM A.AttendanceDate) AS NOW_MONTH, TO_CHAR(TO_DATE(EXTRACT(MONTH FROM A.AttendanceDate), 'MM'), 'MONTH') AS TXT_MONTH,
               J.JobPosition AS JOB_TYPE,
               E.EmployeeID AS EMPLOYEE_ID, 
               E.EmployeeName AS EMPLOYEE_NAME,
               COUNT(A.AttendanceDate) AS TOTAL_DAYS
        FROM Attendance A, Employee E, Job J
        WHERE A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID AND UPPER(A.Remarks) LIKE 'PRESENT AND WORK OVERTIME'
        GROUP BY EXTRACT(MONTH FROM A.AttendanceDate), TO_CHAR(TO_DATE(EXTRACT(MONTH FROM A.AttendanceDate), 'MM'), 'MONTH'), J.JobPosition, E.EmployeeID, E.EmployeeName
        ORDER BY EXTRACT(MONTH FROM A.AttendanceDate), J.JobPosition ASC;
    
BEGIN
    
    IF year_input < 2018 THEN
       RAISE e_invalid_input_year;
    ELSIF year_input > EXTRACT(YEAR FROM (SYSDATE - NUMTOYMINTERVAL(3, 'year'))) THEN
       RAISE data_no_found;
    END IF;

    FOR empOT_rec IN empOT_cursor LOOP
        
        l_emp.emp_job := empOT_rec.JobPosition;
        l_emp.emp_id := empOT_rec.EmployeeID;
        l_emp.emp_name := empOT_rec.EmployeeName;
        l_emp.emp_total_ot_days := FIND_OT_DAYS(empOT_rec.JobID, empOT_rec.EmployeeID, EXTRACT(MONTH FROM empOT_rec.AttendanceDate), EXTRACT(YEAR FROM empOT_rec.AttendanceDate));
        l_emp.emp_basic_sal := empOT_rec.BasicSalary;
        l_emp.emp_total_ot_wages := FIND_OT_WAGES(empOT_rec.JobID, empOT_rec.EmployeeID, EXTRACT(MONTH FROM empOT_rec.AttendanceDate), EXTRACT(YEAR FROM empOT_rec.AttendanceDate));
        l_emp.emp_final_sal := empOT_rec.BasicSalary + FIND_OT_WAGES(empOT_rec.JobID, empOT_rec.EmployeeID, EXTRACT(MONTH FROM empOT_rec.AttendanceDate), EXTRACT(YEAR FROM empOT_rec.AttendanceDate));
        
        v_empID_month := empOT_rec.EmployeeID || '_' || TO_CHAR(EXTRACT(MONTH FROM empOT_rec.AttendanceDate));
        l_map(v_empID_month) := l_emp;
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==============================================================', 97, ' '));
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('EMPLOYEE MONTHLY OVERTIME REPORT ', 80, ' ') || year_input);
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==============================================================', 97, ' ') || chr(10));
    
    
    DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('EMPLOYEE NAME', 20) || '| ' || RPAD('EMPLOYEE ID', 12) || '| ' || RPAD('JOB TYPE', 15) || '| ' || RPAD('TOTAL OVERTIME DAYS', 20) || '| ' || RPAD('BASIC SALARY', 13) || '| ' || RPAD('TOTAL OVERTIME EARNED', 22) || '| ' || RPAD('FINAL SALARY', 13) || '|');
    DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
    
    FOR empOT_each_mem_mon_rec IN empOT_each_mem_mon_cursor LOOP
        v_empID_month := empOT_each_mem_mon_rec.EMPLOYEE_ID || '_' || TO_CHAR(empOT_each_mem_mon_rec.NOW_MONTH);

        IF TO_NUMBER(empOT_each_mem_mon_rec.NOW_MONTH) != v_chkMonth THEN
            ctrler_MonDiff := ctrler_MonDiff + 1;
            IF ctrler_MonDiff >= 2 THEN
                v_totalYearBasic := v_totalYearBasic + v_totalBasic;
                v_totalYearOTEarned := v_totalYearOTEarned + v_totalOTEarned;
                v_totalYearFinalSal := v_totalYearFinalSal + v_totalFinalSal;
                DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
                DBMS_OUTPUT.PUT_LINE('| ' || LPAD(RTRIM(v_chkMonthTXT, ' ') || ' TOTAL' || ':', 73) || '| ' || LPAD(TO_CHAR(v_totalBasic, 'fm9999999.90'), 13) || '| ' || LPAD(TO_CHAR(v_totalOTEarned, 'fm9999999.90'), 22) || '| ' || LPAD(TO_CHAR(v_totalFinalSal, 'fm9999999.90'), 13) || ' |');
                DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
            END IF;
        END IF;

        DBMS_OUTPUT.PUT_LINE('| ' || RPAD(l_map(v_empID_month).emp_name, 20) || '| ' ||
                             RPAD(l_map(v_empID_month).emp_id, 12) || '| ' ||
                             RPAD(l_map(v_empID_month).emp_job, 15) || '| ' ||
                             LPAD(l_map(v_empID_month).emp_total_ot_days, 20) || '| ' ||
                             LPAD(TO_CHAR(l_map(v_empID_month).emp_basic_sal, 'fm9999999.90'), 13) || '| ' ||
                             LPAD(TO_CHAR(l_map(v_empID_month).emp_total_ot_wages, 'fm9999999.90'), 22) || '| ' ||
                             LPAD(TO_CHAR(l_map(v_empID_month).emp_final_sal, 'fm9999999.90'), 13) || ' |'
                            );
        v_chkMonth := TO_NUMBER(empOT_each_mem_mon_rec.NOW_MONTH);
        v_chkMonthTXT := empOT_each_mem_mon_rec.TXT_MONTH;
        v_totalBasic := v_totalBasic + l_map(v_empID_month).emp_basic_sal;
        v_totalOTEarned := v_totalOTEarned + l_map(v_empID_month).emp_total_ot_wages;
        v_totalFinalSal := v_totalFinalSal + l_map(v_empID_month).emp_final_sal;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || LPAD(RTRIM(v_chkMonthTXT, ' ') || ' TOTAL' || ':', 73) || '| ' || LPAD(TO_CHAR(v_totalBasic, 'fm9999999.90'), 13) || '| ' || LPAD(TO_CHAR(v_totalOTEarned, 'fm9999999.90'), 22) || '| ' || LPAD(TO_CHAR(v_totalFinalSal, 'fm9999999.90'), 13) || ' |');
    DBMS_OUTPUT.PUT_LINE('+-' || RPAD('--------------------', 20) || '--' || RPAD('--------------------', 12) || '--' || RPAD('--------------------', 15) || '--' || RPAD('--------------------', 20) || '+-' || RPAD('-----------------', 13) || '+-' || RPAD('----------------------', 22) || '+-' || RPAD('---------------------------', 13) || '+');
    
    DBMS_OUTPUT.PUT_LINE('. ' || LPAD('=', 59) || '=====================================================================');
    DBMS_OUTPUT.PUT_LINE('. ' || LPAD('YEARLY TOTAL' || ':', 73) || '  ' || LPAD(TO_CHAR(v_totalYearBasic, 'fm9999999.90'), 13) || '  ' || LPAD(TO_CHAR(v_totalYearOTEarned, 'fm9999999.90'), 22) || '  ' || LPAD(TO_CHAR(v_totalYearFinalSal, 'fm9999999.90'), 13));
    DBMS_OUTPUT.PUT_LINE('. ' || LPAD('=', 59) || '=====================================================================');

EXCEPTION
    WHEN e_invalid_input_year THEN
        DBMS_OUTPUT.PUT_LINE (chr(10) || 'The year value must start from 2018!');
    WHEN data_no_found THEN
        DBMS_OUTPUT.PUT_LINE (chr(10) || 'No data found according to your input! Please enter correct year (start from 2018)!');
END;
/
EXEC prc_employee_ot_report(2018)
