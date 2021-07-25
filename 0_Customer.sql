DROP TABLE Customer;
CREATE TABLE Customer
(CustomerID     VARCHAR2(5)   NOT NULL,
 CustomerName   VARCHAR2(50)  NOT NULL,
 Gender         VARCHAR2(1)   NOT NULL,
 ContactNo      VARCHAR2(15)  NOT NULL,
 DOB            DATE,
 Email          VARCHAR2(50)  NOT NULL,
 StreetName     VARCHAR2(100) NOT NULL,
 PostCode       NUMBER(7)    NOT NULL,
 City           VARCHAR2(30)  NOT NULL,
 State          VARCHAR2(30)  NOT NULL,
 PRIMARY KEY(CustomerID),
 CONSTRAINT chk_cust_id CHECK (SUBSTR(CustomerID, 0, 1) = 'C'),
 CONSTRAINT chk_ContactNo UNIQUE (ContactNo),
 CONSTRAINT chk_cust_gender CHECK (UPPER(Gender) IN ('M','F')),
 CONSTRAINT chk_email CHECK (REGEXP_LIKE(email,'^[a-zA-Z]\w+@(\S+)$'))
);


-- 200 records
SELECT COUNT(*) FROM Customer;