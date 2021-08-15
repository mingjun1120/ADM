DROP TABLE Employee;
CREATE TABLE Employee
(EmployeeID     VARCHAR2(5)   NOT NULL,
 JobID          VARCHAR2(5)   NOT NULL,
 EmployeeName   VARCHAR2(20)  NOT NULL,
 Gender         VARCHAR2(1)   NOT NULL,
 ContactNo      VARCHAR2(15)  NOT NULL,
 DOB            DATE,
 HiredDate      DATE          NOT NULL,
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
 CONSTRAINT chk_Salary CHECK (Salary > 1200),
 CONSTRAINT chk_Email CHECK (REGEXP_LIKE(Email, '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'))
);

-- CONSTRAINT chk_YearExp CHECK (YearExp < 40 AND YearExp >= 0)

-- Position: Pet Groomer
INSERT INTO Employee VALUES ('E001', 'J001', 'Yap Kim Chun', 'M', '012-3232450', TO_DATE('08-02-1994', 'DD-MM-YYYY'), TO_DATE('01-01-2018', 'DD-MM-YYYY'), 2900.00, 'yapkc@gmail.com', '20, Jalan Pandan Indah, 4/16, Pandan Indah, 55100, KL.')
INSERT INTO Employee VALUES ('E002', 'J001', 'Cheong Siong Hou', 'M', '012-4141450', TO_DATE('11-10-1996', 'DD-MM-YYYY'), TO_DATE('01-03-2018', 'DD-MM-YYYY'), 2900.00, 'cheongsh@gmail.com', '22, Jalan Pandan Mewah, 5/12, Pandan Mewah, 55100, KL.')
INSERT INTO Employee VALUES ('E003', 'J001', 'Chen Xia Wei', 'M', '018-7575455', TO_DATE('05-11-1997', 'DD-MM-YYYY'), TO_DATE('01-01-2019', 'DD-MM-YYYY'), 2900.00, 'chenxw@gmail.com', '18, Jalan Teratai, 2/4, Taman Bukit Teratai, 56100, KL.')

-- Position: Stock-keeper
INSERT INTO Employee VALUES ('E004', 'J002', 'Teh Yi Hong', 'M', '012-1212460', TO_DATE('13-06-1995', 'DD-MM-YYYY'), TO_DATE('01-01-2018', 'DD-MM-YYYY'), 1800.00, 'tehyh@gmail.com', '12, Jalan Bukit Indah, 3/18, Bukit Indah, 50100, KL.')
INSERT INTO Employee VALUES ('E005', 'J002', 'Hong Yen Kit', 'M', '016-1234765', TO_DATE('18-02-1998', 'DD-MM-YYYY'), TO_DATE('01-03-2018', 'DD-MM-YYYY'), 1800.00, 'hongyk@gmail.com', '28, Jalan Bukit Mewah, 5/7, Bukit Mewah, 59000, KL.')

-- Position: Retailer/Retail associate
INSERT INTO Employee VALUES ('E006', 'J003', 'Ong Shannen', 'F', '019-7716480', TO_DATE('21-01-1998', 'DD-MM-YYYY'), TO_DATE('01-01-2018', 'DD-MM-YYYY'), 2300.00, 'ongsn@gmail.com', '11, Jalan Muda, 1/7, Taman Muda, 53100, KL.')
INSERT INTO Employee VALUES ('E007', 'J003', 'Tai Sin Yen', 'F', '019-7316470', TO_DATE('20-05-1998', 'DD-MM-YYYY'), TO_DATE('01-03-2018', 'DD-MM-YYYY'), 2300.00, 'taisy@gmail.com', '16, Jalan Permai, 1/9, Taman Permai, 53000, KL.')
INSERT INTO Employee VALUES ('E008', 'J003', 'Lim Shu Ting', 'F', '014-5234474', TO_DATE('15-03-1999', 'DD-MM-YYYY'), TO_DATE('01-01-2019', 'DD-MM-YYYY'), 2300.00, 'limst@gmail.com', '23, Jalan Seraya, 3/6, Taman Seraya, 58200, KL.')

-- 8 records
SELECT COUNT(*) FROM Employee;

-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp