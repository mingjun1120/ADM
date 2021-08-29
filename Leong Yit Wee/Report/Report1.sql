-- exec prc_prodCategProfit('Dry Food')
CREATE OR REPLACE PROCEDURE prc_prodCategProfit (in_productType IN VARCHAR)IS
--Variable 
v_total_pt_profit NUMBER(7,2);
NO_PRODUCTTYPE EXCEPTION;

CURSOR PROD_CURSOR IS
SELECT productCode, "PROFIT", "Quantity Sold", "Net Profit"
FROM PROFIT_OF_PRODUCT_CATEG_VIEW
WHERE productType = in_productType;

prod_rec PROD_CURSOR%ROWTYPE;

BEGIN
	OPEN PROD_CURSOR;
	FETCH PROD_CURSOR INTO prod_rec;

	IF (PROD_CURSOR%NOTFOUND) THEN
		CLOSE PROD_CURSOR;
		RAISE NO_PRODUCTTYPE;
	ELSE
		CLOSE PROD_CURSOR;
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE('Net profit of each product based on the productType');
		
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 73, '='));
		DBMS_OUTPUT.PUT_LINE(RPAD('Product Code', 15, ' ') || LPAD('Profit', 15,
		' ') || LPAD('Quantity Sold', 20,' ') || LPAD('Net Profit', 21,' '));
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 73, '='));
		v_total_pt_profit:=0;
		
		FOR prod_rec IN PROD_CURSOR LOOP
		
			DBMS_OUTPUT.PUT_LINE(RPAD(prod_rec.productCode, 10, ' ')||
			LPAD(prod_rec."PROFIT", 20, ' ') || LPAD(prod_rec."Quantity Sold", 20, ' ') ||
			LPAD(prod_rec."Net Profit", 20, ' '));
			
			v_total_pt_profit := v_total_pt_profit + prod_rec."Net Profit";
			
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 73, '='));	
		DBMS_OUTPUT.PUT_LINE('Total net profit for ' || in_productType || ' : ' ||
		TRIM(TO_CHAR(v_total_pt_profit, '999G999G999D99')));	
		DBMS_OUTPUT.PUT_LINE(LPAD('=', 73, '='));

	END IF;
	EXCEPTION
		WHEN NO_PRODUCTTYPE THEN	
			DBMS_OUTPUT.PUT_LINE('==================================');
			DBMS_OUTPUT.PUT_LINE('NO SUCH productType');
			DBMS_OUTPUT.PUT_LINE('==================================');
	
	
END; 
/