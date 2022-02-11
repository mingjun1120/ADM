---------------------------------------- View 2 ---------------------------------------------

CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF
CLEAR SCREEN

CREATE OR REPLACE VIEW Cal_Profit_View AS
SELECT ProductCode, (MSRP - BuyPrice) AS "Profit"
FROM Product 
ORDER BY ProductCode;

SELECT * FROM Cal_Profit_View;
