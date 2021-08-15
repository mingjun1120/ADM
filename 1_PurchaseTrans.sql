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
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT003', 'SUP003', '06-10-2020', 732.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT004', 'SUP004', '13-10-2020', 420.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT005', 'SUP005', '17-10-2020', 400.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT006', 'SUP006', '20-10-2020', 230.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT007', 'SUP007', '24-10-2020', 390.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT008', 'SUP008', '27-10-2020', 2874.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT009', 'SUP009', '30-10-2020', 2100.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT010', 'SUP010', '30-10-2020', 720.00);

--NOV 2020
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT011', 'SUP001', '01-11-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT012', 'SUP002', '01-11-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT013', 'SUP003', '01-11-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT014', 'SUP004', '01-11-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT015', 'SUP008', '01-11-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT016', 'SUP010', '01-11-2020', 1.00);

--DEC 2020
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT017', 'SUP001', '01-12-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT018', 'SUP002', '01-12-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT019', 'SUP005', '01-12-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT020', 'SUP006', '01-12-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT021', 'SUP007', '01-12-2020', 1.00);

--JAN 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT022', 'SUP003', '01-01-2021', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT023', 'SUP004', '01-01-2021', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT024', 'SUP005', '01-01-2021', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT025', 'SUP006', '01-01-2021', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT026', 'SUP008', '01-01-2021', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT027', 'SUP010', '01-01-2021', 1.00);

--FEB 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT028', 'SUP001', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT029', 'SUP002', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT030', 'SUP003', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT031', 'SUP004', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT032', 'SUP005', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT033', 'SUP006', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT034', 'SUP007', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT035', 'SUP008', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT036', 'SUP009', '01-02-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT037', 'SUP010', '01-02-2020', 1.00);

--MAR 2021
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT038', 'SUP001', '01-03-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT039', 'SUP003', '01-03-2020', 1.00);
INSERT INTO PurchaseTrans (PurchaseTransID, SupplierID, Date_Paid, Total_Price) VALUES ('PT040', 'SUP010', '01-03-2020', 1.00);


-- 40 records
SELECT COUNT(*) FROM PurchaseTrans;