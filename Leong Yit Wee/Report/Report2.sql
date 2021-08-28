CREATE OR REPLACE PROCEDURE prc_CustTotalSpentSummary IS
-- exec prc_CustTotalSpentSummary;
CURSOR CUST_CURSOR IS
SELECT customerID, customerName,city,"TOTAL_SPENT"
FROM TOTAL_CUST_SPENT_PROD_VIEW
WHERE rownum <= 10;


v_total_acc_spent NUMBER(7,2);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Top 10 customers based on total transactions spent (RM)');
	
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
	DBMS_OUTPUT.PUT_LINE(RPAD('Cust No', 10, ' ') || RPAD('Name', 20,
	' ') || RPAD('  city', 15, ' ') || RPAD('    Total Transactions Spent (RM)', 35, ' ') );

	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
	
	v_total_acc_spent:=0;
	
	FOR cust_rec IN CUST_CURSOR LOOP
	
		DBMS_OUTPUT.PUT_LINE(RPAD(cust_rec.customerID, 10, ' ')||
		RPAD(cust_rec.customerName, 17, ' ')||
		-- LPAD(cust_rec.email, 15, ' ') ||
		-- LPAD(cust_rec.contactNO, 15, ' ') ||
		-- LPAD(cust_rec.dob, 'dd-mm-yyyy', ' ') ||
		'     ' ||
		RPAD(cust_rec.city, 15, ' ') ||
		'      ' ||
		LPAD(cust_rec."TOTAL_SPENT", 20, ' '));
		
		v_total_acc_spent := v_total_acc_spent + cust_rec."TOTAL_SPENT";
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));	
	DBMS_OUTPUT.PUT_LINE('Total Top 10 Customer Transactions Spent : RM ' ||
	TRIM(TO_CHAR(v_total_acc_spent, '999G999D99')));
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
END; 
/	