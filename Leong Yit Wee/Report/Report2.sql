CREATE OR REPLACE PROCEDURE prc_CustTotalSpentSummary IS

CURSOR CUST_CURSOR IS
SELECT customerNumber, customerName, date_of_birth, "TOTAL_SPENT"
FROM TOTAL_SPENT_VIEW
WHERE rownum <= 10;


v_total_acc_spent NUMBER(6,2);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Top 10 customers based on total spent');
	
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
	DBMS_OUTPUT.PUT_LINE(RPAD('Cust No', 10, ' ') || RPAD('Name', 15,
	' ') || LPAD('DOB', 15, ' ') || LPAD('Total Spent', 23, ' '));

	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
	
	v_total_acc_spent:=0;
	
	FOR cust_rec IN CUST_CURSOR LOOP
	
		DBMS_OUTPUT.PUT_LINE(RPAD(cust_rec.customerNumber, 10, ' ')||
		RPAD(cust_rec.customerName, 17, ' ')||

		LPAD(cust_rec.date_of_birth, 15, ' ') ||

		LPAD(cust_rec."TOTAL_SPENT", 20, ' '));
		
		v_total_acc_spent := v_total_acc_spent + cust_rec."TOTAL_SPENT";
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));	
	DBMS_OUTPUT.PUT_LINE('Total Spent : ' ||
	TRIM(TO_CHAR(v_total_acc_spent, '999G999G999D99')));
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 78, '='));
END; 
/
		
		
		
		
		
		
		
		
		
		
		