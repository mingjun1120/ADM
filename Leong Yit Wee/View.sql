-- view 1
CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM product p, transactionsDetails d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

-- View 2
CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
SELECT t.TransactionsID,t.date_paid, SUM(d.priceEach * d.quantity) AS "TOTAL_AMOUNT"
FROM transactions t, transactionsDetails d
WHERE t.TransactionsID = d.TransactionsID
GROUP BY t.TransactionsID,t.date_paid
ORDER BY t.date_paid;

-- View 3
CREATE OR REPLACE VIEW TOTAL_CUST_SPENT_PROD_VIEW AS
SELECT c.customerID, c.customerName,c.city,c.email,c.contactNO,c.dob,SUM(d.priceEach * d.quantity) AS "TOTAL_SPENT"
FROM customer c, transactions t,transactionsDetails d
WHERE c.customerID = t.customerID AND t.transactionsID = d.transactionsID
GROUP BY c.customerID,c.customerName, c.city,c.email,c.contactNO,c.dob
ORDER BY "TOTAL_SPENT" DESC;

-- View 4
create OR REPLACE VIEW TOTAL_TOTAL_CUST_SPENT_PROD_VIEW AS
select SUM("TOTAL_SPENT") AS Total
FROM TOTAL_CUST_SPENT_PROD_VIEW 
WHERE rownum <= 10
order by "TOTAL_SPENT" DESC;
