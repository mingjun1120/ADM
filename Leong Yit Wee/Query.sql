-- Query 1 Check transaction based on transaction date
ACCEPT get_transDate DATE FORMAT 'DD-MM-YYYY' PROMPT "Enter
Transaction Date: ";
COLUMN "Transaction ID" FORMAT A15;
COLUMN "Customer Name" FORMAT A15;
COLUMN "Contact No" FORMAT A15;
COLUMN "Customer ID" FORMAT A15;
SELECT t.Date_Paid "Date Paid", t.TransactionsID
"Transaction ID", t.CustomerID "Customer ID",
c.CustomerName "Customer Name", c.ContactNo "Contact No"
FROM Transactions t, Customer c
WHERE t.CustomerID = c.CustomerID AND Date_Paid ='&get_transDate'
ORDER BY t.TransactionsID;

-- Query 2 Total spent of transaction
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
WHERE t.TransactionsID = '&v_transNo' AND c.CustomerID = t.CustomerID AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode
GROUP BY t.transactionsID,t.date_paid,c.CustomerID,c.customerName,p.productCode,p.productName,d.quantity,d.priceEach
ORDER BY t.transactionsID;
-- t.TransactionsID = '&v_transNo'

-- Query 3 Total Spent with service and product
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
SELECT t.transactionsID,t.date_paid "Date Paid", c.CustomerID, c.customerName,p.productCode, p.productName, d.priceEach,d.quantity,d.priceEach* d.quantity "SubTotal",s.serviceName,s.serviceCharge "SERVICE CHARGE", 1.1 * s.serviceCharge "SERVICE CHARGE AFTER SST", TDV.TOTAL_AMOUNT + (1.1*s.serviceCharge) AS "TOTAL_AMOUNT_SPENT"
FROM customer c, transactions t, transactionsDetails d, product p, Appointment a, Services S, TRANS_DAY_VIEW TDV
WHERE t.TransactionsID = '&v_transNo' AND TDV.TransactionsID = t.TransactionsID AND  c.CustomerID = t.CustomerID AND c.CustomerID = a.CustomerID AND a.AppointmentDate = t.date_paid
      AND t.TransactionsID = d.TransactionsID AND d.productCode = p.productCode AND a.ServiceID = s.ServiceID
      AND t.date_paid = a.AppointmentDate
GROUP BY t.transactionsID,t.date_paid, c.CustomerID,c.customerName,p.productCode, p.productName, d.priceEach,d.quantity,s.serviceName,s.serviceCharge,TDV.TOTAL_AMOUNT
ORDER BY t.TransactionsID DESC;

