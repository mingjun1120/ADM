DROP TABLE Supplier;
CREATE TABLE Supplier
(SupplierID    VARCHAR2(6)   NOT NULL,
 SupplierName  VARCHAR2(50)  NOT NULL,
 ContactNo     VARCHAR2(15)  NOT NULL,
 StreetName    VARCHAR2(100) NOT NULL,
 PostCode      NUMBER(7)     NOT NULL,
 City          VARCHAR2(30)  NOT NULL,
 State         VARCHAR2(30)  NOT NULL,
PRIMARY KEY (SupplierID),
CONSTRAINT chk_supplier_id CHECK (SUBSTR(SupplierID, 1, 3) = 'SUP'),
CONSTRAINT ContactNo UNIQUE (ContactNo)
);

INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP001', 'Apache Factory', '015-2335050', 'Lot 1245, Kundang Industrial Estate', 48020 , 'Rawang', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP002', 'Rotas Warehouse', '014-3280113', '29C, Jalan Tandang 204a, Seksyen 51', 46050 , 'Petaling Jaya', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP003', 'Blue Buffalo Company', '014-1318263', 'Lot 2669, Jalan Kampung, Kampung Baru', 47000 , 'Sungai Buloh', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP004', 'Colgate-Palmolive Company', '017-8909798', '22, Jalan AU 3/1, Taman Keramat', 54200, 'Ampang', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP005', 'Beaphar', '011-8811436', 'No. 2, Jalan MJ/3, Medan Maju Jaya', 46000, 'Petaling Jaya', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP006', 'Diamond Pet Foods', '013-1796927', 'Jalan Sellatheran, Kampung Jawa', 40470, 'Shah Alam', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP007', 'Harringtons', '016-3244005', '1-11, Jalan Layang - Layang 5A, Bandar Puchong Jaya', 47100 , 'Puchong', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP008', 'The J.M. Smucker ', '011-6286210', 'No 30-32, Jalan OP 1/5 One Puchong Business park', 47160 , 'Puchongi', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP009', 'Ty Toyz', '012-8405167', 'Level 5, Menara UAC, No. 12, Jalan PJU7/5', 47800 , 'Petaling Jaya', 'Selangor');
INSERT INTO Supplier (SupplierID, SupplierName, ContactNo, StreetName, PostCode, City, State) VALUES ('SUP010', 'Hill Pet Nutrition', '014-4275793', 'No343, Jalan Tuanku Abdul Rahman', 50100, 'Chow Kit', 'Kuala Lumpur');


-- 10 records
SELECT COUNT(*) FROM Supplier;