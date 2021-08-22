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
