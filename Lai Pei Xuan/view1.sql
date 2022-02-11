---------------------------------------- View 1 ---------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

CREATE OR REPLACE VIEW Cal_Total_Amt_View AS
SELECT PT.PurchaseTransID, PT.Date_Paid, SUM(PTD.Quantity * P.BuyPrice) AS "Total Amount"
FROM Product P, Supplier S, PurchaseTrans PT, PurchaseTransDetails PTD
WHERE P.ProductCode = PTD.ProductCode AND
      PTD.PurchaseTransID = PT.PurchaseTransID AND
      PT.SupplierID = S.SupplierID
GROUP BY PT.PurchaseTransID, PT.Date_Paid
ORDER BY PT.PurchaseTransID;

SELECT * FROM Cal_Total_Amt_View;