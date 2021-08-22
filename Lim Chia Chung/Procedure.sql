---------------------------------------- Procedure 1 ---------------------------------------------

-- Update The Appointment Time
-- Purpose: Purpose: The purpose of this procedure is used to update the appointment time. Once
-- the start time has been set, the end time will also be updated based on the

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

CREATE OR REPLACE PROCEDURE PRC_UPDATE_APPOINTMENT_TIME(in_appointmentID VARCHAR,
                                                        in_startTime TIMESTAMP) IS
   NO_APPOINTMENT EXCEPTION;
   INVALID_OPERATING_TIME EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_OPERATING_TIME, -20000);

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
      DBMS_OUTPUT.PUT_LINE(v_EndTime);

      -- IF in_startTime < 10 OR TO_NUMBER(TO_CHAR(v_EndTime, 'HH24')) > 16 THEN
      --    RAISE INVALID_OPERATING_TIME;
      UPDATE Appointment
      SET    StartTime = in_startTime, EndTime = v_EndTime
      WHERE  AppointmentID = in_appointmentID;

      DBMS_OUTPUT.PUT_LINE('=======================================');
      DBMS_OUTPUT.PUT_LINE('Appointment Records Sucessfully Updated');
      DBMS_OUTPUT.PUT_LINE('=======================================');
      DBMS_OUTPUT.PUT_LINE(RPAD('Appointment ID', 15) || ': ' || RPAD(appointment_rec.AppointmentID, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Start Time', 15) || ': ' || RPAD(in_startTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('End Time', 15) || ': ' || RPAD(v_EndTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Duration', 15) || ': ' || appointment_rec.Duration || ' hour');
   END IF;

   CLOSE APP_CURSOR;

   EXCEPTION 
      WHEN NO_APPOINTMENT THEN
         DBMS_OUTPUT.PUT_LINE('====================');
         DBMS_OUTPUT.PUT_LINE('NO APPOINTMENT FOUND');
         DBMS_OUTPUT.PUT_LINE('====================');
      WHEN INVALID_OPERATING_TIME THEN
         DBMS_OUTPUT.PUT_LINE('==================');
         DBMS_OUTPUT.PUT_LINE('NOT OPERATING HOUR');
         DBMS_OUTPUT.PUT_LINE('==================');
END;
/

SET SERVEROUTPUT ON
EXEC PRC_UPDATE_APPOINTMENT_TIME('A10079', TO_TIMESTAMP('15:00', 'HH24:MI'));
EXEC PRC_UPDATE_APPOINTMENT_TIME('A10080', TO_TIMESTAMP('09:00', 'HH24:MI'));
EXEC PRC_UPDATE_APPOINTMENT_TIME('A10081', TO_TIMESTAMP('09:00', 'HH24:MI'));

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS

COLUMN AppointmentDate FORMAT A16;
COLUMN AppointmentID   FORMAT A15;
COLUMN CustomerID      FORMAT A15;
COLUMN StartTime       FORMAT A15;
COLUMN EndTime         FORMAT A11;
COLUMN Duration        FORMAT '9';

SELECT * FROM Appointment
WHERE AppointmentID = 'A10080' OR AppointmentID = 'A10079';

---------------------------------------- Procedure 2 ---------------------------------------------

-- 
-- Purpose: Purpose: The purpose of this procedure is to

CREATE OF REPLACE PROCEDURE

BEGIN

END;
/
