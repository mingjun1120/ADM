---------------------------------------- Procedure 1 ---------------------------------------------

-- Update The Appointment Date And Time

SET LINESIZE 120
SET PAGESIZE 600
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

CREATE OR REPLACE PROCEDURE PRC_UPDATE_APPOINTMENT_DATE_TIME(in_appointmentID VARCHAR,
                                                             in_appointmentDate DATE,
                                                             in_startTime TIMESTAMP) IS
   NO_APPOINTMENT EXCEPTION;
   
   INVALID_OPERATING_TIME EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_OPERATING_TIME, -20001);

   INVALID_WEEKDAY EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_WEEKDAY, -20002);

   v_duration Appointment.Duration%TYPE;
   v_EndTime Appointment.EndTime%TYPE;
   
   CURSOR APP_CURSOR IS
      SELECT *
      FROM   Appointment
      WHERE  AppointmentID = in_appointmentID;

   appointment_rec APP_CURSOR%ROWTYPE;
BEGIN
   OPEN APP_CURSOR;
   FETCH APP_CURSOR INTO appointment_rec;

   IF APP_CURSOR%NOTFOUND THEN
      RAISE NO_APPOINTMENT;
   ELSE
      v_EndTime := in_startTime + appointment_rec.Duration / 24;

      UPDATE Appointment
      SET    AppointmentDate = in_appointmentDate, StartTime = in_startTime, EndTime = v_EndTime
      WHERE  AppointmentID = in_appointmentID;

      DBMS_OUTPUT.PUT_LINE('========================================');
      DBMS_OUTPUT.PUT_LINE('Appointment Records Successfully Updated');
      DBMS_OUTPUT.PUT_LINE('========================================');
      DBMS_OUTPUT.PUT_LINE(RPAD('Appointment ID', 15) || ': ' || RPAD(appointment_rec.AppointmentID, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Date', 15) || ': ' || RPAD(in_appointmentDate, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Start Time', 15) || ': ' || RPAD(in_startTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('End Time', 15) || ': ' || RPAD(v_EndTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Duration', 15) || ': ' || appointment_rec.Duration || ' hour(s)');
   END IF;

   CLOSE APP_CURSOR;

   EXCEPTION 
      WHEN NO_APPOINTMENT THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+NO APPOINTMENT FOUND+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++++');
      WHEN INVALID_OPERATING_TIME THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+NOT OPERATING HOUR+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Operating hour is from 10am to 7pm');
      WHEN INVALID_WEEKDAY THEN
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+NOT OPERATING DAY+');
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Operating days is from Monday to Friday');
END;
/

SET SERVEROUTPUT ON

--- Success
-- EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10079', TO_DATE('30-07-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('12:00', 'HH24:MI'));

-- Trigger (No Changes Made) 
-- EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('13:00', 'HH24:MI'));

-- Error (No Appointment Found)
-- EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10081', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('09:00', 'HH24:MI'));

-- Error (Not Operating Hour)
-- EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('09:00', 'HH24:MI'));

-- Error (Not Operating Day)
-- EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('22-08-2021', 'DD-MM-YYYY'), TO_TIMESTAMP('14:00', 'HH24:MI'));


-- COLUMN AppointmentDate FORMAT A16;
-- COLUMN AppointmentID   FORMAT A15;
-- COLUMN CustomerID      FORMAT A15;
-- COLUMN StartTime       FORMAT A15;
-- COLUMN EndTime         FORMAT A11;
-- COLUMN Duration        FORMAT '9';

-- SELECT * FROM Appointment
-- WHERE AppointmentID = 'A10080' OR AppointmentID = 'A10079';
