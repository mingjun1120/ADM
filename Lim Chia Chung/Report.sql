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

ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
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
   GrossProfitPercentage NUMBER(7,2) := 0.60;
   TotalCharges          NUMBER(7,2) := 0;
   TotalServiceCharges   NUMBER(7,2) := 0;
   SST                   NUMBER(7,2) := 0.10;
   SSTCharges            NUMBER(7,2) := 0;
BEGIN
   FOR v_counter IN 1 .. 5 LOOP
      DBMS_OUTPUT.PUT_LINE(CHR(10));
   END LOOP;

   DBMS_OUTPUT.PUT_LINE(RPAD('*', 40, ' ') || RPAD('-', 30, '-'));
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 40, ' ') || '| Service Performance Report |');
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 40, ' ') || RPAD('-', 30, '-'));

   DBMS_OUTPUT.PUT_LINE('From 01-JAN-2018 to 30-Jun-2018');
   
   FOR services_rec IN SER_CURSOR LOOP
      v_rec := 0;
      TotalCharges := 0;
      TotalServiceCharges := 0;
      GrossProfit := 0;

      DBMS_OUTPUT.PUT_LINE(CHR(10));
      DBMS_OUTPUT.PUT_LINE('Service Name: ' || services_rec.ServiceName);
      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
      DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Date', 16,' ') || '| ' || RPAD('Time', 15,' ') || ' | ' || 
                           RPAD('Appointment', 17,' ') || '| ' || RPAD('Customer', 28,' ') || ' | ' ||
                           RPAD('Pet', 20,' ') || ' | ');
      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));

      FOR appointment_rec IN APP_CURSOR(services_rec.ServiceID)  LOOP
         DBMS_OUTPUT.PUT_LINE('| ' || RPAD(appointment_rec.AppointmentDate, 15,' ') || ' | ' || 
                              RPAD(appointment_rec.StartTime, 15,' ') || ' | ' || 
                              RPAD(appointment_rec.AppointmentID, 16,' ') || ' | ' ||
                              RPAD(appointment_rec.CustomerID, 7,' ') ||
                              RPAD(appointment_rec.CustomerName, 21,' ') || ' | ' || 
                              RPAD(appointment_rec.PetID, 9,' ') || 
                              RPAD(appointment_rec.PetName, 11,' ') || ' |');
         v_rec := v_rec + 1;
      END LOOP;

      SSTCharges := services_rec.ServiceCharge * SST;
      TotalCharges := services_rec.ServiceCharge + SSTCharges;
      TotalServiceCharges := TotalCharges * v_rec;
      GrossProfit := TotalServiceCharges * GrossProfitPercentage;

      DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD(v_rec || ' appointments made for ' || services_rec.ServiceName || ' service', 108, ' ') || '.');
      DBMS_OUTPUT.PUT_LINE(CHR(10));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Service Charge: ' || TO_CHAR(services_rec.ServiceCharge, '999,999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('SST (10%): ' || TO_CHAR(SSTCharges, '999,999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ') || '-----------------------------------');
      DBMS_OUTPUT.PUT_LINE('.' || LPAD(TO_CHAR(TotalCharges, '999,999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('No. Appointment: ' || TO_CHAR(v_rec, '999,999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ') || '-----------------------------------');            
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Total: RM' || TO_CHAR(TotalServiceCharges, '99,999.99'), 109, ' ')); 
      DBMS_OUTPUT.PUT_LINE('.' || LPAD('Gross Profit (60%): RM' || TO_CHAR(GrossProfit, '99,999.99'), 109, ' '));
      DBMS_OUTPUT.PUT_LINE (RPAD('*', 75, ' ') || '===================================');   
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

ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH:MI A.M.';

CREATE OR REPLACE PROCEDURE PRC_HIGHEST_APPOINTMENT_CUSTOMERS IS
   CURSOR APP_CURSOR IS
      SELECT   A.CustomerID, C.CustomerName, COUNT(A.AppointmentID) AS Total_Appointment, 
               MIN(A.AppointmentDate) AS First_Order, MAX(A.AppointmentDate) AS Last_Order,
               (SUM(S.ServiceCharge) * 1.10) AS Total_Spent
      FROM     Appointment A, Customer C, Services S
      WHERE    A.CustomerID = C.CustomerID AND A.SERVICEID = S.SERVICEID
      GROUP BY A.CustomerID, C.CustomerName
      ORDER BY 3 DESC
      FETCH FIRST 10 ROWS ONLY;
   
   v_TotalAppointment NUMBER(7) := 0;
   v_TotalSpent       NUMBER(7) := 0;
BEGIN
   FOR v_counter IN 1 .. 5 LOOP
      DBMS_OUTPUT.PUT_LINE(CHR(10));
   END LOOP;

   DBMS_OUTPUT.PUT_LINE(RPAD('*', 30, ' ') || RPAD('-', 50, '-'));
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 30, ' ') || '| Top 10 Customers With The Highest Appointments |');
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 30, ' ') || RPAD('-', 50, '-'));

   DBMS_OUTPUT.PUT_LINE(CHR(10));
   DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
   DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Customer', 25,' ') || ' | ' || RPAD('First Appointment', 18,' ') || ' | ' ||
                        RPAD('Last Appointment', 18,' ') || ' | ' || RPAD('Total Appointment', 17,' ') || ' | ' ||
                        RPAD('Total Spent (RM)', 16,' ') || ' |');
   DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));

   v_TotalAppointment := 0;
   v_TotalSpent := 0;
   FOR appointment_rec IN APP_CURSOR LOOP
      DBMS_OUTPUT.PUT_LINE('| ' || RPAD(appointment_rec.CustomerID, 7,' ') ||
                           RPAD(appointment_rec.CustomerName, 18,' ') || ' | ' || 
                           RPAD(appointment_rec.First_Order, 18,' ')  || ' | ' || 
                           RPAD(appointment_rec.Last_Order, 18,' ')  || ' | ' || RPAD(' ', 9,' ')  || 
                           RPAD(appointment_rec.Total_Appointment, 8,' ')  || ' | ' ||
                           LPAD(TO_CHAR(appointment_rec.Total_Spent, '99,999.99'), 16,' ')  || ' |');
      v_TotalAppointment := v_TotalAppointment + appointment_rec.Total_Appointment;
      v_TotalSpent := v_TotalSpent + appointment_rec.Total_Spent;
   END LOOP;

   DBMS_OUTPUT.PUT_LINE(RPAD('-', 110, '-'));
   DBMS_OUTPUT.PUT_LINE('|' || RPAD(' ', 69, ' ') || '| TOTAL:  ' || RPAD(v_TotalAppointment, 10, ' ') || '|' || 
                        LPAD(TO_CHAR(v_TotalSpent, '99,999.99'), 18, ' ') || '|');
   DBMS_OUTPUT.PUT_LINE(RPAD('=', 110, '='));
END;
/

SET SERVEROUTPUT ON
EXEC PRC_HIGHEST_APPOINTMENT_CUSTOMERS;

---------------------------------------- Report 3 ---------------------------------------------

-- On Demand Report of Appointment Revenue Per Day
-- Purpose: The purpose of this report is to emphasize the revenue earned during the given date. 
-- This is advantageous in terms of on demand report which indicate the highest and lowest revenue 
-- earned during the given period with the accumulation of total revenue. Furthermore, this report 
-- allows the manager to analyze the revenue of appointment

SET LINESIZE 120
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH:MI A.M.';

CREATE OR REPLACE PROCEDURE PRC_ IS

BEGIN

END;
/