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
CONSTRAINT chk_prod_code CHECK (SUBSTR(ProductCode, 1, 2) = 'PR'),
CONSTRAINT CHK_Quantity CHECK (quantityInStock > 0),
CONSTRAINT CHK_buyPrice CHECK (buyPrice > 0),
CONSTRAINT CHK_MSRP CHECK (MSRP > 0)
);

-- 50 records
SELECT COUNT(*) FROM Product;