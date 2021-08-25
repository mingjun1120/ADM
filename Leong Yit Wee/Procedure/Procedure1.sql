create or replace procedure prc_update_transaction
		(in_transactionNumber IN NUMBER, in_productCode IN VARCHAR, in_quantity in NUMBER) is
	
	--Variables
 	v_newQty NUMBER(3);	
	NO_RECORD EXCEPTION;
	EXCEED_DAYS EXCEPTION;
	exceed_qty_exception EXCEPTION;
	PRAGMA EXCEPTION_INIT(exceed_qty_exception, -20000);
	
	CURSOR PROD_CURSOR IS
	SELECT * FROM transaction_details   
	WHERE transactionNumber = in_transactionNumber AND
	productCode = in_productCode;
	
	CURSOR TRANS_CURSOR IS
	SELECT * FROM transactions   
	WHERE transactionNumber = in_transactionNumber;
	

	prod_rec PROD_CURSOR%ROWTYPE;
	trans_rec TRANS_CURSOR%ROWTYPE;
	
	 
BEGIN
	OPEN PROD_CURSOR;
	FETCH PROD_CURSOR INTO prod_rec;
	
	OPEN TRANS_CURSOR;
	FETCH TRANS_CURSOR INTO trans_rec;
	
	IF(PROD_CURSOR%NOTFOUND) THEN
		CLOSE PROD_CURSOR;
		CLOSE TRANS_CURSOR;
		RAISE NO_RECORD;
	
	ELSE
		IF((SYSDATE - trans_rec.date_paid)>7) THEN
			CLOSE PROD_CURSOR;
			CLOSE TRANS_CURSOR;
			RAISE EXCEED_DAYS;
		ELSE	
			v_newQty := prod_rec.quantity - in_quantity; 
			UPDATE transaction_details  
			SET quantity = v_newQty
			WHERE transactionNumber = in_transactionNumber AND
			productCode = in_productCode;
			
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			DBMS_OUTPUT.PUT_LINE('	          Transaction Records Updated Successfully');
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			DBMS_OUTPUT.PUT_LINE(RPAD('Transaction No',20) || ':' || ''|| RPAD(trans_rec.transactionNumber,10)||LPAD('UPDATED ON',30)|| ' ' || RPAD(SYSDATE,30));
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE(RPAD('Product Code',20) || ':' || ''|| RPAD(prod_rec.productCode,10));
			DBMS_OUTPUT.PUT_LINE(RPAD('Quantity',20) || ':' || ''|| LPAD(v_newQty,7));
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			
			CLOSE PROD_CURSOR;
			CLOSE TRANS_CURSOR;
		END IF;
		
	END IF;
	
	EXCEPTION
		WHEN NO_RECORD THEN	
			DBMS_OUTPUT.PUT_LINE('==============');
			DBMS_OUTPUT.PUT_LINE('NO SUCH RECORD');
			DBMS_OUTPUT.PUT_LINE('==============');
		WHEN EXCEED_DAYS THEN	
			DBMS_OUTPUT.PUT_LINE('====================');
			DBMS_OUTPUT.PUT_LINE('IT ALR EXCEED 7 DAYS');
			DBMS_OUTPUT.PUT_LINE('====================');
		WHEN exceed_qty_exception THEN	
			DBMS_OUTPUT.PUT_LINE('================================================================================');
			DBMS_OUTPUT.PUT_LINE('Invalid return quantity input. The return quantity should not more than the bought quantity!');
			DBMS_OUTPUT.PUT_LINE('================================================================================');
END;
/
			
			
			
	
		
				
				
			
			
				
				
				
				
				
				
				
				
				
				