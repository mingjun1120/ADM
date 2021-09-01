---------------------------------------- Function 1 ---------------------------------------------

-- Convert Month To Name

CREATE OR REPLACE FUNCTION FUNC_CONVERT_MONTH_TO_NAME (in_monthNumber IN NUMBER)
RETURN VARCHAR2 IS 

MonthName VARCHAR2(15); 
Temp DATE;

BEGIN 
   Temp := TO_DATE(in_monthNumber, 'MM');
   MonthName := TO_CHAR(Temp, 'MONTH');
   
   RETURN MonthName; 
END;
/

---------------------------------------- Function 1 ---------------------------------------------

-- Convert Month To Name

CREATE OR REPLACE FUNCTION FUNC_CONVERT_DAY_TO_NAME (in_dayNumber IN NUMBER)
RETURN VARCHAR2 IS 

dayName VARCHAR2(15); 
Temp DATE;

BEGIN 
   Temp := TO_DATE(in_dayNumber, 'DD');
   dayName := TO_CHAR(Temp, 'DAY');
   
   RETURN dayName; 
END;
/

start D:\Text\ADM\Function.sql