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

-- CREATE OR REPLACE PROCEDURE prc_RevenuePerDay (in_fromDate IN DATE, in_toDate IN DATE)IS
-- -- exec prc_RevenuePerDay ('01-jan-2018','08-jan-2018')
-- --Variable
-- v_total_acc_trans NUMBER(7,2);
-- INVALID_DATE EXCEPTION;
-- CURSOR TRANS_CURSOR IS
-- SELECT date_paid, "TOTAL_AMOUNT", (SUM("TOTAL_AMOUNT") - LAG(SUM("TOTAL_AMOUNT"), 1) OVER 
--                (ORDER BY date_paid)） * 100 / LAG(SUM("TOTAL_AMOUNT"), 1) OVER (ORDER BY date_paid) AS "Growth"
-- FROM TRANS_DAY_VIEW
-- WHERE date_paid between in_fromDate AND in_toDate
-- group by date_paid, "TOTAL_AMOUNT"
-- order by 1;

-- trans_rec TRANS_CURSOR%ROWTYPE;

-- BEGIN
-- 	OPEN TRANS_CURSOR;
-- 	FETCH TRANS_CURSOR INTO trans_rec;

-- 	IF (TRANS_CURSOR%NOTFOUND) THEN
-- 		CLOSE TRANS_CURSOR;
-- 		RAISE INVALID_DATE;
-- 	ELSE
-- 		CLOSE TRANS_CURSOR;
-- 		DBMS_OUTPUT.PUT_LINE(chr(10));
-- 		DBMS_OUTPUT.PUT_LINE('Transaction total made per day ' || 'from ' || in_fromDate || ' to ' || in_toDate);
		
-- 		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
-- 		DBMS_OUTPUT.PUT_LINE(RPAD('Date', 10, ' ') || LPAD('Transaction total', 20,
-- 		' ') || LPAD('Growth (%)', 10,' '));
-- 		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
-- 		v_total_acc_trans:=0;
		
-- 		FOR trans_rec IN TRANS_CURSOR LOOP
		
-- 			DBMS_OUTPUT.PUT_LINE(RPAD(trans_rec.date_paid, 10, ' ')||
-- 			LPAD(trans_rec."TOTAL_AMOUNT", 20, ' ') || LPAD(TO_CHAR(trans_rec."Growth", '999,990.99'), 24,' '));
			
-- 			v_total_acc_trans := v_total_acc_trans + trans_rec."TOTAL_AMOUNT";
			
-- 		END LOOP;
-- 		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));	
-- 		DBMS_OUTPUT.PUT_LINE('Accumulate transaction total : ' ||
-- 		TRIM(TO_CHAR(v_total_acc_trans, '999G999G999D99')));	
-- 		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
-- 	END IF;
-- 	EXCEPTION
-- 		WHEN INVALID_DATE THEN	
-- 			DBMS_OUTPUT.PUT_LINE('============================================================');
-- 			DBMS_OUTPUT.PUT_LINE('THE VALUE(S) ENTERED INCORRECTLY OR NO SUCH DATE RECORD !!!');
-- 			DBMS_OUTPUT.PUT_LINE('============================================================');
	
	
-- END; 
-- /