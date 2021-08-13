DROP TABLE PurchaseTransDetails;
CREATE TABLE PurchaseTransDetails
(PurchaseTransID  NUMBER(6) NOT NULL,       
 ProductCode      NUMBER(6) NOT NULL,
 Quantity         NUMBER(6) NOT NULL,
PRIMARY KEY(PurchaseTransID, ProductCode),
FOREIGN KEY PurchaseTransID references PurchaseTrans(PurchaseTransID),
FOREIGN KEY ProductCode references Product(ProductCode),
CONSTRAINT CHK_ptd_qty CHECK (Quantity > 0)
);