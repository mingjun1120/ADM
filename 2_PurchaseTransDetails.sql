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

--OCT 2020
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT001', 'P0004', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT001', 'P0005', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT002', 'P0011', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P0019', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P0020', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P0022', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P0023', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT004', 'P0006', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT004', 'P0007', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT005', 'P0017', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT006', 'P0003', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT006', 'P0002', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT007', 'P0013', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT008', 'P0015', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT008', 'P0016', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT009', 'P0001', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT0010', 'P0010', 80);
