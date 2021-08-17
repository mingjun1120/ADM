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

--OCT 2017 (17)
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

--NOV 2017 (12)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT011', 'P1044', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT011', 'P1045', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT011', 'P1046', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT012', 'P1028', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT012', 'P1029', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1024', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1025', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1048', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT013', 'P1049', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT014', 'P1034', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT014', 'P1035', 5);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT015', 'P1031', 5);

--DEC 2017 (17)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT016', 'P1008', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT016', 'P1009', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT017', 'P1021', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT018', 'P1002', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT018', 'P1003', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT019', 'P1006', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT019', 'P1007', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT020', 'P1020', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT021', 'P1017', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT021', 'P1018', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT022', 'P1010', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT023', 'P1012', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT023', 'P1014', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT024', 'P1001', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT025', 'P1004', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT025', 'P1005', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT026', 'P1011', 10);

--JAN 2018 (17)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT027', 'P1008', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT027', 'P1009', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT028', 'P1015', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT028', 'P1016', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT029', 'P1019', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT029', 'P1020', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT029', 'P1021', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT030', 'P1017', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT030', 'P1018', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT031', 'P1001', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1040', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1041', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1042', 5);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT032', 'P1043', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT033', 'P1047', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT034', 'P1036', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT034', 'P1037', 25);

--FEB 2018 (18)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT035', 'P1036', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT035', 'P1037', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT036', 'P1044', 40);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT037', 'P1024', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT037', 'P1026', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT038', 'P1029', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT039', 'P1034', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT039', 'P1035', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT040', 'P1018', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT041', 'P1006', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT042', 'P1004', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT042', 'P1005', 75);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT043', 'P1009', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT044', 'P1003', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT045', 'P1032', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT045', 'P1033', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT046', 'P1038', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT046', 'P1039', 25);

--MAR 2018 (9)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT047', 'P1011', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT048', 'P1001', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT048', 'P1002', 90);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT049', 'P1007', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT050', 'P1026', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT050', 'P1027', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT050', 'P1050', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT050', 'P1051', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT051', 'P1030', 50);

--APR 2018 (16)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT052', 'P1022', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT052', 'P1023', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT053', 'P1001', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT054', 'P1015', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT054', 'P1016', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT055', 'P1010', 100);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT056', 'P1012', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT056', 'P1013', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT057', 'P1043', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT058', 'P1038', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT058', 'P1039', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT059', 'P1040', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT059', 'P1041', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT060', 'P1029', 15);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT060', 'P1030', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT061', 'P1047', 3);

--MAY 2018 (16)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT062', 'P1026', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT062', 'P1027', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT062', 'P1050', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT062', 'P1051', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT063', 'P1032', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT063', 'P1033', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT064', 'P1011', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT065', 'P1036', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT065', 'P1037', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT066', 'P1044', 55);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT066', 'P1045', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT066', 'P1046', 55);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT067', 'P1007', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT068', 'P1019', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT068', 'P1020', 70);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT069', 'P1028', 30);

--JUN 2018 (15)
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT070', 'P1042', 10);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT071', 'P1024', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT071', 'P1025', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT071', 'P1048', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT071', 'P1049', 3);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT072', 'P1017', 80);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT073', 'P1012', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT073', 'P1013', 25);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT073', 'P1014', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT074', 'P1034', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT074', 'P1035', 20);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT075', 'P1031', 30);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT076', 'P1021', 50);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT076', 'P1022', 60);
INSERT INTO PurchaseTransDetails (PurchaseTransID, ProductCode, Quantity) VALUES ('PT076', 'P1023', 50);

-- 61 rows
SELECT COUNT(*) FROM PurchaseTransDetails;