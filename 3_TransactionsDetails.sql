DROP TABLE TransactionsDetails;
CREATE TABLE TransactionsDetails
(TransactionsID  NUMBER(6) NOT NULL,       
 ProductCode     NUMBER(6) NOT NULL,
 Quantity        NUMBER(6) NOT NULL,
PRIMARY KEY(TransactionsID, ProductCode),
FOREIGN KEY TransactionsID references Transactions(TransactionsID),
FOREIGN KEY ProductCode references Product(ProductCode),
CONSTRAINT CHK_td_qty CHECK (Quantity > 0)
);