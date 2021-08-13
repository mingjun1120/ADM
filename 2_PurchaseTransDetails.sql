DROP TABLE PurchaseTransDetails;
CREATE TABLE PurchaseTransDetails
(PurchaseTransID  VARCHAR2(5) NOT NULL,       
 ProductCode      VARCHAR2(5) NOT NULL,
 Quantity         NUMBER(6) NOT NULL,
PRIMARY KEY(PurchaseTransID, ProductCode),
FOREIGN KEY PurchaseTransID references PurchaseTrans(PurchaseTransID),
FOREIGN KEY ProductCode references Product(ProductCode),
CONSTRAINT CHK_ptd_qty CHECK (Quantity > 0)
);