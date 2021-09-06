---------------------------------------- Report 2 ---------------------------------------------

-- Summary Report of Top 10 Customers With The Highest Appointments

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
