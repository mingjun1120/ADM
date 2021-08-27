-- Add Purchase Transaction 
SET SERVEROUTPUT ON

SET LINESIZE 400
SET PAGESIZE 100

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';

CREATE OR REPLACE PROCEDURE prc_purchase_product(v_purchasetrans_id IN VARCHAR2, v_product_code IN VARCHAR2, v_qty IN NUMBER) IS

PurchaseTransId_Duplicate EXCEPTION;
Invalid_ProductCode EXCEPTION;
Invalid_Qty EXCEPTION;

v_productcode PRODUCT.ProductCode%TYPE;
v_product_name PRODUCT.ProductName%TYPE;
v_buy_price PRODUCT.BuyPrice%TYPE;
v_quantity PRODUCT.QuantityInStock%TYPE;
v_supplierid SUPPLIER.SupplierID%TYPE;
v_supplier_name SUPPLIER.SupplierName%TYPE;
v_purchasetransid PURCHASETRANS.PurchaseTransID%TYPE;
v_total NUMBER(12,2) := 0.0;

CURSOR PRODUCT_CURSOR IS
SELECT P.ProductCode, P.ProductName, P.BuyPrice, S.SupplierID, S.SupplierName, P.QuantityInStock
FROM Product P, Supplier S, PurchaseTrans PT, PurchaseTransDetails PTD
WHERE P.ProductCode = PTD.ProductCode AND
             PTD.PurchaseTransID = PT.PurchaseTransID AND
             PT.SupplierID = S.SupplierID AND
             P.ProductCode = v_product_code;

PurchaseTrans_Rec PRODUCT_CURSOR%ROWTYPE;

BEGIN

OPEN PRODUCT_CURSOR;

FETCH PRODUCT_CURSOR INTO v_productcode, v_product_name, v_buy_price, v_supplierid, v_supplier_name, v_quantity;

SELECT COUNT(PurchaseTransID) INTO v_purchasetransid
FROM PurchaseTrans
WHERE PurchaseTransID = v_purchasetrans_id;

IF v_purchasetransid = 1
    THEN RAISE PurchaseTransId_Duplicate;
ELSE
     IF (PRODUCT_CURSOR%NOTFOUND)
          THEN RAISE Invalid_ProductCode;
     ELSE 
            IF v_qty < 1 
               THEN RAISE Invalid_Qty;
            ELSE 
                INSERT INTO PurchaseTrans VALUES (v_purchasetrans_id, v_supplierid, SYSDATE);
                INSERT INTO PurchaseTransDetails VALUES (v_purchasetrans_id, v_product_code, v_qty);
                UPDATE PRODUCT
                SET QuantityInStock = v_quantity + v_qty
                WHERE ProductCode = v_product_code;
                v_total := v_total + (v_buy_price * v_qty);
             END IF;
       END IF; 

DBMS_OUTPUT.PUT_LINE(chr(10));
DBMS_OUTPUT.PUT_LINE('New Purchase Transaction Details');
DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE(chr(10));
DBMS_OUTPUT.PUT_LINE(RPAD('Purchase Transaction ID', 20) || ' ' || RPAD('Product Code', 12) || ' ' || RPAD('Product Name', 60) || ' ' || RPAD('Supplier ID', 11) || ' ' || RPAD('Quantity', 8) || ' ' || RPAD('Buy Price (RM)', 15));
DBMS_OUTPUT.PUT_LINE(RPAD('----------------------------', 20) || ' ' || RPAD('------------------------', 12) || ' '|| RPAD('----------------------------------------------------------------', 60) || ' ' || LPAD('---------------------', 11) || ' ' || RPAD('-----------------', 8) || ' ' || LPAD('-------------------------', 15));

DBMS_OUTPUT.PUT_LINE(RPAD(v_purchasetrans_id, 20,' ') || ' ' || RPAD(v_product_code, 12,' ') || ' ' || RPAD(v_product_name, 60,' ') || ' ' || RPAD(v_supplierid, 11, ' ') || LPAD(v_qty, 8, ' ') || ' ' || LPAD(v_buy_price, 8, ' '));

END IF;

DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Total Price Purchase: ' || TRIM(TO_CHAR(v_total,'9999999999.99')));
CLOSE PRODUCT_CURSOR;
-- CLOSE PURCHASETRANS_CURSOR;

EXCEPTION
    WHEN PurchaseTransId_Duplicate THEN 
               DBMS_OUTPUT.PUT_LINE('Purchase Transaction ID duplicate error raise');
               DBMS_OUTPUT.PUT_LINE('Purchase Transaction ID had been in the existed in the past record');
     WHEN Invalid_ProductCode THEN
               DBMS_OUTPUT.PUT_LINE('Invalid Product Code error raise');
               DBMS_OUTPUT.PUT_LINE('Product Code entered does not existed in the product table');
     WHEN Invalid_Qty THEN 
               DBMS_OUTPUT.PUT_LINE('Invalid Quantity error raise');
               DBMS_OUTPUT.PUT_LINE('Quantity entered cannot less than 1');


END;
/

EXEC prc_purchase_product('PT077', 'P1002', 2);

EXEC prc_purchase_product('PT076', 'P1001', 2);
EXEC prc_purchase_product('PT078', 'P1091', 2);
EXEC prc_purchase_product('PT078', 'P1001', 0);