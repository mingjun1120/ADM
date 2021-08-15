DROP TABLE Job;
CREATE TABLE Job
(JobID          VARCHAR2(5)   NOT NULL,
 JobPosition    VARCHAR2(25)  NOT NULL,
 JobScope       VARCHAR2(100) NOT NULL,
 BasicSalary    NUMBER(7, 2)  NOT NULL,
 CONSTRAINT Job_PK PRIMARY KEY(JobID),
 CONSTRAINT chk_JobID CHECK (SUBSTR(JobID, 0, 1) = 'J'),
 CONSTRAINT chk_JobPosition CHECK (REGEXP_LIKE(JobPosition,'^[A-Za-z]+$'))
 CONSTRAINT chk_Salary CHECK (BasicSalary > 1200)
);


INSERT INTO Job VALUES ('J001', 'Pet Groomer', 'To ensure that pets are neat, clean, and look their best. The pet groomer’s responsibilities include bathing animals of various sizes and temperaments, trimming, clipping, or shaving hair/fur, and removing matted hair.', 2900.00);
INSERT INTO Job VALUES ('J002', 'Stock-keeper', 'Maintains receipts, records, and withdrawals. Checks materials and supplies and reports when stock is low. Receives and unpacks materials and supplies. Additionally, report damages and discrepancies for accounting, reimbursement and record-keeping purposes.', 1800.00);
INSERT INTO Job VALUES ('J003', 'Retailer', 'Assisting customers as they shop within a store. Duties include greeting customers, answering questions related to the merchandise and store policies and locating items for customers.', 2300.00);



-- 3 records
SELECT COUNT(*) FROM Job;

-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp