-- exec prc_CustTotalSpentSummary('01-jan-2018','08-jan-2018');
CREATE OR REPLACE PROCEDURE prc_CustTotalSpentSummary (in_fromDate IN DATE, in_toDate IN DATE) IS

CURSOR CUST_CURSOR IS
SELECT T.customerID, T.customerName,T.city,T."TOTAL_SPENT",T."TOTAL_SPENT"/TT.Total*100 AS "Contribution"
FROM TOTAL_CUST_SPENT_PROD_VIEW T, TOTAL_TOTAL_CUST_SPENT_PROD_VIEW TT
WHERE rownum <= 10
group by T.customerID, T.customerName,T.city,T."TOTAL_SPENT",TT.Total
order by T."TOTAL_SPENT" DESC;

INVALID_DATE EXCEPTION;
CURSOR TRANS_CURSOR IS
SELECT date_paid, "TOTAL_AMOUNT", (SUM("TOTAL_AMOUNT") - LAG(SUM("TOTAL_AMOUNT"), 1) OVER 
               (ORDER BY date_paid)） * 100 / LAG(SUM("TOTAL_AMOUNT"), 1) OVER (ORDER BY date_paid) AS "Growth",
			   "TOTAL_AMOUNT"/(select SUM("TOTAL_AMOUNT")
                                 FROM TRANS_DAY_VIEW 
                                WHERE date_paid between in_fromDate AND in_toDate
                                )*100 AS "Contribution"
FROM TRANS_DAY_VIEW
WHERE date_paid between in_fromDate AND in_toDate
group by date_paid, "TOTAL_AMOUNT"
order by 1;

trans_rec TRANS_CURSOR%ROWTYPE;
cust_rec CUST_CURSOR%ROWTYPE;
v_total_acc_trans NUMBER(7,2);
v_total_acc_spent NUMBER(7,2);

BEGIN
	OPEN TRANS_CURSOR;
	FETCH TRANS_CURSOR INTO trans_rec;

	IF (TRANS_CURSOR%NOTFOUND) THEN
		CLOSE TRANS_CURSOR;
		RAISE INVALID_DATE;
	ELSE
		CLOSE TRANS_CURSOR;
		
	DBMS_OUTPUT.PUT_LINE('Top 10 customers based on total transactions spent (RM) and Transaction total made per day between two date');
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));	
	DBMS_OUTPUT.PUT_LINE('-                       Top 10 customers based on total transactions spent (RM)');
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));
	DBMS_OUTPUT.PUT_LINE(RPAD('Cust No', 10, ' ') || RPAD('Name', 20,
	' ') || RPAD('  city', 15, ' ') || RPAD('    Total Transactions Spent (RM)', 35, ' ') 
	 || RPAD('    Contribution (%)', 20, ' '));

	DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));
	
	v_total_acc_spent:=0;
	
	FOR cust_rec IN CUST_CURSOR LOOP
	
		DBMS_OUTPUT.PUT_LINE(RPAD(cust_rec.customerID, 10, ' ')||
		RPAD(cust_rec.customerName, 17, ' ')||
		'     ' ||
		RPAD(cust_rec.city, 15, ' ') ||
		'      ' ||
		LPAD(cust_rec."TOTAL_SPENT", 20, ' ')||
		'      ' ||
		LPAD(TO_CHAR(cust_rec."Contribution", '999,990.99'), 20, ' '));

		v_total_acc_spent := v_total_acc_spent + cust_rec."TOTAL_SPENT";
		
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));	
	DBMS_OUTPUT.PUT_LINE('Total Top 10 Customer Transactions Spent : RM ' ||
	TRIM(TO_CHAR(v_total_acc_spent, '999G999D99')));
	DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));

		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('-                       Transaction total made per day ' || 'from ' || in_fromDate || ' to ' || in_toDate);
		
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));
		DBMS_OUTPUT.PUT_LINE(RPAD('Date', 10, ' ') || LPAD('Transaction total', 20,
		' ') || LPAD('        Contribution (%)           ', 29,' ') || LPAD('Growth (%) ', 17,' '));
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));
		v_total_acc_trans:=0;
		
		FOR trans_rec IN TRANS_CURSOR LOOP
		
			DBMS_OUTPUT.PUT_LINE(RPAD(trans_rec.date_paid, 10, ' ')||
			LPAD(trans_rec."TOTAL_AMOUNT", 20, ' ') || LPAD(TO_CHAR(trans_rec."Contribution", '999,990.99'), 20, ' ') 
			|| LPAD(TO_CHAR(trans_rec."Growth", '999,990.99'), 24,' '));
			v_total_acc_trans := v_total_acc_trans + trans_rec."TOTAL_AMOUNT";
			
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));	
		DBMS_OUTPUT.PUT_LINE('Accumulate transaction total : ' ||
		TRIM(TO_CHAR(v_total_acc_trans, '999G999G999D99')));	
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 107, '='));
	END IF;
	EXCEPTION
		WHEN INVALID_DATE THEN	
			DBMS_OUTPUT.PUT_LINE('============================================================');
			DBMS_OUTPUT.PUT_LINE('THE VALUE(S) ENTERED INCORRECTLY OR NO SUCH DATE RECORD !!!');
			DBMS_OUTPUT.PUT_LINE('============================================================');
END; 
/