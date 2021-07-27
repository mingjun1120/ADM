DROP TABLE Product;
CREATE TABLE Product
(ProductCode         VARCHAR(5)   NOT NULL,
 ProductName         VARCHAR(30)  NOT NULL,
 ProductType         VARCHAR(20)  NOT NULL,
 ProductVendor       VARCHAR(20)  NOT NULL,
 ProductDescription  VARCHAR(100),
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

-- INSERT INTO Product (ProductCode, ProductName, ProductVendor, ProductDescription, QuantityInStock, ExpiredDate, BuyPrice, City, MSRP) values ('C1001', 'Milly', 'F', '013-8780611', 'milly@gmail.com', 'G-3A RESIDENSI UNGGUL KEPONG, Jalan Vista Mutiara 1', 52000, 'Kepong Baru', 'Kuala Lumpur');


-- 50 records
SELECT COUNT(*) FROM Product;