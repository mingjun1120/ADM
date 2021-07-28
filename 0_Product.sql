DROP TABLE Product;
CREATE TABLE Product
(ProductCode         VARCHAR(5)   NOT NULL,
 ProductName         VARCHAR(100) NOT NULL,
 ProductType         VARCHAR(20)  NOT NULL,
 ProductVendor       VARCHAR(20)  NOT NULL,
 QuantityInStock     NUMBER(7)    NOT NULL,
 ExpiredDate         DATE,
 BuyPrice            NUMBER(7,2)  NOT NULL,
 MSRP                NUMBER(7,2)  NOT NULL,
PRIMARY KEY(ProductCode),
CONSTRAINT chk_prod_code CHECK (SUBSTR(ProductCode, 1, 1) = 'P'),
CONSTRAINT CHK_Quantity CHECK (quantityInStock > 0),
CONSTRAINT CHK_buyPrice CHECK (buyPrice > 0),
CONSTRAINT CHK_MSRP CHECK (MSRP > 0)
);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0001', 'NutraGold Holistic Dog Breeder 20kg', 'Dry Food', 'Apache Factory', 132, '08-02-2023', 160.00, 70.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0002', 'Snappy Tom Cat Canned Food 400g', 'Canned Food', 'Apache Factory', 247, '08-02-2023', 3.20, 1.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0003', 'Smart Heart Canned Food 400g', 'Canned Food', 'Apache Factory', 201, '08-02-2023', 3.50, 1.30);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0004', 'Cat Treat Snack Biscuit 100g', 'Dry Food', 'Rotas Warehouse', 53, '22-11-2022', 12.00, 4.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0005', 'Pedigree Chicken - Beef - Lamb (Dog Food) 3kg', 'Dry Food', 'Rotas Warehouse', 88, '31-01-2023', 30.00, 13.50);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0006', 'High Vitamin Creamy Cat Treat 15g', 'Vitamin', 'Blue Buffalo Company', 132, '08-02-2023', 10.00, 4.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0007', 'Cat Goat Milk With Multivitamin & Prebiotics 200g', 'Vitamin', 'Blue Buffalo Company', 60, '31-08-2022', 30.00, 10.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0008', 'Paw Spray Lite Sanitizer Kucing Anjing 500ml', 'Disinfect', 'Colgate-Palmolive Company', 90, NULL, 69.00, 40.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0009', 'BR Amber Trigger Bird Sanitizer 100ml', 'Disinfect', 'Colgate-Palmolive Company', 69, NULL, 5.00, 0.90);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0010', 'Pet Chicken Jerky', 'Dry Food', 'Diamond Pet Foods', 300, '11-09-2022', 19.00, 9.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0011', 'Basic Pet First Aid Kit', 'Disinfect', 'Beaphar', 26, NULL, 160.00, 80.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0012', 'Pet Food Container', 'Appliance', 'Harrington', 20, NULL, 24.00, 6.50);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0013', 'Pet Cushion Bed', 'Appliance', 'Harrington', 143, NULL, 70.00, 39.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0014', 'Food Water Feeder Bowls', 'Appliance', 'Harrington', 126, NULL, 20.00, 8.90);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0015', 'Rawly Meat Pie 155g', 'Dry Food', 'Hill Pet Nutrition', 31, '31-10-2022', 44.00, 21.30);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0016', 'Rawly Fishball 155g', 'Dry Food', 'Hill Pet Nutrition', 72, '31-10-2022', 39.00, 19.50);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0017', 'Fizer Disinfection Tablet', 'Disinfect', 'The J.M. Smucker', 100, NULL, 38.00, 20.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0018', 'BF1 Antibacterial Pet Sanitizer Deodorizer Spray 500ml', 'Disinfect', 'The J.M. Smucker', 100, NULL, 10.00, 3.00);

INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0019', 'Qicco Upgrade Suction Cup Dog Toy', 'Toy', 'Ty Toyz', 31, NULL, 13.00, 4.90);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0020', 'Funny Knitting Wool Balls', 'Toy', 'Ty Toyz', 23, NULL, 5.00, 1.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0021', 'Handmade Molar Toys Ball', 'Toy', 'Ty Toyz', 19, NULL, 6.00, 1.00);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0022', 'Assorted Premium TPR Squeaky Dog Toy', 'Toy', 'Ty Toyz', 50, NULL, 16.00, 5.90);
INSERT INTO Product (ProductCode, ProductName, ProductType, ProductVendor, QuantityInStock, ExpiredDate, BuyPrice, MSRP) values ('P0023', 'Cat Sucker Track Ball', 'Toy', 'Ty Toyz', 111, NULL, 20.00, 9.00);



-- 23 records
SELECT COUNT(*) FROM Product;