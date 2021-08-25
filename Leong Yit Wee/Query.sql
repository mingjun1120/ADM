-- Query 1 
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

-- Query 2 
ACCEPT get_transNo CHAR FORMAT 'A15' PROMPT "Transaction Number: ";
COLUMN "Price each" FORMAT '9999.99';
SELECT t.transactionNumber "Transaction No", t.productCode "Product No", p.msrp "Price each", t.quantity "Quantity", 
TO_CHAR(SUM (p.msrp * t.quantity),'9999.99') AS "Amount"
FROM transaction_details t, products p
WHERE t.productCode = p.productCode AND t.transactionNumber = '&get_transNo'
GROUP BY t.transactionNumber,t.productCode, p.msrp, t.quantity
ORDER BY t.productCode;

SELECT t.transactionNumber as "Transaction No", TO_CHAR(SUM (p.msrp * t.quantity),'9999.99') AS "Subtotal"
FROM transaction_details t, products p
WHERE t.productCode = p.productCode AND t.transactionNumber = '&get_transNo'
GROUP BY t.transactionNumber;

-- Query 3
COLUMN "Customer Name" FORMAT A15
SELECT c.customerNumber "Customer No", c.customerName "Customer Name", TO_CHAR(SUM(p.msrp *d.quantity),'999999.99') AS "TOTAL_SPENT", MAX(t.date_paid) "LAST_PAID_DATE"
FROM customers c, transactions t, transaction_details d, products p
WHERE c.customerNumber = t.customerNumber AND t.transactionNumber = d.transactionNumber AND d.productCode = p.productCode 
GROUP BY c.customerNumber,c.customerName
ORDER BY "TOTAL_SPENT" DESC;
