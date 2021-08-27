-- Profit of Each Products (Strategy)
CREATE OR REPLACE VIEW Cal_Profit_View AS
SELECT ProductCode, (MSRP - BuyPrice) AS "Profit"
FROM Product 
ORDER BY ProductCode;

SELECT * FROM Cal_Profit_View;

SET LINESIZE 400
SET PAGESIZE 100

TTITLE COL40 '  Profit of Products Details' SKIP 1 -
COL38 '------------------------------' SKIP 2 -  

COLUMN ProductCode Heading 'Product Code' FORMAT A12
COLUMN ProductName Heading 'Product Name' FORMAT A60
COLUMN SupplierID Heading 'Supplier ID' FORMAT A11
COLUMN SupplierName Heading 'Supplier Name' FORMAT A30
COLUMN ProductType Heading 'Product Type' FORMAT A20
COLUMN Profit Heading 'Profit (RM)' FORMAT '999999.99'

BREAK ON ProductType SKIP 1

SELECT P.ProductType, P.ProductCode, P.ProductName, A."Profit"
FROM Product P, Cal_Profit_View A
WHERE P.ProductCode = A.ProductCode
GROUP BY P.ProductType, P.ProductCode, P.ProductName, A."Profit"
ORDER BY P.ProductType;

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF