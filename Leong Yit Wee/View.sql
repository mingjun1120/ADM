CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_VIEW AS
SELECT P.PRODUCTCODE, S.SUPPLIERNAME, p.productType, P.MSRP, P.BUYPRICE, TO_CHAR((P.MSRP - P.BUYPRICE),'99999.99') AS "PROFIT"
FROM PRODUCT P,PurchaseTrans O, PurchaseTransDetails D, SUPPLIER S
WHERE  p.ProductCode = D.ProductCode AND D.PurchaseTransID = O.PurchaseTransID AND O.SUPPLIERID = S.SUPPLIERID
GROUP BY P.PRODUCTCODE, S.SUPPLIERNAME, p.productType, P.MSRP, P.BUYPRICE
ORDER BY profit desc;

---------------------------------------- View 1 ---------------------------------------------

CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM product p, transactionsDetails d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

---------------------------------------- View 2 ---------------------------------------------

CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
SELECT t.TransactionsID,t.date_paid, SUM(d.priceEach * d.quantity) AS "TOTAL_AMOUNT"
FROM transactions t, transactionsDetails d
WHERE t.TransactionsID = d.TransactionsID
GROUP BY t.TransactionsID,t.date_paid
ORDER BY t.date_paid;

---------------------------------------- View 3 ---------------------------------------------

CREATE OR REPLACE VIEW TOTAL_CUST_SPENT_PROD_VIEW AS
SELECT c.customerID, c.customerName,c.city,c.email,c.contactNO,c.dob,SUM(d.priceEach * d.quantity) AS "TOTAL_SPENT"
FROM customer c, transactions t,transactionsDetails d
WHERE c.customerID = t.customerID AND t.transactionsID = d.transactionsID
GROUP BY c.customerID,c.customerName, c.city,c.email,c.contactNO,c.dob
ORDER BY "TOTAL_SPENT" DESC;

---------------------------------------- View 4 ---------------------------------------------

CREATE OR REPLACE VIEW TOTAL_TOTAL_CUST_SPENT_PROD_VIEW AS
SELECT SUM("TOTAL_SPENT") AS Total
FROM TOTAL_CUST_SPENT_PROD_VIEW 
WHERE ROWNUM <= 10
ORDER BY "TOTAL_SPENT" DESC;
