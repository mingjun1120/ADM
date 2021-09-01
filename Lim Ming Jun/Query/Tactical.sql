/*
References:
    http://www.dba-oracle.com/t_display_multiple_distinct_columns_sql.htm
    https://stackoverflow.com/questions/983415/is-it-possible-to-break-on-a-column-in-addition-to-the-one-specified-in-sqlplus
    https://www.datameer.com/blog/sql_how-to-convert-month-number-to-month-name-in-sql/
    https://www.techonthenet.com/oracle/functions/to_number.php
*/


------------------------------------------ TACTICAL: Select those employees who check-in late of each month ----------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN
SET linesize 90
SET pagesize 100

-- ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

CLEAR SCREEN

COLUMN MONTH FORMAT A12 HEADING 'MONTH'
COLUMN JOB_TYPE FORMAT A12 HEADING 'JOB TYPE'
COLUMN EMPLOYEE_ID FORMAT A11 HEADING 'EMPLOYEE ID'
COLUMN EMPLOYEE_NAME HEADING 'EMPLOYEE NAME'
COLUMN ATTEND_DATE HEADING 'ATTENDANCE DATE'
COLUMN CHECKINTIME FORMAT A13 HEADING 'CHECK IN TIME'
-- BREAK ON JOB_TYPE ON EMPLOYEE_NAME ON MONTH

TTITLE CENTER '=========================================================' SKIP 1 -
CENTER 'EMPLOYEE LATE RECORDS' SKIP 1-
CENTER '=========================================================' SKIP 2

BREAK ON MONTH NODUP ON JOB_TYPE NODUP ON EMPLOYEE_ID NODUP ON EMPLOYEE_NAME NODUP

SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM A.AttendanceDate), 'MM'), 'MONTH') AS MONTH,
       J.JobPosition AS JOB_TYPE,
       E.EmployeeID AS EMPLOYEE_ID,
       E.EmployeeName AS EMPLOYEE_NAME,
       A.AttendanceDate AS ATTEND_DATE,
       CONCAT(A.Check_In_Time, CASE WHEN TO_NUMBER(EXTRACT(hour FROM A.Check_In_Time)) BETWEEN 0 AND 12 THEN ' AM' ELSE ' PM' END) AS CHECKINTIME
FROM EMPLOYEE E, ATTENDANCE A, JOB J
WHERE UPPER(A.Remarks) LIKE 'PRESENT LATE' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
ORDER BY TO_DATE(MONTH, 'MM'), J.JobID;
