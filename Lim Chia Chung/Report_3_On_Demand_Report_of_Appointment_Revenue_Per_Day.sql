---------------------------------------- Report 3 ---------------------------------------------

-- On Demand Report of Appointment Revenue Per Day

SET LINESIZE 120
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH:MI A.M.';

CREATE OR REPLACE PROCEDURE PRC_APPOINTMENT_REVENUE_PER_DAY (in_firstDate IN DATE, in_lastDate IN DATE) IS
   INVALID_DATE EXCEPTION;
   Accumulated_Revenue NUMBER(7,2) := 0;
   SPACES              VARCHAR(100);
   v_firstDay          NUMBER(7) := TO_NUMBER(TO_CHAR(in_firstDate, 'DD'));
   v_firstMonth        NUMBER(7) := TO_NUMBER(TO_CHAR(in_firstDate, 'MM'));
   v_lastDay           NUMBER(7) := TO_NUMBER(TO_CHAR(in_lastDate, 'DD'));
   v_lastMonth         NUMBER(7) := TO_NUMBER(TO_CHAR(in_lastDate, 'MM'));
   
   CURSOR APP_CURSOR IS
      SELECT   A.AppointmentDate, SUM(S.ServiceCharge * 1.1) AS Total_Revenue,
               (SUM(S.ServiceCharge * 1.1) - LAG(SUM(S.ServiceCharge * 1.1), 1) OVER 
               (ORDER BY A.AppointmentDate)) * 100 / LAG(SUM(S.ServiceCharge * 1.1), 1) OVER 
               (ORDER BY A.AppointmentDate) AS Growth
      FROM     Appointment A, Services S
      WHERE    A.SERVICEID = S.SERVICEID AND
               A.AppointmentDate BETWEEN in_firstDate AND in_lastDate
      GROUP BY A.AppointmentDate
      ORDER BY 1;
   
   appointment_rec APP_CURSOR%ROWTYPE;
BEGIN
   OPEN APP_CURSOR;

   IF v_firstMonth > v_lastMonth THEN
      RAISE INVALID_DATE;
   ELSIF v_firstDay > v_lastDay THEN
      RAISE INVALID_DATE;
   END IF;

   FOR v_counter IN 1 .. 5 LOOP
      DBMS_OUTPUT.PUT_LINE(CHR(10));
   END LOOP;

   DBMS_OUTPUT.PUT_LINE(RPAD('*', 10, ' ') || RPAD('-', 53, '-'));
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 10, ' ') || '| Appointment Revenue from ' || in_firstDate || ' to ' ||
                        in_lastDate || ' |');
   DBMS_OUTPUT.PUT_LINE(RPAD('*', 10, ' ') || RPAD('-', 53, '-'));
   
   DBMS_OUTPUT.PUT_LINE(CHR(10));
   DBMS_OUTPUT.PUT_LINE(RPAD('-', 73, '-'));
   DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Date', 15,' ') || ' | ' || LPAD('Total Revenue (RM)', 24,' ') || ' | ' ||
                        LPAD('Growth(%)', 24,' ') || ' |');
   DBMS_OUTPUT.PUT_LINE(RPAD('-', 73, '-'));
   
   Accumulated_Revenue := 0;
   LOOP
      FETCH APP_CURSOR INTO appointment_rec;
      EXIT WHEN APP_CURSOR%NOTFOUND;

      IF APP_CURSOR%ROWCOUNT = 1 THEN
         SPACES := RPAD(' ', 24, ' ');
      END IF;
      DBMS_OUTPUT.PUT_LINE('| ' || RPAD(appointment_rec.AppointmentDate, 15,' ')  || ' | ' ||
                           LPAD(TO_CHAR(appointment_rec.Total_Revenue, '999,999.99'), 24,' ')  || ' | ' ||
                           CASE WHEN APP_CURSOR%ROWCOUNT = 1 THEN 
                              SPACES 
                           ELSE 
                              LPAD(TO_CHAR(appointment_rec.Growth, '999,990.99'), 24,' ') 
                           END 
                           || ' |');
      Accumulated_Revenue := Accumulated_Revenue + appointment_rec.Total_Revenue;
   END LOOP;

   DBMS_OUTPUT.PUT_LINE(RPAD('-', 73, '-'));
   DBMS_OUTPUT.PUT_LINE('| ' || 'Accumulation of Appointment Revenue: RM ' ||
                        RPAD(TO_CHAR(Accumulated_Revenue, '999,999.99'), 29,' ')  || ' |');
   DBMS_OUTPUT.PUT_LINE(RPAD('-', 73, '-'));
   DBMS_OUTPUT.PUT_LINE('Total ' || APP_CURSOR%ROWCOUNT || ' records found.');

   CLOSE APP_CURSOR;

   EXCEPTION WHEN INVALID_DATE THEN
      DBMS_OUTPUT.PUT_LINE('++++++++++++++');
      DBMS_OUTPUT.PUT_LINE('+INVALID DATE+');
      DBMS_OUTPUT.PUT_LINE('++++++++++++++');
      DBMS_OUTPUT.PUT_LINE('The first date is greater than the last date');
END;
/

SET SERVEROUTPUT ON
-- Success
EXEC PRC_APPOINTMENT_REVENUE_PER_DAY(TO_DATE('15-03-2018', 'DD-MM-YYYY'), TO_DATE('23-04-2018', 'DD-MM-YYYY'));

-- Error (Invalid Date)
-- EXEC PRC_APPOINTMENT_REVENUE_PER_DAY(TO_DATE('15-04-2018', 'DD-MM-YYYY'), TO_DATE('15-03-2018', 'DD-MM-YYYY'));
-- EXEC PRC_APPOINTMENT_REVENUE_PER_DAY(TO_DATE('31-03-2018', 'DD-MM-YYYY'), TO_DATE('15-03-2018', 'DD-MM-YYYY'));
