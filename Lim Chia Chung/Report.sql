---------------------------------------- Report 1 ---------------------------------------------

-- Detail Report of Service Performance
-- Purpose: The purpose of this report is to illustrate which service has highest performance  
-- and earns the most money as well as the total number of appointments made since the founding 
-- of the business. In addition, the objective of the service performance report is to identify 
-- which services are worth investing un and which ones considered whether to keep this service

SET LINESIZE 1200
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

CREATE OR REPLACE PROCEDURE PRC_SERVICE_PERFORMANCE_REPORT IS
   CURSOR SER_CURSOR IS
      SELECT *
      FROM   Services;

    CURSOR APP_CURSOR (v_serviceName VARCHAR) IS
       SELECT *
       FROM   Appointment
       WHERE  ServiceName = v_serviceName 

    
BEGIN
   DBMS_OUTPUT.PUT_LINE('Service Performance Report');
   DBMS_OUTPUT.PUT_LINE('From 01-JAN-2018 to 30-Jun-2018');

   FOR service_rec IN SER_CURSOR LOOP
   
   END LOOP;
END;
/

SET SERVEROUTPUT ON
EXEC PRC_SERVICE_PERFORMANCE_REPORT;

---------------------------------------- Report 2 ---------------------------------------------

-- Summary Report of
-- Purpose: The purpose of this report is to 

---------------------------------------- Report 3 ---------------------------------------------

-- On Demand Report of
-- Purpose: The purpose of this report is to 
