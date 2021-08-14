DROP TABLE Attendance;
CREATE TABLE Attendance
(AttendanceDate    DATE         NOT NULL,
 EmployeeID        VARCHAR2(5)  NOT NULL,
 Check_In_Time     TIMESTAMP,
 Check_Out_Time    TIMESTAMP,
 Remarks           VARCHAR2(20)
 CONSTRAINT Attendance_PK PRIMARY KEY(AttendanceDate, EmployeeID),
 CONSTRAINT Attendance_FK FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
 CONSTRAINT chk_EmployeeID CHECK (SUBSTR(EmployeeID, 0, 1) = 'E'),
 CONSTRAINT chk_Remarks CHECK (UPPER(Remarks) IN ('PRESENT','ABSENT', 'PRESENT LATE', 'LEAVE')),
);

-- 5 records
SELECT COUNT(*) FROM Employee;

-- ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';


-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp