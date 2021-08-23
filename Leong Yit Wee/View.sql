CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM products p, transactionDetials d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

CREATE OR REPLACE VIEW TOTAL_SPENT_VIEW AS
SELECT c.CustomerID, c.customerName, c.date_of_birth,TO_CHAR(SUM((d.priceEach *d.quantity)+ ),'99999.99') AS "TOTAL_SPENT"
FROM customers c, transactions t, transactionDetials d, products p, 
WHERE c.CustomerID = t.CustomerID AND t.TransactionsID = d.TransactionsID AND d.ProductCode = p.ProductCode 
GROUP BY c.CustomerID,c.customerName, c.date_of_birth
ORDER BY "TOTAL_SPENT" DESC;

CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
SELECT  t.date_paid, TO_CHAR(SUM (p.msrp * d.quantity),'99999.99') AS "Revenue per Day"
FROM transactions t, transactionDetials d, products p
WHERE t.TransactionsID = d.TransactionsID AND d.ProductCode = p.ProductCode
GROUP BY  t.date_paid
ORDER BY  t.date_paid;