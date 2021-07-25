DROP TABLE Employee;
CREATE TABLE Employee
(EmployeeID     VARCHAR2(5)   NOT NULL,
 JobID          VARCHAR2(5)   NOT NULL,
 EmployeeName   VARCHAR2(20)  NOT NULL,
 Gender         VARCHAR2(1)   NOT NULL,
 ContactNo      VARCHAR2(15)  NOT NULL,
 DOB            DATE,
 HiredDate      DATE          NOT NULL,
 YearExp        NUMBER(2)     NOT NULL,
 Salary         NUMBER(7, 2)  NOT NULL,
 Email          VARCHAR2(50)  NOT NULL,
 Address        VARCHAR2(100) NOT NULL,
 Position       VARCHAR2(30)  NOT NULL,
 CONSTRAINT Employee_PK PRIMARY KEY(EmployeeID),
 CONSTRAINT Employee_FK FOREIGN KEY(JobID) REFERENCES Job(JobID),
 CONSTRAINT chk_EmployeeID CHECK (SUBSTR(EmployeeID, 0, 1) = 'E'),
 CONSTRAINT chk_JobID CHECK (SUBSTR(JobID, 0, 1) = 'J'),
 CONSTRAINT chk_ContactNo_Unique UNIQUE (ContactNo),
 CONSTRAINT chk_ContactNo_Num CHECK (REGEXP_LIKE(ContactNo,'^[0-9]+-[0-9]{7,8}$')),
 CONSTRAINT chk_Gender CHECK (UPPER(Gender) IN ('M','F')),
 CONSTRAINT chk_YearExp CHECK (YearExp < 40 AND YearExp >= 0)
 CONSTRAINT chk_Salary CHECK (Salary > 1200),
 CONSTRAINT chk_Email CHECK (REGEXP_LIKE(Email, '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'))
);

-- 5 records
SELECT COUNT(*) FROM Employee;

-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp