---------------------------------------- Report 1 ---------------------------------------------

-- Detail Report of Service Performance
-- Purpose: The purpose of this report is to illustrate which service has highest performance  
-- and earns the most money as well as the total number of appointments made since the founding 
-- of the business. In addition, the objective of the service performance report is to identify 
-- which services are worth investing un and which ones considered whether to keep this service

SET LINESIZE 120
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH:MI A.M.';

CREATE OR REPLACE PROCEDURE PRC_SERVICE_PERFORMANCE_REPORT IS
   CURSOR SER_CURSOR IS
      SELECT *
      FROM   Services;

   CURSOR APP_CURSOR (v_serviceID VARCHAR) IS
      SELECT A.AppointmentID, A.AppointmentDate, A.StartTime, A.ServiceID,
            C.CustomerID, C.CustomerName, P.PetID, P.PetName
      FROM   Appointment A, Customer C, Pet P
      WHERE  ServiceID = v_serviceID AND A.CustomerID = C.CustomerID AND A.PetID = P.PetID
      ORDER BY 2, 3;
         
   v_rec                 NUMBER(7)   := 0;
   GrossProfit           NUMBER(7,2) := 0;
   GrossProfitPercentage NUMBER(7,2) := 0.50;
   TotalCharges          NUMBER(7,2) := 0;
   TotalServiceCharges   NUMBER(7,2) := 0;
   SST                   NUMBER(7,2) := 0.10;
   SSTCharges            NUMBER(7,2) := 0;
BEGIN
   FOR v_counter IN 1 .. 5 LOOP
      DBMS_OUTPUT.PUT_LINE(CHR(10));
   END LOOP;

   DBMS_OUTPUT.PUT_LINE('Service Performance Report');
   DBMS_OUTPUT.PUT_LINE('From 01-JAN-2018 to 30-Jun-2018');

   FOR services_rec IN SER_CURSOR LOOP
      v_rec := 0;
      TotalCharges := 0;
      TotalServiceCharges := 0;
      GrossProfit := 0;

      DBMS_OUTPUT.PUT_LINE(CHR(10));
      DBMS_OUTPUT.PUT_LINE('Service Name: ' || services_rec.ServiceName);
      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
      DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Date', 16,' ')  || '| ' || RPAD('Time', 15,' ') || ' | ' || 
                           RPAD('Appointment', 17,' ') || '| ' || RPAD('Customer', 28,' ')  || ' | ' ||
                           RPAD('Pet', 20,' ')  || ' | ');
      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));

      FOR appointment_rec IN APP_CURSOR(services_rec.ServiceID)  LOOP
         DBMS_OUTPUT.PUT_LINE('| ' || RPAD(appointment_rec.AppointmentDate, 15,' ')  || ' | '  || 
                              RPAD(appointment_rec.StartTime, 15,' ') || ' | ' || 
                              RPAD(appointment_rec.AppointmentID, 16,' ') || ' | ' ||
                              RPAD(appointment_rec.CustomerID, 7,' ') ||
                              RPAD(appointment_rec.CustomerName, 21,' ') || ' | ' || 
                              RPAD(appointment_rec.PetID, 9,' ')  || 
                              RPAD(appointment_rec.PetName, 11,' ') || ' |');
         v_rec := v_rec + 1;
      END LOOP;

      SSTCharges := services_rec.ServiceCharge * SST;
      TotalCharges := services_rec.ServiceCharge + SSTCharges;
      TotalServiceCharges := TotalCharges * v_rec;

      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
      DBMS_OUTPUT.PUT_LINE(CHR(10));

      DBMS_OUTPUT.PUT_LINE('.' || LPAD(v_rec || ' appointments made for ' || services_rec.ServiceName ||
                           ' service', 108, ' ') || '.');
      DBMS_OUTPUT.PUT_LINE(CHR(10));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Service Charge: ' || TO_CHAR(services_rec.ServiceCharge, '9999999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('SST (10%): ' || TO_CHAR(SSTCharges, '9999999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ')  || '-----------------------------------');
      DBMS_OUTPUT.PUT_LINE('.' || LPAD(TO_CHAR(TotalCharges, '9999999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('No. Appointment: ' || TO_CHAR(v_rec, '9999999999'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ')  || '-----------------------------------');            
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Total: RM' || TO_CHAR(TotalServiceCharges, '99999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Profit (' || GrossProfitPercentage * 100 || '%): ' || TO_CHAR(TotalServiceCharges * GrossProfitPercentage, '9999999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ')  || '-----------------------------------');   
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Gross Profit: RM' || TO_CHAR(TotalServiceCharges * GrossProfitPercentage, '99999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ')  || '===================================');   
   END LOOP;
END;
/

SET SERVEROUTPUT ON
EXEC PRC_SERVICE_PERFORMANCE_REPORT;

---------------------------------------- Report 2 ---------------------------------------------

-- Summary Report of Top 10 Customers With The Highest Appointments
-- Purpose: The purpose of this report is to highlight the top 10 customers who have made the 
-- most appointments. This is useful in terms of summary report for managers to understand 
-- what the potential customer is.



SET LINESIZE 120
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH:MI A.M.';

CREATE OR REPLACE PROCEDURE PRC_HIGHEST_APPOINTMEN_CUSTOMERS IS
   CURSOR APP_CURSOR IS
      SELECT   A.CustomerID, C.CustomerName, COUNT(A.AppointmentID) AS Total_Appointment
      FROM     Appointment A, Customer C, Services S
      WHERE    A.CustomerID = C.CustomerID
      GROUP BY A.CustomerID, C.CustomerName
      ORDER BY 3 DESC
      FETCH FIRST 10 ROWS ONLY;

BEGIN

END;
/
---------------------------------------- Report 3 ---------------------------------------------

-- On Demand Report of
-- Purpose: The purpose of this report is to 


