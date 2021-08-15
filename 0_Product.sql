DROP TABLE Product;
CREATE TABLE Product
(ProductCode         VARCHAR2(5)   NOT NULL,
 ProductName         VARCHAR2(100) NOT NULL,
 ProductType         VARCHAR2(50)  NOT NULL,
 ProductVendor       VARCHAR2(50)  NOT NULL,
 QuantityInStock     NUMBER(7)    NOT NULL,
 ExpireDDate         DATE,
 BuyPrice            NUMBER(7,2)  NOT NULL,
 MSRP                NUMBER(7,2)  NOT NULL,
PRIMARY KEY(ProductCode),
CONSTRAINT chk_prod_code CHECK (SUBSTR(ProductCode, 1, 1) = 'P'),
CONSTRAINT CHK_Quantity CHECK (quantityInStock > 0),
CONSTRAINT CHK_buyPrice CHECK (buyPrice > 0),
CONSTRAINT CHK_MSRP CHECK (MSRP > 0)
);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0001', 'NutraGold Holistic Dog Breeder kg', 'Dry Food', 'Apache Factory', 132, TO_DATE('08-02-2023', 'DD-MM-YYYY'), 70.00, 160.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0002', 'Snappy Tom Cat Canned Food 400g', 'Canned Food', 'Apache Factory', 247, TO_DATE('08-02-2023', 'DD-MM-YYYY'), 1.00, 3.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0003', 'Smart Heart Canned Food 400g', 'Canned Food', 'Apache Factory', 1, TO_DATE('08-02-2023', 'DD-MM-YYYY'), 1.30, 3.50);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0004', 'Cat Treat Snack Biscuit 100g', 'Dry Food', 'Rotas Warehouse', 53, TO_DATE('22-11-2022', 'DD-MM-YYYY'), 4.00, 12.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0005', 'Pedigree Chicken - Beef - Lamb (Dog Food) 3kg', 'Dry Food', 'Rotas Warehouse', 88, TO_DATE('22-11-2022', 'DD-MM-YYYY'), 13.50, 30.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0006', 'High Vitamin Creamy Cat Treat 15g', 'Vitamin', 'Blue Buffalo Company', 132, TO_DATE('08-02-2023', 'DD-MM-YYYY'), 4.00, 10.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0007', 'Cat Goat Milk With Multivitamin And Prebiotics 500g', 'Vitamin', 'Blue Buffalo Company', 60, TO_DATE('31-08-2022', 'DD-MM-YYYY'), 10.00, 30.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0008', 'Paw Spray Lite Sanitizer Kucing Anjing 500ml', 'Disinfect', 'Colgate-Palmolive Company', 90, NULL, 40.00, 69.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0009', 'BR Amber Trigger Bird Sanitizer 100ml', 'Disinfect', 'Colgate-Palmolive Company', 69, NULL, 0.90, 5.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0010', 'Pet Chicken Jerky', 'Dry Food', 'Diamond Pet Foods', 300, TO_DATE('11-09-2022', 'DD-MM-YYYY'), 9.00, 19.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0011', 'Basic Pet First Aid Kit', 'Disinfect', 'Beaphar', 26, NULL, 80.00, 160.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0012', 'Pet Food Container', 'Appliance', 'Harrington', 78, NULL, 6.50, 24.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0013', 'Pet Cushion Bed', 'Appliance', 'Harrington', 143, NULL, 39.00, 70.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0014', 'Food Water Feeder Bowls', 'Appliance', 'Harrington', 126, NULL, 8.90, 20.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0015', 'Rawly Meat Pie 155g', 'Dry Food', 'Hill Pet Nutrition', 31, TO_DATE('31-10-2022', 'DD-MM-YYYY'), 21.30, 44.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0016', 'Rawly Fishball 155g', 'Dry Food', 'Hill Pet Nutrition', 72, TO_DATE('31-10-2022', 'DD-MM-YYYY'), 19.50, 39.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0017', 'Fizer Disinfection Tablet', 'Disinfect', 'The J.M. Smucker', 100, NULL, 20.00, 38.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0018', 'BF1 Antibacterial Pet Sanitizer Deodorizer Spray 500ml', 'Disinfect', 'The J.M. Smucker', 100, NULL, 3.00, 10.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0019', 'Qicco Upgrade Suction Cup Dog Toy', 'Toy', 'Ty Toyz', 31, NULL, 4.90, 13.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0020', 'Funny Knitting Wool Balls', 'Toy', 'Ty Toyz', 23, NULL, 1.00, 5.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0021', 'Handmade Molar Toys Ball', 'Toy', 'Ty Toyz', 19, NULL, 1.00, 6.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0022', 'Assorted Premium TPR Squeaky Dog Toy', 'Toy', 'Ty Toyz', 50, NULL, 5.90, 16.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpireDDate, BuyPrice, MSRP) VALUES ('P0023', 'Cat Sucker Track Ball', 'Toy', 'Ty Toyz', 111, NULL, 9.00, 20.00);



-- 23 records
SELECT COUNT(*) FROM Product;