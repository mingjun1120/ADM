---------------------------------------- Trigger 1 ---------------------------------------------

CREATE OR REPLACE TRIGGER TRG_INSERT_TRANS
  BEFORE INSERT
  ON PURCHASETRANSDETAILS
  FOR EACH ROW

DECLARE
v_supplierid VARCHAR2(6);
v_supplier_name VARCHAR2(50);
v_purchasetransid VARCHAR2(5);

BEGIN

SELECT ProductVendor INTO v_supplier_name
FROM Product
WHERE ProductCode = :new.ProductCode;

SELECT SupplierID INTO v_supplierid
FROM Supplier
WHERE SupplierName = v_supplier_name;

INSERT INTO PurchaseTrans VALUES (:new.PurchaseTransID, v_supplierid, SYSDATE - NUMTOYMINTERVAL(3, 'year'));

DBMS_OUTPUT.PUT_LINE ('Purchase Transaction ID: ' || :new.PurchaseTransID);
DBMS_OUTPUT.PUT_LINE ('Supplier ID: ' || v_supplierid);

END;
/