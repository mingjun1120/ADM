DROP TABLE Customer;
CREATE TABLE Customer
(CustomerID     VARCHAR(4)   NOT NULL,
 CustomerName   VARCHAR(50)  NOT NULL,
 Gender         VARCHAR(1)   NOT NULL,
 ContactNo      VARCHAR(15)  NOT NULL,
 DOB            DATE, 
 Email          VARCHAR(50)  NOT NULL,
 StreetName     VARCHAR(100) NOT NULL,
 PostCode       NUMBER(7)    NOT NULL,
 City           VARCHAR(30)  NOT NULL,
 State          VARCHAR(30)  NOT NULL,
PRIMARY KEY(CustomerID),
CONSTRAINT chk_cust_id CHECK (SUBSTR(CustomerID, 1, 1) = 'C'),
CONSTRAINT ContactNo UNIQUE (ContactNo),
CONSTRAINT chk_cust_gender CHECK (UPPER(Gender) IN ('M','F')),
CONSTRAINT chk_email CHECK (REGEXP_LIKE(email,'^[a-zA-Z]\w+@(\S+)$'))
);



-- 200 records
SELECT COUNT(*) FROM Customer;