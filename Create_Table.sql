/* DROP TABLE SEQUENCE */
 
DROP TABLE PurchaseTransDetails;
DROP TABLE PurchaseTrans;
DROP TABLE TransactionsDetails;
DROP TABLE Transactions;
DROP TABLE Appointment;
DROP TABLE Attendance;
DROP TABLE Employee;
DROP TABLE Job;
DROP TABLE Pet;
DROP TABLE Services;
DROP TABLE Supplier;
DROP TABLE Product;
DROP TABLE Customer;

CREATE TABLE Customer
(CustomerID     NUMBER(6)    NOT NULL,
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
CONSTRAINT ContactNo UNIQUE (ContactNo),
CONSTRAINT chk_cust_gender CHECK (UPPER(Gender) IN ('M','F')),
CONSTRAINT chk_email CHECK (REGEXP_LIKE(email,'^[a-zA-Z]\w+@(\S+)$'))
);

CREATE TABLE Product
(ProductCode         NUMBER(6)    NOT NULL,
 ProductName         VARCHAR(30)  NOT NULL,
 ProductType         VARCHAR(20)  NOT NULL,
 ProductVendor       VARCHAR(20)  NOT NULL,
 ProductDescription  VARCHAR(100),
 QuantityInStock     NUMBER(7)    NOT NULL,
 ExpiredDate         DATE,
 BuyPrice            NUMBER(7,2)  NOT NULL,
 MSRP                NUMBER(7,2)  NOT NULL,
PRIMARY KEY(ProductCode),
CONSTRAINT CHK_Quantity CHECK (quantityInStock > 0),
CONSTRAINT CHK_buyPrice CHECK (buyPrice > 0),
CONSTRAINT CHK_MSRP CHECK (MSRP > 0)
);

CREATE TABLE Supplier
(SupplierID    NUMBER(6)    NOT NULL,
 SupplierName  VARCHAR(50)  NOT NULL,
 ContactNo     VARCHAR(15)  NOT NULL,
 StreetName    VARCHAR(100) NOT NULL,
 PostCode      NUMBER(7)    NOT NULL,
 City          VARCHAR(30)  NOT NULL,
 State         VARCHAR(30)  NOT NULL,
PRIMARY KEY(SupplierID),
CONSTRAINT ContactNo UNIQUE (ContactNo)
);

CREATE TABLE Pet
(PetID    NUMBER(6)   NOT NULL,
 PetName  VARCHAR(50) NOT NULL,
 PetType  VARCHAR(15) NOT NULL,
 Sex      VARCHAR(1)  NOT NULL,
 Color    VARCHAR(15) NOT NULL,
PRIMARY KEY(PetID),
CONSTRAINT chk_pet_sex CHECK (UPPER(Sex) IN ('M','F')),
);

CREATE TABLE Services
(ServiceID     NUMBER(6)   NOT NULL,
 ServiceName   VARCHAR(50) NOT NULL,
 ServiceType   VARCHAR(15) NOT NULL,
 ServiceCharge NUMBER(7,2) NOT NULL,
PRIMARY KEY(ServiceID)
CONSTRAINT CHK_service_charge CHECK (ServiceCharge > 0),
);

CREATE TABLE Job
(JobID       NUMBER(6)    NOT NULL,
 JobScope    VARCHAR(100) NOT NULL,
 BasicSalary NUMBER(7,2)  NOT NULL,
PRIMARY KEY(JobID)
CONSTRAINT CHK_basic_salary CHECK (BasicSalary > 0),
);

CREATE TABLE Employee
(EmployeeID    NUMBER(6)    NOT NULL,
 JobID         NUMBER(6)    NOT NULL,
 EmployeeName  VARCHAR(50)  NOT NULL,
 Gender        VARCHAR(1)   NOT NULL,
 ContactNo     VARCHAR(15)  NOT NULL,
 StreetName    VARCHAR(100) NOT NULL,
 PostCode      NUMBER(7)    NOT NULL,
 City          VARCHAR(30)  NOT NULL,
 State         VARCHAR(30)  NOT NULL,
PRIMARY KEY(EmployeeID),
FOREIGN KEY JobID references Job(JobID),
CONSTRAINT chk_emp_gender CHECK (UPPER(Gender) IN ('M','F'))
);

CREATE TABLE Attendance
(AttendDate      DATE,
 EmployeeID      NUMBER(6) NOT NULL,
 Check_In_Time   TIMESTAMP,
 Check_Out_Time  TIMESTAMP,
 Remarks         VARCHAR(100)
PRIMARY KEY(AttendDate, EmployeeID),
FOREIGN KEY EmployeeID references Employee(EmployeeID)
);

CREATE TABLE Appointment
(AppointmentID    NUMBER(6) NOT NULL,       
 CustomerID       NUMBER(6) NOT NULL,
 ServiceID        NUMBER(6) NOT NULL,
 PetID            NUMBER(6) NOT NULL,
 EmployeeID       NUMBER(6) NOT NULL,
 AppointmentDate  DATE
 StartTime        TIMESTAMP,
 EndTime          TIMESTAMP,
 Duration         NUMBER(2) NOT NULL,
PRIMARY KEY(AppointmentID),
FOREIGN KEY CustomerID references Customer(CustomerID),
FOREIGN KEY ServiceID references Services(ServiceID),
FOREIGN KEY PetID references Pet(PetID),
FOREIGN KEY EmployeeID references Employee(EmployeeID),
CONSTRAINT chk_duration CHECK (Duration > 0 AND Duration <= 2)
);

CREATE TABLE TransactionsDetails
(TransactionsID  NUMBER(6) NOT NULL,       
 EmployeeID      NUMBER(6) NOT NULL,
 CustomerID      NUMBER(6) NOT NULL,
 Date_Paid       DATE,
 Total_Price     NUMBER(7,2)   NOT NULL,
PRIMARY KEY(TransactionsID),
FOREIGN KEY EmployeeID references Employee(EmployeeID),
FOREIGN KEY CustomerID references Customer(CustomerID),
CONSTRAINT CHK_td_price CHECK (Total_Price > 0)
);

CREATE TABLE TransactionsDetails
(TransactionsID  NUMBER(6) NOT NULL,       
 ProductCode     NUMBER(6) NOT NULL,
 Quantity        NUMBER(6) NOT NULL,
PRIMARY KEY(TransactionsID, ProductCode),
FOREIGN KEY TransactionsID references Transactions(TransactionsID),
FOREIGN KEY ProductCode references Product(ProductCode),
CONSTRAINT CHK_td_qty CHECK (Quantity > 0)
);

CREATE TABLE PurchaseTrans
(PurchaseTransID  NUMBER(6) NOT NULL,       
 SupplierID       NUMBER(6) NOT NULL,
 Date_Paid        DATE,
 Total_Price      NUMBER(7,2)   NOT NULL,
PRIMARY KEY(PurchaseTransID),
FOREIGN KEY SupplierID references Supplier(SupplierID),
CONSTRAINT CHK_pt_price CHECK (Total_Price > 0)
);

CREATE TABLE PurchaseTransDetails
(PurchaseTransID   NUMBER(6) NOT NULL,       
 ProductCode      NUMBER(6) NOT NULL,
 Quantity         NUMBER(6) NOT NULL,
PRIMARY KEY(PurchaseTransID, ProductCode),
FOREIGN KEY PurchaseTransID references PurchaseTrans(PurchaseTransID),
FOREIGN KEY ProductCode references Product(ProductCode),
CONSTRAINT CHK_ptd_qty CHECK (Quantity > 0)
);
