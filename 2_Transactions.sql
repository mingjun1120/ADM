DROP TABLE Transactions;
CREATE TABLE Transactions
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