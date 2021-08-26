-- List Products Quantity In Stock(Operational)
SET LINESIZE 400
SET PAGESIZE 100

TTITLE COL50 ' Product Quantity In Stock Details' SKIP 1 -
COL48 '--------------------------------------' SKIP 2 -  

COLUMN ProductCode Heading 'Product Code' FORMAT A12
COLUMN ProductName Heading 'Product Name' FORMAT A60
COLUMN SupplierID Heading 'Supplier ID' FORMAT A11
COLUMN SupplierName Heading 'Supplier Name' FORMAT A30
COLUMN ProductType Heading 'Product Type' FORMAT A20
COLUMN QuantityInStock Heading 'Quantity In Stock' FORMAT '9999'

BREAK ON ProductType SKIP 1

SELECT P.ProductType, P.ProductCode, P.ProductName, S.SupplierID, S.SupplierName,  P.QuantityInStock
FROM Product P, Supplier S, PurchaseTrans PT, PurchaseTransDetails D
WHERE P.ProductCode = D.ProductCode AND
      D.PurchaseTransID = PT.PurchaseTransID AND
      PT.SupplierID = S.SupplierID
GROUP BY P.ProductType, P.ProductCode, P.ProductName, S.SupplierID, S.SupplierName,  P.QuantityInStock
ORDER BY P.ProductType;

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF