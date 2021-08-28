-- View 1
CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_VIEW AS
SELECT P.PRODUCTCODE, S.SUPPLIERNAME, P.ProductType,P.MSRP, P.BUYPRICE, TO_CHAR((P.MSRP -P.BUYPRICE),'99999.99') AS "PROFIT"
FROM PRODUCT P,PurchaseTrans O,PurchaseTransDetails D, SUPPLIER S
WHERE P.PRODUCTCODE=D.PRODUCTCODE AND D.PurchaseTransID=O.PurchaseTransID AND O.SupplierID=S.SupplierID
GROUP BY P.PRODUCTCODE, S.SUPPLIERNAME, P.ProductType,P.MSRP,P.BUYPRICE
ORDER BY profit desc;

-- View 2
CREATE OR REPLACE VIEW PROFIT_OF_PRODUCT_CATEG_VIEW AS
SELECT p.ProductCode, p.ProductType,  "PROFIT", SUM(d.quantity) AS "Quantity Sold", TO_CHAR(("PROFIT" * SUM(d.quantity)),'999999.99') AS "Net Profit"
FROM product p, transactionsDetails d, transactions t, PROFIT_OF_PRODUCT_VIEW w
WHERE p.ProductCode = d.ProductCode AND t.TransactionsID = d.TransactionsID AND d.ProductCode = w.ProductCode
GROUP BY p.ProductCode, p.ProductType, p.msrp, "PROFIT"
ORDER BY p.ProductCode;

-- View 3
CREATE OR REPLACE VIEW TOTAL_SERVICE_VIEW AS
SELECT t.TransactionsID,a.AppointmentDate, c.CustomerID, c.customerName,s.serviceName,s.serviceCharge, 1.1 * s.serviceCharge AS "TOTAL_AMOUNT AFTER SST"
FROM customer c, transactions t, transactionsDetails d, product p, Appointment a, Services S
WHERE c.CustomerID = t.CustomerID AND c.CustomerID = a.CustomerID 
      AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode AND a.ServiceID = s.ServiceID
      AND t.date_paid = a.AppointmentDate
GROUP BY t.TransactionsID,a.AppointmentDate, c.CustomerID,c.customerName,s.serviceName,s.serviceCharge
ORDER BY t.TransactionsID DESC;

-- View 4
CREATE OR REPLACE VIEW TRANS_DAY_VIEW AS
SELECT t.date_paid, SUM(d.priceEach * d.quantity) AS "TOTAL_AMOUNT"
FROM transactions t, transactionsDetails d
WHERE t.TransactionsID = d.TransactionsID
GROUP BY t.date_paid
ORDER BY t.date_paid;

-- View 5
CREATE OR REPLACE VIEW TOTAL_CUST_SPENT_PROD_VIEW AS
SELECT c.customerID, c.customerName,c.city,c.email,c.contactNO,c.dob,SUM(d.priceEach * d.quantity) AS "TOTAL_SPENT"
FROM customer c, transactions t,transactionsDetails d
WHERE c.customerID = t.customerID AND t.transactionsID = d.transactionsID
GROUP BY c.customerID,c.customerName, c.city,c.email,c.contactNO,c.dob
ORDER BY "TOTAL_SPENT" DESC;

