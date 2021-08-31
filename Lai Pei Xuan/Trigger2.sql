CREATE OR REPLACE TRIGGER TRG_UPDATE_QTYINSTOCK
  AFTER INSERT
  ON PURCHASETRANSDETAILS
  FOR EACH ROW

DECLARE
v_qty_in_stock NUMBER(5);
v_old_qty_in_stock NUMBER(5);

BEGIN

SELECT QuantityInStock INTO v_old_qty_in_stock
FROM Product
WHERE ProductCode = :new.ProductCode;

UPDATE Product
SET QuantityInStock = QuantityInStock + :new.Quantity
WHERE ProductCode = :new.ProductCode;

SELECT QuantityInStock INTO v_qty_in_stock
FROM Product
WHERE ProductCode = :new.ProductCode;

DBMS_OUTPUT.PUT_LINE(chr(10));
DBMS_OUTPUT.PUT_LINE('Previous quantity in stock: ' || v_old_qty_in_stock);
DBMS_OUTPUT.PUT_LINE('Quantity of ' || ' ' || :new.productcode|| ' ' ||  'is updated to: ' || v_qty_in_stock);

END;
/
