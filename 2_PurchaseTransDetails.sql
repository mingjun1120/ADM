DROP TABLE PurchaseTransDetails;
CREATE TABLE PurchaseTransDetails
(PurchaseTransID  VARCHAR2(5) NOT NULL,       
 ProductCode      VARCHAR2(5) NOT NULL,
 Quantity         NUMBER(6) NOT NULL,
PRIMARY KEY(PurchaseTransID, ProductCode),
FOREIGN KEY (PurchaseTransID) references PurchaseTrans(PurchaseTransID),
FOREIGN KEY (ProductCode) references Product(ProductCode),
CONSTRAINT CHK_ptd_qty CHECK (Quantity > 0)
);

--OCT 2020
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT001', 'P1004', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT001', 'P1005', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT002', 'P1011', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P1019', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P1020', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P1022', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT003', 'P1023', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT004', 'P1006', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT004', 'P1007', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT005', 'P1017', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT006', 'P1003', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT006', 'P1002', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT007', 'P1013', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT008', 'P1015', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT008', 'P1016', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT009', 'P1001', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT010', 'P1010', 80);

--NOV 2020
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT011', 'P1008', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT011', 'P1009', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT012', 'P1021', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1002', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1003', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT014', 'P1006', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT014', 'P1007', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT015', 'P1020', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT016', 'P1017', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT016', 'P1018', 50);

--DEC 2020
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT017', 'P1010', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT018', 'P1012', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT018', 'P1014', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT019', 'P1001', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT020', 'P1004', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT020', 'P1005', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT021', 'P1011', 10);

--JAN 2021
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT022', 'P1008', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT022', 'P1019', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT023', 'P1015', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT023', 'P1016', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT024', 'P1019', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT024', 'P1020', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT024', 'P1021', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT025', 'P1014', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT026', 'P1018', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT027', 'P1001', 15);

--FEB 2021
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT028', 'P1022', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT028', 'P1023', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT029', 'P1001', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT030', 'P1015', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT030', 'P1016', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT031', 'P1010', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1012', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1013', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT033', 'P1018', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT034', 'P1006', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT035', 'P1004', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT035', 'P1005', 75);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT036', 'P1009', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT037', 'P1003', 100);

--MAR 2021
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT038', 'P1011', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT039', 'P1001', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT039', 'P1002', 90);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT040', 'P1007', 80);

-- 61 rows
SELECT COUNT(*) FROM PurchaseTransDetails;