DROP TABLE Job;
CREATE TABLE Job
(JobID          VARCHAR2(5)   NOT NULL,
 JobScope       VARCHAR2(100)  NOT NULL,
 BasicSalary    NUMBER(7, 2)  NOT NULL,
 CONSTRAINT Job_PK PRIMARY KEY(JobID),
 CONSTRAINT chk_JobID CHECK (SUBSTR(JobID, 0, 1) = 'J'),
 CONSTRAINT chk_Salary CHECK (BasicSalary > 1200)
);

INSERT INTO Job (JobID, JobScope, BasicSalary) VALUES ('J001','Process payment and register sales on cash register', 1500.00);
INSERT INTO Job (JobID, JobScope, BasicSalary) VALUES ('J002','Determine inventory items and examine received inventory', 1700.00);
INSERT INTO Job (JobID, JobScope, BasicSalary) VALUES ('J003','Perform operational duties in ordering, receiving, storing, issuing stocks', 2000.00);
INSERT INTO Job (JobID, JobScope, BasicSalary) VALUES ('J004','Provide professional service to the pet', 2500.00);
INSERT INTO Job (JobID, JobScope, BasicSalary) VALUES ('J005','Manage and Supervise the employees and audit daily reports', 3000.00);

-- 5 records
SELECT COUNT(*) FROM Job;

-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp