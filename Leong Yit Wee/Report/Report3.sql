CREATE OR REPLACE PROCEDURE prc_RevenuePerDay (in_fromDate IN DATE, in_toDate IN DATE)IS

--Variable
v_total_acc_trans NUMBER(7,2);
INVALID_DATE EXCEPTION;
CURSOR TRANS_CURSOR IS
SELECT date_paid, "TOTAL_AMOUNT"
FROM TRANS_DAY_VIEW
WHERE date_paid between in_fromDate AND in_toDate;

trans_rec TRANS_CURSOR%ROWTYPE;

BEGIN
	OPEN TRANS_CURSOR;
	FETCH TRANS_CURSOR INTO trans_rec;

	IF (TRANS_CURSOR%NOTFOUND) THEN
		CLOSE TRANS_CURSOR;
		RAISE INVALID_DATE;
	ELSE
		CLOSE TRANS_CURSOR;
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Transaction total made per day ' || 'from ' || in_fromDate || ' to ' || in_toDate);
		
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
		DBMS_OUTPUT.PUT_LINE(RPAD('Date', 10, ' ') || LPAD('Transaction total', 20,
		' '));
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
		v_total_acc_trans:=0;
		
		FOR trans_rec IN TRANS_CURSOR LOOP
		
			DBMS_OUTPUT.PUT_LINE(RPAD(trans_rec.date_paid, 10, ' ')||
			LPAD(trans_rec."TOTAL_AMOUNT", 20, ' '));
			
			v_total_acc_trans := v_total_acc_trans + trans_rec."TOTAL_AMOUNT";
			
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));	
		DBMS_OUTPUT.PUT_LINE('Accumulate transaction total : ' ||
		TRIM(TO_CHAR(v_total_acc_trans, '999G999G999D99')));	
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 59, '='));
	END IF;
	EXCEPTION
		WHEN INVALID_DATE THEN	
			DBMS_OUTPUT.PUT_LINE('==================================');
			DBMS_OUTPUT.PUT_LINE('THE VALUE(S) ENTERED INCORRECTLY');
			DBMS_OUTPUT.PUT_LINE('==================================');
	
	
END; 
/