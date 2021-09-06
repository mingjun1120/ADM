---------------------------------------- Function 1 ---------------------------------------------

-- Convert Day To Name

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
