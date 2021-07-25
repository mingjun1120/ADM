DROP TABLE Job;
CREATE TABLE Job
(JobID          VARCHAR2(5)   NOT NULL,
 JobScope       VARCHAR2(50)  NOT NULL,
 BasicSalary    NUMBER(7, 2)  NOT NULL,
 CONSTRAINT Job_PK PRIMARY KEY(JobID),
 CONSTRAINT chk_JobID CHECK (SUBSTR(JobID, 0, 1) = 'J'),
 CONSTRAINT chk_Salary CHECK (Salary > 1200)
);

-- 5 records
SELECT COUNT(*) FROM Job;

-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp