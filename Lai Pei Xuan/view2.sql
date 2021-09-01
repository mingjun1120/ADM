-- View 2

CREATE OR REPLACE VIEW Cal_Profit_View AS
SELECT ProductCode, (MSRP - BuyPrice) AS "Profit"
FROM Product 
ORDER BY ProductCode;

SELECT * FROM Cal_Profit_View;
