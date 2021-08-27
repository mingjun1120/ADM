-- Trigger 1
CREATE OR REPLACE TRIGGER trg_ValidateReturnQty
AFTER UPDATE OF quantity ON transactionsDetails
FOR EACH ROW

DECLARE
v_returnQuantity number(5);
v_quantity number(5);

BEGIN
	v_quantity := :old.quantity;
	v_returnQuantity := :new.quantity;
	
	IF(v_returnQuantity>=0) THEN
		DBMS_OUTPUT.PUT_LINE('The quantity of ' || :old.productCode || ' from ' || v_quantity 
			|| ' has been updated to ' || v_returnQuantity || ' ' 
			|| 'in ' || 'transaction(' || :old.transactionsID || ')' );
	
	ELSE
		RAISE_APPLICATION_ERROR(-20000, 'The return quantity should not more than the quantity bought.');
	END IF;
END;
/ 

-- Trigger 2
create or replace trigger trg_upd_prodqty_sold
after insert on transactionsDetails
for each row

declare
v_qtyInStock_after number(5);
v_qtyInStock_before number(5);

begin
 select quantityinstock into v_qtyInStock_before
  from products
  where productcode=:new.productcode;

 update products
 set quantityinstock=quantityinstock-:new.quantity  
 where productcode=:new.productcode;

 select quantityinstock into v_qtyInStock_after
 from products
  where productcode=:new.productcode; 

 DBMS_OUTPUT.PUT_LINE(chr(10));
 DBMS_OUTPUT.PUT_LINE(RPAD('Product Code',15) || RPAD('Quantity In Stock',20));
 DBMS_OUTPUT.PUT_LINE(RPAD('------------',15) || RPAD('-----------------',20));
 DBMS_OUTPUT.PUT_LINE(RPAD(:new.productCode,15) || LPAD(v_qtyInStock_after,15));
 DBMS_OUTPUT.PUT_LINE(chr(10));
  DBMS_OUTPUT.PUT_LINE('Quantity in stock before update: ' || ' ' ||v_qtyInStock_before);
 DBMS_OUTPUT.PUT_LINE('Quantity of product is updated to the latest version.');
end;
/