-- Product Discount Voucher Redeemed by Customer

-- exec prc_claim_product_voucher('T10001') exec prc_claim_product_voucher('T10034')

CREATE OR REPLACE PROCEDURE prc_claim_product_voucher
	(in_transactionsID IN VARCHAR) is
--Variables	
  NO_RECORD EXCEPTION;

CURSOR TRANS_CURSOR IS
       SELECT t.customerID, c.customerName, t.transactionsID, t.date_paid
       FROM transactions t, customer c
       WHERE t.transactionsID = in_transactionsID AND c.customerID = t.customerID;
	
CURSOR transDetail_cursor IS
       SELECT d.productCode, d.quantity, d.priceEach
       from transactionsDetails d
       where transactionsID = in_transactionsID;

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
			ordertotal := ordertotal + transDetail_rec.quantity*transDetail_rec.priceEach;
			END LOOP;
			
			divTotal := ordertotal;
			
			LOOP
				IF (divTotal>=100) THEN
					divTotal:=divTotal-100;
					voucher:=voucher+1;
				ELSE
					EXIT;
					END IF;
			END LOOP;
					
				
			dbms_output.put_line(chr(10));

			IF (voucher = 0) THEN

				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE(RPAD('|	                  Product Discount Voucher Failed to Redeem',61,' ') || RPAD('                          |',33));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE('Customer No   : ' || LPAD(trans_rec.customerID,15) || RPAD(' ',16, ' ') || 'Transaction Date : ' || trans_rec.date_paid);
				DBMS_OUTPUT.PUT_LINE('Customer Name : ' || LPAD(trans_rec.customerName,15));	
				dbms_output.put_line(chr(10));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE('|Total amount of this transaction is '||TRIM(TO_CHAR(ordertotal,'999G999G999D99'))||RPAD('                                             |',47));
				DBMS_OUTPUT.PUT_LINE('|You are not eligible to redeem the voucher due to insufficient transaction amount made'||RPAD('|',33));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
			ELSE
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE(RPAD('|	                  Product Discount Voucher Successfully Redeem',65,' ') || RPAD('                      |',50));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE('Customer No   : ' || LPAD(trans_rec.customerID,15) || RPAD(' ',16, ' ') || 'Transaction Date : ' || trans_rec.date_paid);
				DBMS_OUTPUT.PUT_LINE('Customer Name : ' || LPAD(trans_rec.customerName,15));	
				dbms_output.put_line(chr(10));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
				DBMS_OUTPUT.PUT_LINE('|Total amount of this transaction(' || in_transactionsID || ') is '||TRIM(TO_CHAR(ordertotal,'999G999G999D99')) || RPAD('                                  |',40));
				DBMS_OUTPUT.PUT_LINE('|Congratulations, ' || voucher || ' ' || 'voucher(s) earned' || RPAD('                                                 |',50));
				DBMS_OUTPUT.PUT_LINE('========================================================================================');
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
