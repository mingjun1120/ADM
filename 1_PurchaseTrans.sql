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

--OCT 2020
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT001', 'SUP001', '01-10-2020', 875.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT002', 'SUP002', '01-10-2020', 800.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT003', 'SUP009', '06-10-2020', 732.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT004', 'SUP003', '13-10-2020', 420.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT005', 'SUP008', '17-10-2020', 400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT006', 'SUP001', '20-10-2020', 230.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT007', 'SUP007', '24-10-2020', 390.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT008', 'SUP010', '27-10-2020', 2874.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT009', 'SUP001', '30-10-2020', 2100.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT010', 'SUP006', '30-10-2020', 720.00);

--NOV 2020
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT011', 'SUP004', '02-11-2020', 2090.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT012', 'SUP009', '03-11-2020', 20.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT013', 'SUP001', '15-11-2020', 135.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT014', 'SUP003', '20-11-2020', 700.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT015', 'SUP009', '20-11-2020', 30.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT016', 'SUP008', '29-11-2020', 750.00);

--DEC 2020
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT017', 'SUP006', '10-12-2020', 450.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT018', 'SUP007', '18-12-2020', 462.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT019', 'SUP001', '18-12-2020', 140.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT020', 'SUP002', '18-12-2020', 875.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT021', 'SUP005', '31-12-2020', 800.00);

--JAN 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT022', 'SUP004', '01-01-2021', 472.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT023', 'SUP010', '01-01-2021', 1224.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT024', 'SUP009', '12-01-2021', 345.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT025', 'SUP007', '15-01-2021', 178.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT026', 'SUP008', '23-01-2021', 180.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT027', 'SUP001', '23-01-2021', 1050.00);

--FEB 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT028', 'SUP009', '10-02-2021', 894.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT029', 'SUP001', '10-02-2021', 1400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT030', 'SUP010', '15-02-2021', 2199.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT031', 'SUP006', '15-02-2021', 900.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT032', 'SUP007', '22-02-2021', 1170.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT033', 'SUP008', '23-02-2021', 150.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT034', 'SUP003', '28-02-2021', 400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT035', 'SUP002', '28-02-2021', 1412.50);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT036', 'SUP004', '28-02-2021', 45.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT037', 'SUP001', '28-02-2021', 130.00);

--MAR 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT038', 'SUP005', '14-03-2021', 1200.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT039', 'SUP001', '30-03-2021', 790.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT040', 'SUP003', '30-03-2021', 800.00);


-- 40 records
SELECT COUNT(*) FROM PurchaseTrans;