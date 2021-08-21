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

INSERT INTO Product VALUES ('P1001', 'NutraGold Holistic Dog Breeder kg', 'Dry Food', 'Apache Factory', 132, TO_DATE('08-02-2022', 'DD-MM-YYYY'), 70.00, 160.00);
INSERT INTO Product VALUES ('P1002', 'Snappy Tom Cat Canned Food 400g', 'Canned Food', 'Apache Factory', 247, TO_DATE('08-02-2022', 'DD-MM-YYYY'), 1.00, 3.00);
INSERT INTO Product VALUES ('P1003', 'Smart Heart Canned Food 400g', 'Canned Food', 'Apache Factory', 333, TO_DATE('08-02-2022', 'DD-MM-YYYY'), 1.30, 3.50);

INSERT INTO Product VALUES ('P1004', 'Cat Treat Snack Biscuit 100g', 'Dry Food', 'Rotas Warehouse', 145, TO_DATE('22-11-2022', 'DD-MM-YYYY'), 4.00, 12.00);
INSERT INTO Product VALUES ('P1005', 'Pedigree Chicken - Beef - Lamb (Dog Food) 3kg', 'Dry Food', 'Rotas Warehouse', 106, TO_DATE('22-11-2022', 'DD-MM-YYYY'), 13.50, 30.00);

INSERT INTO Product VALUES ('P1006', 'High Vitamin Creamy Cat Treat 15g', 'Vitamin', 'Blue Buffalo Company', 132, TO_DATE('08-02-2022', 'DD-MM-YYYY'), 4.00, 10.00);
INSERT INTO Product VALUES ('P1007', 'Cat Goat Milk With Multivitamin And Prebiotics 500g', 'Vitamin', 'Blue Buffalo Company', 94, TO_DATE('31-08-2022', 'DD-MM-YYYY'), 10.00, 30.00);

INSERT INTO Product VALUES ('P1008', 'Paw Spray Lite Sanitizer Kucing Anjing 500ml', 'Disinfect', 'Colgate-Palmolive Company', 90, NULL, 40.00, 69.00);
INSERT INTO Product VALUES ('P1009', 'BR Amber Trigger Bird Sanitizer 100ml', 'Disinfect', 'Colgate-Palmolive Company', 79, NULL, 0.90, 5.00);

INSERT INTO Product VALUES ('P1010', 'Pet Chicken Jerky', 'Dry Food', 'Diamond Pet Foods', 300, TO_DATE('11-09-2022', 'DD-MM-YYYY'), 9.00, 19.00);

INSERT INTO Product VALUES ('P1011', 'Basic Pet First Aid Kit', 'Disinfect', 'Beaphar', 102, NULL, 80.00, 160.00);

INSERT INTO Product VALUES ('P1012', 'Pet Food Container', 'Appliance', 'Harrington', 78, NULL, 6.50, 24.00);
INSERT INTO Product VALUES ('P1013', 'Pet Cushion Bed', 'Appliance', 'Harrington', 143, NULL, 39.00, 70.00);
INSERT INTO Product VALUES ('P1014', 'Food Water Feeder Bowls', 'Appliance', 'Harrington', 126, NULL, 8.90, 20.00);

INSERT INTO Product VALUES ('P1015', 'Rawly Meat Pie 155g', 'Dry Food', 'Hill Pet Nutrition', 339, TO_DATE('31-10-2022', 'DD-MM-YYYY'), 21.30, 44.00);
INSERT INTO Product VALUES ('P1016', 'Rawly Fishball 155g', 'Dry Food', 'Hill Pet Nutrition', 264, TO_DATE('31-10-2022', 'DD-MM-YYYY'), 19.50, 39.00);

INSERT INTO Product VALUES ('P1017', 'Fizer Disinfection Tablet', 'Disinfect', 'The J.M. Smucker', 117, NULL, 20.00, 38.00);
INSERT INTO Product VALUES ('P1018', 'BF1 Antibacterial Pet Sanitizer Deodorizer Spray 500ml', 'Disinfect', 'The J.M. Smucker', 243, NULL, 3.00, 10.00);

INSERT INTO Product VALUES ('P1019', 'Qicco Upgrade Suction Cup Dog Toy', 'Toy', 'Ty Toyz', 88, NULL, 4.90, 13.00);
INSERT INTO Product VALUES ('P1020', 'Funny Knitting Wool Balls', 'Toy', 'Ty Toyz', 111, NULL, 1.00, 5.00);
INSERT INTO Product VALUES ('P1021', 'Handmade Molar Toys Ball', 'Toy', 'Ty Toyz', 166, NULL, 1.00, 6.00);
INSERT INTO Product VALUES ('P1022', 'Assorted Premium TPR Squeaky Dog Toy', 'Toy', 'Ty Toyz', 97, NULL, 5.90, 16.00);
INSERT INTO Product VALUES ('P1023', 'Cat Sucker Track Ball', 'Toy', 'Ty Toyz', 111, NULL, 9.00, 20.00);

INSERT INTO Product VALUES ('P1024', 'True Iconic Volume Maxi Bath (Shampoo) 400ml', 'Grooming', 'Pawfect Collection', 231, NULL, 48.00, 58.00);
INSERT INTO Product VALUES ('P1025', 'True Iconic Volume Maxi Bath (Conditioner) 400ml', 'Grooming', 'Pawfect Collection', 235, NULL, 48.00, 58.00);
INSERT INTO Product VALUES ('P1026', 'True Iconic Meow Care Plus (Conditioner) 400ml', 'Grooming', 'Pawfect Collection', 222, NULL, 48.00, 58.00);
INSERT INTO Product VALUES ('P1027', 'True Iconic Meow Volume Up (Cat Bath) 400ml', 'Grooming', 'Pawfect Collection', 225, NULL, 48.00, 58.00);

INSERT INTO Product VALUES ('P1028', 'Puppia Base Ball Tank Top', 'Fashion', 'Pet Lovers Centre', 74, NULL, 35.00, 55.60);
INSERT INTO Product VALUES ('P1029', 'Petsinn Dot Dress With Bowknot', 'Fashion', 'Pet Lovers Centre', 68, NULL, 28.00, 38.00);
INSERT INTO Product VALUES ('P1030', 'Trustie Personalize Cat Collar', 'Fashion', 'Pet Lovers Centre', 76, NULL, 5.80, 11.90);

INSERT INTO Product VALUES ('P1031', 'Dogit Voyageur 300', 'Appliance', 'Sin Yew Lai', 49, NULL, 68.90, 86.00);
INSERT INTO Product VALUES ('P1032', 'Meow Kitchen Cat Litter Tray With Cover and Scoop', 'Appliance', 'Sin Yew Lai', 55, NULL, 10.90, 22.90);
INSERT INTO Product VALUES ('P1033', 'DOGIT Training Pad', 'Training Pad', 'Sin Yew Lai', 83, NULL, 51.00, 75.00);

INSERT INTO Product VALUES ('P1034', 'Bentonie Cat Litter 10L', 'Cat Litter', 'MDL', 124, NULL, 8.00, 13.00);
INSERT INTO Product VALUES ('P1035', 'Happi Cat Litter 30L', 'Cat Litter', 'MDL', 37, NULL, 12.90, 38.00);

INSERT INTO Product VALUES ('P1036', 'Dr Pets Natural Nanonized Silver 50ml', 'Grooming', 'Dr.Pets', 158, NULL, 21.90, 28.20);
INSERT INTO Product VALUES ('P1037', 'Dr Pets Anti Bacterial Pet Perfume Paris Hilton 50ml', 'Grooming', 'Dr.Pets', 155, NULL, 21.90, 23.00);
INSERT INTO Product VALUES ('P1038', 'Dr Pets Anti-Germ Conditioning Pet Shampoo 300ml', 'Grooming', 'Dr.Pets', 118, NULL, 17.80, 21.80);
INSERT INTO Product VALUES ('P1039', 'Dr Pets Natural Germs Buster Perfumed Pet Shampoo 2L', 'Grooming', 'Dr.Pets', 117, NULL, 24.90, 29.00);

INSERT INTO Product VALUES ('P1040', 'Andis Firm Slicker Brush', 'Grooming', 'Petmarket', 64, NULL, 48.00, 51.60);
INSERT INTO Product VALUES ('P1041', 'Andis Pin Brush', 'Grooming', 'Petsmart', 74, NULL, 46.00, 58.20);
INSERT INTO Product VALUES ('P1042', 'Andis Nail Clipper', 'Grooming', 'Petmarket', 8, NULL, 55.00, 58.30);
INSERT INTO Product VALUES ('P1043', 'Kelco Zap Ear 118ml', 'Grooming', 'Petmarket', 224, NULL, 26.20, 31.90);

INSERT INTO Product VALUES ('P1044', 'Renox Pet Eye Drops 10ml', 'Grooming', 'Petsmart Group', 277, NULL, 7.00, 14.00);
INSERT INTO Product VALUES ('P1045', 'Pet Astronaut Capsule Transparent', 'Appliance', 'Petsmart Group', 29, NULL, 36.00, 55.00);
INSERT INTO Product VALUES ('P1046', 'FM Spot On Flea Tick Earmite Terminator 4ml', 'Grooming', 'Petsmart Group', 266, NULL, 19.00, 25.00);

INSERT INTO Product VALUES ('P1047', 'Kelco Zap Ear 1Gallon', 'Grooming', 'Petmarket', 10, NULL, 265.00, 285.00);

INSERT INTO Product VALUES ('P1048', 'True Iconic Volume Maxi Bath (Shampoo) 4.54L', 'Grooming', 'Pawfect Collection', 8, NULL, 268.00, 290.00);
INSERT INTO Product VALUES ('P1049', 'True Iconic Volume Maxi Bath (Conditioner) 4.54L', 'Grooming', 'Pawfect Collection', 8, NULL, 268.00, 290.00);
INSERT INTO Product VALUES ('P1050', 'True Iconic Meow Care Plus (Conditioner) 4.54L', 'Grooming', 'Pawfect Collection', 12, NULL, 288.00, 300.00);
INSERT INTO Product VALUES ('P1051', 'True Iconic Meow Volume Up (Cat Bath) 4.54L', 'Grooming', 'Pawfect Collection', 12, NULL, 288.00, 300.00);

-- 51 records
SELECT COUNT(*) FROM Product;