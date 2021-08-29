-- exec prc_update_transaction('T10001','P1002',1)
create or replace procedure prc_update_transaction (in_transactionsID IN VARCHAR, in_productCode IN VARCHAR, in_quantity in NUMBER) is
	
	--Variables
 	v_newQty NUMBER(3);	
	NO_RECORD EXCEPTION;
	-- EXCEED_DAYS EXCEPTION;
	invalid_qty_exception EXCEPTION;
	PRAGMA EXCEPTION_INIT(invalid_qty_exception, -20201);	
	exceed_qty_exception EXCEPTION;
	PRAGMA EXCEPTION_INIT(exceed_qty_exception, -20200);
	
	CURSOR PROD_CURSOR IS
	SELECT * FROM transactionsDetails   
	WHERE transactionsID = in_transactionsID AND
	productCode = in_productCode;
	
	CURSOR QUANTITY_CURSOR IS
	SELECT * FROM product   
	WHERE productCode = in_productCode;

	CURSOR TRANS_CURSOR IS
	SELECT * FROM transactions   
	WHERE transactionsID = in_transactionsID;
	

	prod_rec PROD_CURSOR%ROWTYPE;
	quantity_rec QUANTITY_CURSOR%ROWTYPE; 
	trans_rec TRANS_CURSOR%ROWTYPE;
	
	 
BEGIN
	OPEN PROD_CURSOR;
	FETCH PROD_CURSOR INTO prod_rec;

	OPEN QUANTITY_CURSOR;
	FETCH QUANTITY_CURSOR INTO quantity_rec;

	OPEN TRANS_CURSOR;
	FETCH TRANS_CURSOR INTO trans_rec;
	
	IF(PROD_CURSOR%NOTFOUND) THEN
		CLOSE PROD_CURSOR;
		CLOSE QUANTITY_CURSOR;
		CLOSE TRANS_CURSOR;
		RAISE NO_RECORD;
	
	ELSE
		-- IF((add_months( trunc(sysdate), -12*3 ) - trans_rec.date_paid)>7) THEN
		-- 	CLOSE PROD_CURSOR;
		-- 	CLOSE TRANS_CURSOR;
		-- 	RAISE EXCEED_DAYS;
		-- ELSE
		-- exec prc_update_transaction('T10016', 'P1047', 2)	
		-- select * from product where productCode = 'P1047';
			v_newQty := quantity_rec.QuantityInStock - in_quantity; 
			UPDATE product  
			SET quantityinstock = v_newQty
			WHERE productCode = in_productCode;
			
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			DBMS_OUTPUT.PUT_LINE('	          Transaction Records Updated Successfully');
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			DBMS_OUTPUT.PUT_LINE(RPAD('Transaction No',20) || ':' || ''|| RPAD(trans_rec.transactionsID,10)||LPAD('UPDATED ON',30)|| ' ' || RPAD(SYSDATE,30));
			DBMS_OUTPUT.PUT_LINE(chr(10));
			DBMS_OUTPUT.PUT_LINE(RPAD('Product Code',20) || ':' || ''|| RPAD(prod_rec.productCode,10));
			DBMS_OUTPUT.PUT_LINE(RPAD('Quantity',20) || ':' || ''|| RPAD(v_newQty,7));
			DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
			
			CLOSE PROD_CURSOR;
			CLOSE QUANTITY_CURSOR;
			CLOSE TRANS_CURSOR;
		-- END IF;
		
	END IF;
	
	EXCEPTION
		WHEN NO_RECORD THEN	
			DBMS_OUTPUT.PUT_LINE('==============');
			DBMS_OUTPUT.PUT_LINE('NO SUCH RECORD');
			DBMS_OUTPUT.PUT_LINE('==============');
		-- WHEN EXCEED_DAYS THEN	
		-- 	DBMS_OUTPUT.PUT_LINE('====================');
		-- 	DBMS_OUTPUT.PUT_LINE('IT ALR EXCEED 7 DAYS');
		-- 	DBMS_OUTPUT.PUT_LINE('====================');
		WHEN exceed_qty_exception THEN	
			DBMS_OUTPUT.PUT_LINE('================================================================================');
			DBMS_OUTPUT.PUT_LINE('Invalid return quantity input. The return quantity should not more than the bought quantity!');
			DBMS_OUTPUT.PUT_LINE('================================================================================');
		WHEN invalid_qty_exception THEN	
			DBMS_OUTPUT.PUT_LINE('================================================================================');
			DBMS_OUTPUT.PUT_LINE('Invalid quantity input. The quantity not be negative or more than 999!');
			DBMS_OUTPUT.PUT_LINE('================================================================================');
END;
/
			
			
			
	
		
				
				
			
			
				
				
				
				
				
				
				
				
				
				