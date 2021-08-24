---------------------------------------- Procedure 1 ---------------------------------------------

-- Update The Appointment Date And Time
-- Purpose: Purpose: The purpose of this procedure is used to update the appointment time. Once
-- the start time has been set, the end time will also be updated based on the

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
      DBMS_OUTPUT.PUT_LINE(v_EndTime);

      UPDATE Appointment
      SET    AppointmentDate = in_appointmentDate, StartTime = in_startTime, EndTime = v_EndTime
      WHERE  AppointmentID = in_appointmentID;

      DBMS_OUTPUT.PUT_LINE('=======================================');
      DBMS_OUTPUT.PUT_LINE('Appointment Records Sucessfully Updated');
      DBMS_OUTPUT.PUT_LINE('=======================================');
      DBMS_OUTPUT.PUT_LINE(RPAD('Appointment ID', 15) || ': ' || RPAD(appointment_rec.AppointmentID, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Date', 15) || ': ' || RPAD(in_appointmentDate, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Start Time', 15) || ': ' || RPAD(in_startTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('End Time', 15) || ': ' || RPAD(v_EndTime, 10));
      DBMS_OUTPUT.PUT_LINE(RPAD('Duration', 15) || ': ' || appointment_rec.Duration || ' hour');
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
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10079', TO_DATE('20-08-2021', 'DD-MM-YYYY'), TO_TIMESTAMP('12:00', 'HH24:MI'));
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_TIMESTAMP('20:00', 'HH24:MI'));
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10081', TO_TIMESTAMP('09:00', 'HH24:MI'));

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

COLUMN AppointmentDate FORMAT A16;
COLUMN AppointmentID   FORMAT A15;
COLUMN CustomerID      FORMAT A15;
COLUMN StartTime       FORMAT A15;
COLUMN EndTime         FORMAT A11;
COLUMN Duration        FORMAT '9';

SELECT * FROM Appointment
WHERE AppointmentID = 'A10080' OR AppointmentID = 'A10079';

---------------------------------------- Procedure 2 ---------------------------------------------

-- Create Appointment
-- Purpose: Purpose: The purpose of this procedure is to

CREATE OR REPLACE PROCEDURE PRC_CREATE_APPOINTMENT (in_customerName IN VARCHAR2,
                                                    in_appointmentDate IN DATE,
                                                    in_startTime IN TIMESTAMP,
                                                    in_serviceName IN VARCHAR2,
                                                    in_petName IN VARCHAR2) IS
   -- NO_APPOINTMENT EXCEPTION;
   -- INVALID_OPERATING_TIME EXCEPTION;
   -- PRAGMA EXCEPTION_INIT(INVALID_OPERATING_TIME, -20001);
   -- INVALID_WEEKDAY EXCEPTION;
   -- PRAGMA EXCEPTION_INIT(INVALID_WEEKDAY, -20002);
 
   -- v_duration Appointment.Duration%TYPE;
   -- v_EndTime Appointment.EndTime%TYPE;

   -- Customer
   v_custName Customer.CustomerName%TYPE;

   -- Pet
   v_petType Pet.PetType%TYPE;
   v_petSex  Pet.Sex%TYPE;
   v_color   Pet.Color%TYPE;
   
BEGIN
   SELECT CustomerName INTO v_custName
   FROM   Customer
   WHERE  CustomerName = in_customerName;

   IF SQL%NOTFOUND THEN
      RAISE_APPLICATION_ERROR(-20003, in_customerName || 'cannot be found!, Please insert customer details first before making appointment');
   END IF;

   -- IF SQL%NOTFOUND THEN
   --    DBMS_OUTPUT.PUT_LINE('222HAHAHAA');
   -- END IF;

   -- IF SQL%NOTFOUND THEN
   --    DBMS_OUTPUT.PUT_LINE('333HAHAHAA');
   -- END IF;

END;
/

SET SERVEROUTPUT ON
EXEC PRC_CREATE_APPOINTMENT('JC Rogers', TO_DATE('01-07-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('12:00', 'HH24:MI'), 'Grooming','Wong Choi');

INSERT INTO Appointment VALUES ('A'||APPOINTMENT_SEQ.NEXTVAL, 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('30-07-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);

ACCEPT custName CHAR FORMAT A50-
PROMPT 'Enter Customer Name: '

ACCEPT appDate DATE FORMAT 'DD-MM-YYYY'-
PROMPT 'Enter Appointment Date (DD-MM-YYYY): '

ACCEPT appStartTime DATE FORMAT 'HH24:MI'-
PROMPT 'Enter Start Time (HH24:MI): '

ACCEPT serviceName CHAR FORMAT A50-
PROMPT 'Enter Service Name: '

ACCEPT petName CHAR FORMAT A50-
PROMPT 'Enter Pet Name: '  