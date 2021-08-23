/*
References:
    http://www.dba-oracle.com/t_display_multiple_distinct_columns_sql.htm
    https://stackoverflow.com/questions/983415/is-it-possible-to-break-on-a-column-in-addition-to-the-one-specified-in-sqlplus
    https://www.datameer.com/blog/sql_how-to-convert-month-number-to-month-name-in-sql/
    https://www.techonthenet.com/oracle/functions/to_number.php
*/


------------------------------------------ TACTICAL: Select those employees who check-in late of each month ----------------------------------------

-- ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

CREATE OR REPLACE VIEW VIEWL_ATE_EMP AS
SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM A.AttendanceDate), 'MM'), 'MONTH') AS MONTH,
       J.JobPosition AS JOB_TYPE,
       E.EmployeeName AS EMPLOYEE_NAME,
       A.AttendanceDate AS ATTEND_DATE,
       CONCAT(A.Check_In_Time, CASE WHEN TO_NUMBER(EXTRACT(hour FROM A.Check_In_Time)) BETWEEN 0 AND 12 THEN ' AM' ELSE ' PM' END) AS CHECKINTIME,
       COUNT(J.JobID) AS NUM_LATE
FROM EMPLOYEE E, ATTENDANCE A, JOB J
WHERE UPPER(A.Remarks) LIKE 'PRESENT LATE' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
GROUP BY TO_CHAR(TO_DATE(EXTRACT(MONTH FROM A.AttendanceDate), 'MM'), 'MONTH'), J.JobID, J.JobPosition, E.EmployeeName, A.AttendanceDate, A.Check_In_Time
ORDER BY TO_DATE(MONTH, 'MM'), J.JobID;
SELECT * FROM VIEWL_ATE_EMP;

TTITLE CENTER "EMPLOYEE LATE RECORDS" SKIP 1-
CENTER '---------------------' SKIP 2

COLUMN JOB_TYPE FORMAT A12 HEADING 'JOB TYPE'
COLUMN EmployeeID FORMAT A11 HEADING 'EMPLOYEE ID'
COLUMN EMPLOYEE_NAME HEADING 'EMPLOYEE NAME'
COLUMN ATTEND_DATE HEADING 'ATTENDANCE DATE'
COLUMN CHECKINTIME FORMAT A13 HEADING 'CHECK IN TIME'
-- BREAK ON JOB_TYPE ON EMPLOYEE_NAME ON MONTH

BREAK ON MONTH NODUP ON JOB_TYPE NODUP ON EMPLOYEE_NAME NODUP

SELECT MONTH, JOB_TYPE, EMPLOYEE_NAME, ATTEND_DATE, CHECKINTIME
FROM VIEWL_ATE_EMP;