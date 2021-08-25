-- View 1
CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_VIEW AS
SELECT P.PRODUCTCODE, S.SUPPLIERNAME, p.category,P.MSRP, P.BUYPRICE, TO_CHAR((P.MSRP -P.BUYPRICE),'99999.99') AS "PROFIT"
FROM PRODUCTS P,PURCHASED_ORDER O,PURCHASED_ORDER_DETAILS D, SUPPLIERS S
WHERE P.PRODUCTCODE=D.PRODUCTCODE AND D.PONO=O.PONO AND O.SUPPLIERNO=S.SUPPLIERNO
GROUP BY P.PRODUCTCODE, S.SUPPLIERNAME, p.category,P.MSRP,P.BUYPRICE
ORDER BY profit desc;

-- View 2
CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM product p, transactionsDetails d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

-- View 3
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
BREAK ON CustomerName SKIP 1;
COMPUTE SUM LABEL 'TOTAL' OF TOTAL_AMOUNT ON CustomerName;
SELECT a.AppointmentDate, c.CustomerID, c.customerName,s.serviceName,s.serviceCharge, s.serviceCharge AS "TOTAL_AMOUNT"
FROM customer c, transactions t, transactionsDetails d, product p, Appointment a, Services S
WHERE t.TransactionsID = 'T10003' AND c.CustomerID = t.CustomerID AND c.CustomerID = a.CustomerID 
      AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode AND a.ServiceID = s.ServiceID
      AND t.date_paid = a.AppointmentDate
GROUP BY a.AppointmentDate, c.CustomerID,c.customerName,s.serviceName,s.serviceCharge
ORDER BY t.TransactionsID DESC;

-- View 4
CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
COLUMN "CustomerID" FORMAT A10;
COLUMN "CustomerName" FORMAT A16;
COLUMN "ProductCode" FORMAT A11;
COLUMN "ProductName" FORMAT A30;
COLUMN "Quantity" FORMAT 999;
COLUMN "PriceEach" FORMAT 999.99;
COLUMN "DATE_PAID" FORMAT A15;
COLUMN "TOTAL_AMOUNT" FORMAT 99999.99;
BREAK ON CustomerID ON TransactionsID ON Date_Paid ON customerName skip 1;
COMPUTE SUM LABEL 'TOTAL' OF TOTAL_AMOUNT ON customerName;
SELECT t.transactionsID,t.date_paid,c.CustomerID, c.customerName,p.productCode,p.productName,d.quantity,d.priceEach, SUM(d.priceEach * d.quantity) AS "TOTAL_AMOUNT"
FROM customer c, transactions t, transactionsDetails d, product p
WHERE t.TransactionsID = 'T10211' AND c.CustomerID = t.CustomerID AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode
GROUP BY t.transactionsID,t.date_paid,c.CustomerID,c.customerName,p.productCode,p.productName,d.quantity,d.priceEach
ORDER BY t.transactionsID;

