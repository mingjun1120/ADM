DROP TABLE PurchaseTrans;
CREATE TABLE PurchaseTrans
(PurchaseTransID  VARCHAR2(5)   NOT NULL,       
 SupplierID       VARCHAR2(6)   NOT NULL,
 Date_Paid        DATE,
 Total_Price      NUMBER(7,2) NOT NULL,
PRIMARY KEY (PurchaseTransID),
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
CONSTRAINT chk_pt_id CHECK (SUBSTR(PurchaseTransID, 1, 2) = 'PT'),
CONSTRAINT chk_total_price CHECK (Total_Price > 0)
);

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';

--OCT 2017
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT001', 'SUP002', '01-10-2017', 875.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT002', 'SUP005', '01-10-2017', 800.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT003', 'SUP009', '06-10-2017', 732.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT004', 'SUP003', '13-10-2017', 420.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT005', 'SUP008', '17-10-2017', 400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT006', 'SUP001', '20-10-2017', 230.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT007', 'SUP007', '24-10-2017', 390.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT008', 'SUP010', '27-10-2017', 2874.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT009', 'SUP001', '30-10-2017', 2100.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT010', 'SUP006', '31-10-2017', 720.00);

--NOV 2017
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT011', 'SUP017', '02-11-2017', 2730.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT012', 'SUP012', '03-11-2017', 1890.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT013', 'SUP011', '12-11-2017', 4008.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT014', 'SUP015', '15-11-2017', 224.50);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT015', 'SUP013', '15-11-2017', 344.50);

--DEC 2017
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT016', 'SUP004', '01-12-2017', 2090.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT017', 'SUP009', '01-12-2017', 20.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT018', 'SUP001', '01-12-2017', 135.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT019', 'SUP003', '13-12-2017', 700.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT020', 'SUP009', '15-12-2017', 30.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT021', 'SUP008', '21-12-2017', 750.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT022', 'SUP006', '21-12-2017', 450.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT023', 'SUP007', '26-12-2017', 462.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT024', 'SUP001', '26-12-2017', 1400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT025', 'SUP002', '30-12-2017', 875.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT026', 'SUP005', '31-12-2017', 800.00);

--JAN 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT027', 'SUP004', '01-01-2018', 472.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT028', 'SUP010', '01-01-2018', 1224.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT029', 'SUP009', '12-01-2018', 345.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT030', 'SUP008', '15-01-2018', 580.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT031', 'SUP001', '23-01-2018', 1050.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT032', 'SUP014', '23-01-2018', 2995.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT033', 'SUP014', '31-01-2018', 795.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT034', 'SUP016', '31-01-2018', 1095.00);

--FEB 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT035', 'SUP016', '03-02-2018', 1314.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT036', 'SUP017', '05-02-2018', 280.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT037', 'SUP011', '10-02-2018', 3840.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT038', 'SUP012', '15-02-2018', 560.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT039', 'SUP015', '15-02-2018', 369.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT040', 'SUP008', '22-02-2018', 150.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT041', 'SUP003', '23-02-2018', 400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT042', 'SUP002', '26-02-2018', 1412.50);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT043', 'SUP004', '28-02-2018', 45.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT044', 'SUP001', '28-02-2018', 130.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT045', 'SUP013', '28-02-2018', 2877.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT046', 'SUP016', '28-02-2018', 1067.50);

--MAR 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT047', 'SUP005', '05-03-2018', 1200.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT048', 'SUP001', '09-03-2018', 790.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT049', 'SUP003', '11-03-2018', 800.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT050', 'SUP011', '17-03-2018', 4128.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT051', 'SUP012', '29-03-2018', 290.00);

--APR 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT052', 'SUP009', '09-04-2018', 894.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT053', 'SUP001', '09-04-2018', 1400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT054', 'SUP010', '10-04-2018', 2199.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT055', 'SUP006', '12-04-2018', 900.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT056', 'SUP007', '12-04-2018', 1170.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT057', 'SUP014', '12-04-2018', 1834.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT058', 'SUP016', '22-04-2018', 1566.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT059', 'SUP014', '24-04-2018', 960.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT060', 'SUP012', '30-04-2018', 594.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT061', 'SUP014', '30-04-2018', 795.00);

--MAY 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT062', 'SUP011', '01-05-2018', 6528.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT063', 'SUP013', '05-05-2018', 2877.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT064', 'SUP005', '08-05-2018', 2000.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT065', 'SUP016', '10-05-2018', 3066.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT066', 'SUP017', '14-05-2018', 2150.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT067', 'SUP003', '14-05-2018', 800.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT068', 'SUP009', '17-05-2018', 364.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT069', 'SUP012', '21-05-2018', 1050.00);

--JUN 2018
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT070', 'SUP014', '18-06-2018', 550.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT071', 'SUP011', '19-06-2018', 6408.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT072', 'SUP008', '19-06-2018', 1600.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT073', 'SUP007', '23-06-2018', 1437.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT074', 'SUP015', '27-06-2018', 738.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT075', 'SUP013', '27-06-2018', 2067.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT076', 'SUP009', '30-06-2018', 854.00);

-- 76 records
SELECT COUNT(*) FROM PurchaseTrans;