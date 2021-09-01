------------------------------------------ OPERATIONAL: Select Transactions Details Handled by Employee ----------------------------------------

-- ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

SET linesize 105
SET pagesize 100

ACCEPT input_month DATE FORMAT 'MM'-
PROMPT 'Enter the month (1-6): '

CLEAR SCREEN

COLUMN MONTH FORMAT A12 HEADING 'MONTH'
COLUMN JOB_TYPE FORMAT A12 HEADING 'JOB TYPE'
COLUMN EMPLOYEE_ID FORMAT A11 HEADING 'EMPLOYEE ID'
COLUMN EMPLOYEE_NAME HEADING 'EMPLOYEE NAME'
COLUMN TRANS_DATE FORMAT A15 HEADING 'ATTENDANCE DATE'
COLUMN TRANS_QTY_HANDLED HEADING 'TOTAL TRANSACTIONS HANDLED'

TTITLE CENTER '==========================================================' SKIP 1 -
CENTER 'EMPLOYEE TRANSACTION RECORDS' SKIP 1-
CENTER '==========================================================' SKIP 2

BREAK ON MONTH NODUP ON JOB_TYPE NODUP ON EMPLOYEE_ID NODUP ON EMPLOYEE_NAME NODUP

-- CREATE OR REPLACE VIEW VIEWL_ATE_EMP AS
SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM T.Date_Paid), 'MM'), 'MONTH') AS MONTH,
       J.JobPosition AS JOB_TYPE,
       E.EmployeeID AS EMPLOYEE_ID,
       E.EmployeeName AS EMPLOYEE_NAME,
       T.Date_Paid AS TRANS_DATE,
       COUNT(J.JobID) AS TRANS_QTY_HANDLED
FROM EMPLOYEE E, JOB J, Transactions T
WHERE T.EmployeeID = E.EmployeeID AND J.JobID = E.JobID AND EXTRACT(MONTH FROM T.Date_Paid) = '&input_month'
GROUP BY TO_CHAR(TO_DATE(EXTRACT(MONTH FROM T.Date_Paid), 'MM'), 'MONTH'), J.JobPosition, E.EmployeeID, E.EmployeeName, T.Date_Paid
ORDER BY TO_DATE(MONTH, 'MM'), T.Date_Paid;

