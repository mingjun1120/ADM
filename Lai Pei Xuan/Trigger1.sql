-- Validate MSRP
CREATE OR REPLACE TRIGGER TRG_VALIDATE_MSRP
  AFTER UPDATE OF MSRP
  ON PRODUCT
  FOR EACH ROW

DECLARE
v_buy_price NUMBER(7,2);
v_msrp NUMBER(7,2);

BEGIN
v_buy_price := :new.BuyPrice;
v_msrp := :new.MSRP;

IF (v_msrp < v_buy_price) THEN
    RAISE_APPLICATION_ERROR(-20010,'MSRP Should Not Higher Than Buy Price');
END IF;

DBMS_OUTPUT.PUT_LINE ('Product Code ' || :old.productcode || '  initial of MSRP RM ' || :old.msrp || ' is adjusted to RM ' || :new.MSRP);

EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE ('Product Does Not Exist');

END;
/

UPDATE PRODUCT
SET MSRP = 1.00
WHERE ProductCode = 'P1004';