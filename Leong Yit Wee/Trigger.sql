-- Trigger 1 check qtyinstock when update stock after transaction
-- exec prc_update_transaction('T10016', 'P1047', 6)
CREATE OR REPLACE TRIGGER trg_ValidateReturnQty
AFTER UPDATE OF quantityinstock ON product
FOR EACH ROW

DECLARE
v_returnQuantity number(5);
v_quantity number(5);

BEGIN
    
	v_quantity := :old.quantityinstock;
	v_returnQuantity := :new.quantityinstock;
	
	IF(v_returnQuantity>=0) THEN
		DBMS_OUTPUT.PUT_LINE('The quantity of ' || :old.productCode || ' from ' || v_quantity 
			|| ' has been updated to ' || v_returnQuantity || ' ' );
	
	ELSE
		RAISE_APPLICATION_ERROR(-20200, 'The return quantity should not more than the quantity bought.');
	END IF;
END;
/ 

-- CREATE OR REPLACE TRIGGER trg_deleteProductQty
-- AFTER delete ON transactions
-- FOR EACH ROW

-- DECLARE
-- v_quantity number(5);

-- BEGIN  
-- 	v_quantity := :old.quantityinstock;
	
-- 	IF(v_Quantity > 0) THEN
-- 		DBMS_OUTPUT.PUT_LINE('The quantity of ' || :old.productCode || ' is still have  ' || v_quantity 
-- 			|| ' . Please make sure quantity is zero before delete !!! ' || ' ' || ' ' );
	
-- 	ELSE
-- 		DBMS_OUTPUT.PUT_LINE('This Product is deleted successfully!!!');
-- 	END IF;
-- END;
-- / 
-- Trigger 2
create or replace trigger trg_update_vldqty
AFTER update OF quantity on transactionsDetails
for each row

DECLARE
v_Quantity123 number(5);

begin
	v_Quantity123 := :new.quantity;
    IF(v_Quantity123>=0) then 
        DBMS_OUTPUT.PUT_LINE('The Transaction Details is Updated Successfully!!!');
    else 
		RAISE_APPLICATION_ERROR(-20201, 'Invalid quantity input. The quantity not be negative or more than 999 !!!'); 
    end if;
end;
/
--INSERT INTO TransactionsDetails VALUES ('T10211', 'P1014', 4, 13.00);
--INSERT INTO TransactionsDetails VALUES ('T10211', 'P1034', 2, 13.00);
--UPDATE transactionsDetails  set quantity = -99 where productCode = 'P1001';
--select * from transactionsDetails where productcode = 'P1001';