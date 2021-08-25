CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM product p, transactionsDetails d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

CREATE OR REPLACE VIEW TOTAL_SPENT_VIEW AS
COLUMN "CustomerID" FORMAT A10;
COLUMN "CustomerName" FORMAT A16;
COLUMN "ProductCode" FORMAT A11;
COLUMN "ProductName" FORMAT A30;
COLUMN "Quantity" FORMAT 999;
COLUMN "PriceEach" FORMAT 999.99;
COLUMN "serviceName" FORMAT A15;
COLUMN "DATE_PAID" FORMAT A15;
COLUMN "TOTAL_AMOUNT" FORMAT 99999.99;
BREAK ON CustomerID SKIP 1;
COMPUTE SUM LABEL 'TOTAL' OF TOTAL_AMOUNT ON CustomerID;
SELECT a.AppointmentDate, c.CustomerID, c.customerName,p.productCode,p.productName,d.quantity,d.priceEach, s.serviceName,s.serviceCharge, (d.priceEach * d.quantity) + s.serviceCharge AS "TOTAL_AMOUNT"
FROM customer c, transactions t, transactionsDetails d, product p, Appointment a, Services S
WHERE c.CustomerID = 'C1002' AND a.AppointmentDate = '02-01-2018' AND t.date_paid = '02-01-2018' AND c.CustomerID = t.CustomerID AND c.CustomerID = a.CustomerID AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode AND a.ServiceID = s.ServiceID
GROUP BY a.AppointmentDate, c.CustomerID,c.customerName,p.productCode,p.productName,d.quantity,d.priceEach, s.serviceName,s.serviceCharge
ORDER BY "TOTAL_AMOUNT" DESC;

CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
COLUMN "CustomerID" FORMAT A10;
COLUMN "CustomerName" FORMAT A16;
COLUMN "ProductCode" FORMAT A11;
COLUMN "ProductName" FORMAT A30;
COLUMN "Quantity" FORMAT 999;
COLUMN "PriceEach" FORMAT 999.99;
COLUMN "serviceName" FORMAT A15;
COLUMN "DATE_PAID" FORMAT A15;
COLUMN "TOTAL_AMOUNT" FORMAT 99999.99;
BREAK ON CustomerID SKIP 1;
COMPUTE SUM LABEL 'TOTAL' OF TOTAL_AMOUNT ON CustomerID;
SELECT c.CustomerID, c.customerName,p.productCode,p.productName,d.quantity,d.priceEach, SUM(d.priceEach * d.quantity) AS "TOTAL_AMOUNT"
FROM customer c, transactions t, transactionsDetails d, product p
-- c.CustomerID = 'C1002' AND t.date_paid = '02-01-2018' AND
WHERE c.CustomerID = t.CustomerID AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode
GROUP BY c.CustomerID,c.customerName,p.productCode,p.productName,d.quantity,d.priceEach
ORDER BY "TOTAL_AMOUNT" DESC;