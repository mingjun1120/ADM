--Procedure Low Quantity In Stock (1)
SET SERVEROUTPUT ON

SET LINESIZE 400
SET PAGESIZE 100

CREATE OR REPLACE PROCEDURE prc_low_stock(v_low_qty IN NUMBER) IS

v_indicator char(5);
v_count NUMBER(3) := 0;

CURSOR PRODUCT_CURSOR IS
SELECT P.ProductCode, P.ProductName, P.ProductType, S.SupplierID, S.SupplierName, P.QuantityInStock
FROM Product P, Supplier S, PurchaseTrans PT, PurchaseTransDetails PTD
WHERE P.ProductCode = PTD.ProductCode AND
             PTD.PurchaseTransID = PT.PurchaseTransID AND
             PT.SupplierID = S.SupplierID
GROUP BY  P.ProductCode, P.ProductName, P.ProductType, S.SupplierID, S.SupplierName, P.QuantityInStock
ORDER BY P.ProductCode;

Product_Rec PRODUCT_CURSOR%ROWTYPE;

BEGIN
DBMS_OUTPUT.PUT_LINE(RPAD('*', 60, ' ') || 'Products Running Low On Stock');
DBMS_OUTPUT.PUT_LINE(RPAD('*', 50, ' ') || '--------------------------------------------------');
DBMS_OUTPUT.PUT_LINE(chr(10));
DBMS_OUTPUT.PUT_LINE(RPAD('Product Code', 12) || ' ' || RPAD('Product Name', 60) || ' '|| RPAD('Product Type', 20) || ' ' || LPAD('Supplier ID', 11) || ' ' || RPAD('Supplier Name', 30) || ' ' || LPAD('Quantity In Stock', 20));
DBMS_OUTPUT.PUT_LINE(RPAD('------------', 12) || ' ' || RPAD('-------------------------------------------------', 60) || ' '|| RPAD('-----------------', 20) || ' ' || LPAD('---------------------', 11) || ' ' || RPAD('-------------------------', 30) || ' ' || LPAD('------------------------------------------', 20));

OPEN PRODUCT_CURSOR;

LOOP
FETCH PRODUCT_CURSOR INTO Product_Rec;

EXIT WHEN PRODUCT_CURSOR%NOTFOUND;

IF Product_Rec.QuantityInStock < v_low_qty
    THEN v_indicator := '#<---';  
              v_count := v_count + 1;
ELSE
     v_indicator := ' ';
END IF;

DBMS_OUTPUT.PUT_LINE(RPAD(Product_Rec.ProductCode, 12) || ' ' || RPAD(Product_Rec.ProductName, 60) || ' '|| RPAD(Product_Rec.ProductType, 20) || ' ' || RPAD(Product_Rec.SupplierID, 11) || ' ' || RPAD(Product_Rec.SupplierName, 30) || ' ' || LPAD(Product_Rec.QuantityInStock, 20) || v_indicator);

END LOOP;

DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Total Products Processed: ' || PRODUCT_CURSOR%ROWCOUNT);
DBMS_OUTPUT.PUT_LINE('Indicates Products Low In Quantity Less Than: ' || v_low_qty);
DBMS_OUTPUT.PUT_LINE('Count of Products Indicated: ' || v_count);
DBMS_OUTPUT.PUT_LINE('--------------------------------------------- End Of Check -----------------------------------------------------------------------------------------------');
CLOSE PRODUCT_CURSOR;
END;
/
EXEC PRC_LOW_STOCK(30);