CREATE OR REPLACE PROCEDURE prc_claim_voucher
	(in_transactionNumber IN NUMBER) is

 --Variables	
  NO_RECORD EXCEPTION;

CURSOR TRANS_CURSOR IS
       SELECT t.customerNumber, c.customerName, t.transactionNumber, t.date_paid
       FROM transactions t, customers c
       WHERE t.transactionNumber = in_transactionNumber AND c.customerNumber = t.customerNumber;
	
CURSOR transDetail_cursor IS
       SELECT d.productCode, d.quantity, p.msrp
       from transaction_details d, products p
       where transactioNnumber = in_transactionNumber AND d.productCode = p.productCode;

 ordertotal number(11,2);  
 divTotal number(11,2);
 voucher  number(3):=0;

 trans_rec TRANS_CURSOR%ROWTYPE;
 transDetail transDetail_cursor%ROWTYPE;
      
BEGIN
	OPEN TRANS_CURSOR;
	FETCH TRANS_CURSOR INTO trans_rec;

		
	
		IF(trans_cursor%NOTFOUND) THEN
			CLOSE TRANS_CURSOR;
			RAISE NO_RECORD;
	
		ELSE	
			ordertotal:=0;

			FOR transDetail_rec in transDetail_cursor 
				 LOOP
			ordertotal := ordertotal + transDetail_rec.quantity*transDetail_rec.msrp;
			END LOOP;
			
			divTotal := ordertotal;
			
			LOOP
				IF (divTotal>=50) THEN
					divTotal:=divTotal-50;
					voucher:=voucher+1;
				ELSE
					EXIT;
					END IF;
			END LOOP;
					
				
			dbms_output.put_line(chr(10));

			IF (voucher = 0) THEN

				DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
				DBMS_OUTPUT.PUT_LINE('	                  Voucher Failed to Redeem');
				DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
				DBMS_OUTPUT.PUT_LINE('Customer No   : ' || LPAD(trans_rec.customerNumber,15) || RPAD(' ',16, ' ') || 'Transaction Date : ' || trans_rec.date_paid);
				DBMS_OUTPUT.PUT_LINE('Customer Name : ' || LPAD(trans_rec.customerName,15));	
				dbms_output.put_line(chr(10));
				DBMS_OUTPUT.PUT_LINE('Total amount of this transaction is '||TRIM(TO_CHAR(ordertotal,'999G999G999D99')));
				DBMS_OUTPUT.PUT_LINE('You are not eligble to redeem the voucher due to insufficient transaction amount made.');
			ELSE
				DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
				DBMS_OUTPUT.PUT_LINE('	                  Voucher Redeemed Successfully');
				DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
				DBMS_OUTPUT.PUT_LINE('Customer No   : ' || LPAD(trans_rec.customerNumber,15) || RPAD(' ',16, ' ') || 'Transaction Date : ' || trans_rec.date_paid);
				DBMS_OUTPUT.PUT_LINE('Customer Name : ' || LPAD(trans_rec.customerName,15));	
				dbms_output.put_line(chr(10));
				DBMS_OUTPUT.PUT_LINE('Total amount of this transaction(' || in_transactionNumber || ') is '||TRIM(TO_CHAR(ordertotal,'999G999G999D99')));
				DBMS_OUTPUT.PUT_LINE('Congratulations, ' || voucher || ' ' || 'voucher(s) earned');
			END IF;
				dbms_output.put_line(chr(10));
			CLOSE TRANS_CURSOR;
		END IF;

		
	EXCEPTION
		WHEN NO_RECORD THEN	
			DBMS_OUTPUT.PUT_LINE('==========================');
			DBMS_OUTPUT.PUT_LINE('NO SUCH TRANSACTION RECORD');
			DBMS_OUTPUT.PUT_LINE('==========================');
     
 
END;
/
