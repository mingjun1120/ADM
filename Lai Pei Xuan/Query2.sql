-- Purchase Transaction Details(Tactical)
CREATE OR REPLACE VIEW Cal_Total_Amt_View AS
SELECT PT.PurchaseTransID, PT.Date_Paid, SUM(PTD.Quantity * P.BuyPrice) AS "Total Amount"
FROM Product P, Supplier S, PurchaseTrans PT, PurchaseTransDetails PTD
WHERE P.ProductCode = PTD.ProductCode AND
      PTD.PurchaseTransID = PT.PurchaseTransID AND
      PT.SupplierID = S.SupplierID
GROUP BY PT.PurchaseTransID, PT.Date_Paid
ORDER BY PT.PurchaseTransID;

SELECT COUNT(*) FROM Cal_Total_Amt_View;

SET LINESIZE 400
SET PAGESIZE 100
 
TTITLE COL40 ' Purchase Transaction Details' SKIP 1 -
COL38 '-------------------------------' SKIP 2 -

COLUMN Month Heading 'Month' FORMAT A12
COLUMN Year Heading 'Year' FORMAT A6
COLUMN PurchaseTransID Heading 'Purchase No' FORMAT A12
COLUMN Date_Paid Heading 'Date Paid' FORMAT A10
COLUMN SupplierID Heading 'Supplier ID' FORMAT A11
COLUMN SupplierName Heading 'Supplier Name' FORMAT A30
COLUMN 'Total Amount' Heading 'Purchase Amount (RM)' FORMAT '999999.99'
 
BREAK ON Year ON Month SKIP 1-

SELECT TO_CHAR(EXTRACT(YEAR FROM PT.Date_Paid)) "Year", TO_CHAR(TO_DATE(EXTRACT(MONTH FROM PT.Date_Paid), 'MM'), 'MONTH') "Month", PT.Date_Paid, PT.PurchaseTransID,  S.SupplierID, S.SupplierName, A."Total Amount"
FROM Product P, Supplier S, PurchaseTrans PT, Cal_Total_Amt_View A
WHERE PT.PurchaseTransID = A.PurchaseTransID AND
      PT.SupplierID = S.SupplierID
GROUP BY TO_CHAR(EXTRACT(YEAR FROM PT.Date_Paid)), TO_CHAR(TO_DATE(EXTRACT(MONTH FROM PT.Date_Paid), 'MM'), 'MONTH'), PT.Date_Paid, PT.PurchaseTransID, S.SupplierID, S.SupplierName, A."Total Amount"
ORDER BY PT.Date_Paid;

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF