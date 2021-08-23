SET linesize 380
SET pagesize 180

-- All Workers
CREATE OR REPLACE VIEW AllWorkers AS
SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.AttendanceDate) AS TOTAL_DAYS
FROM Attendance A, Employee E, Job J
WHERE A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
SELECT * FROM AllWorkers;

-- Late Workers
CREATE OR REPLACE VIEW LateWorkers AS
SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS LATE_TIMES
FROM Attendance A, Employee E, Job J
WHERE UPPER(A.Remarks) LIKE 'PRESENT LATE' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
SELECT * FROM LateWorkers;

-- Absent Workers
CREATE OR REPLACE VIEW AbsentWorkers AS
SELECT J.JobPosition, E.EmployeeID, E.EmployeeName, COUNT(A.Remarks) AS ABSENT_TIMES
FROM Attendance A, Employee E, Job J
WHERE UPPER(A.Remarks) LIKE 'ABSENT' AND A.EmployeeID = E.EmployeeID AND J.JobID = E.JobID
GROUP BY J.JobPosition, E.EmployeeID, E.EmployeeName
ORDER BY J.JobPosition ASC, E.EmployeeID ASC;
SELECT * FROM AbsentWorkers;

-- ALLLateWorkers (Left Join All Workers and Late Workers)
CREATE OR REPLACE VIEW ALLLateWorkers AS
SELECT AllWorkers.JobPosition, AllWorkers.EmployeeID, AllWorkers.EmployeeName, NVL(LateWorkers.LATE_TIMES, 0) AS LATE_TIMES, 
       ROUND(((AllWorkers.TOTAL_DAYS - NVL(LateWorkers.LATE_TIMES, 0))/AllWorkers.TOTAL_DAYS)*100, 2) AS ON_TIME_RATE, AllWorkers.TOTAL_DAYS AS TOTAL_DAYS
FROM AllWorkers
LEFT JOIN LateWorkers ON AllWorkers.EmployeeID = LateWorkers.EmployeeID
ORDER BY AllWorkers.JobPosition ASC, AllWorkers.EmployeeID ASC;
SELECT * FROM ALLLateWorkers;

-- -- ALLLateAbsentWorkers (Left Join ALLLateWorkers and Absent Workers)
-- CREATE OR REPLACE VIEW ALLLateAbsentWorkers AS
-- SELECT ALLLateWorkers.JobPosition, ALLLateWorkers.EmployeeID, ALLLateWorkers.EmployeeName, ALLLateWorkers.LATE_TIMES, ALLLateWorkers.ON_TIME_RATE,
--        NVL(AbsentWorkers.ABSENT_TIMES, 0) AS ABSENT_TIMES, 
--        ROUND(((ALLLateWorkers.TOTAL_DAYS - NVL(AbsentWorkers.ABSENT_TIMES, 0))/ALLLateWorkers.TOTAL_DAYS)*100, 2) AS PRESENT_RATE, ALLLateWorkers.TOTAL_DAYS
-- FROM ALLLateWorkers
-- LEFT JOIN AbsentWorkers ON ALLLateWorkers.EmployeeID = AbsentWorkers.EmployeeID
-- ORDER BY ALLLateWorkers.JobPosition ASC, ALLLateWorkers.EmployeeID ASC;
-- SELECT * FROM ALLLateAbsentWorkers;


TTITLE CENTER "EMPLOYEE ATTENDANCE ANALYSATION" SKIP 1 -
CENTER 'CUTY PET SHOP' SKIP 1-
CENTER '-------------------' SKIP 3

COLUMN JobPosition FORMAT A12 HEADING 'JOB TYPE'
COLUMN EmployeeID FORMAT A11 HEADING 'EMPLOYEE ID'
COLUMN EmployeeName HEADING 'EMPLOYEE NAME'
COLUMN LATE_TIMES HEADING 'LATE TIMES'
COLUMN ON_TIME_RATE HEADING 'ON-TIME RATE (%)'
COLUMN ABSENT_TIMES HEADING 'ABSENT TIMES'
COLUMN PRESENT_RATE HEADING 'PRESENT RATE (%)'
COLUMN TOTAL_DAYS HEADING 'TOTAL WORKING DAYS'

BREAK ON JobPosition SKIP 2

SELECT ALLLateWorkers.JobPosition,
       ALLLateWorkers.EmployeeID,
       ALLLateWorkers.EmployeeName,
       ALLLateWorkers.TOTAL_DAYS,
       ALLLateWorkers.LATE_TIMES,
       ALLLateWorkers.ON_TIME_RATE,
       NVL(AbsentWorkers.ABSENT_TIMES, 0) AS ABSENT_TIMES, 
       ROUND(((ALLLateWorkers.TOTAL_DAYS - NVL(AbsentWorkers.ABSENT_TIMES, 0))/ALLLateWorkers.TOTAL_DAYS)*100, 2) AS PRESENT_RATE
FROM ALLLateWorkers
LEFT JOIN AbsentWorkers ON ALLLateWorkers.EmployeeID = AbsentWorkers.EmployeeID
ORDER BY ALLLateWorkers.JobPosition ASC, ALLLateWorkers.EmployeeID ASC;

CLEAR BREAKS
CLEAR COMPUTES
TTITLE OFF