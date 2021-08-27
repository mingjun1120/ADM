---------------------------------------- Procedure 1 ---------------------------------------------

-- Update The Appointment Date And Time
-- Purpose: Purpose: The purpose of this procedure is used to update the appointment time. Once
-- the start time has been set, the end time will also be updated based on the duration.

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

-- Success
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10079', TO_DATE('30-07-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('12:00', 'HH24:MI'));

-- Error (No Changes Made)
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('13:00', 'HH24:MI'));

-- Error (No Appointment Found)
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10081', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('09:00', 'HH24:MI'));

COLUMN AppointmentDate FORMAT A16;
COLUMN AppointmentID   FORMAT A15;
COLUMN CustomerID      FORMAT A15;
COLUMN StartTime       FORMAT A15;
COLUMN EndTime         FORMAT A11;
COLUMN Duration        FORMAT '9';

SELECT * FROM Appointment
WHERE AppointmentID = 'A10080' OR AppointmentID = 'A10079';

start D:\Text\ADM\Procedure1.sql

---------------------------------------- Procedure 2 ---------------------------------------------

-- Create Appointment
-- Purpose: Purpose: The purpose of this procedure is to allow user to make appointment requested
-- by customer. The user is required to pass in the parameter for validation purposes. For
-- example, when there are an employee are working on the same day and same time the appointment
-- is not allowed to be made.

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

CREATE OR REPLACE PROCEDURE PRC_CREATE_APPOINTMENT (in_customerID IN VARCHAR2,
                                                    in_appointmentDate IN DATE,
                                                    in_startTime IN TIMESTAMP,
                                                    in_serviceID IN VARCHAR2,
                                                    in_petID IN VARCHAR2,
                                                    in_empID IN VARCHAR2) IS
   APPOINTMENT_CONFLICT EXCEPTION;

   INVALID_OPERATING_TIME EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_OPERATING_TIME, -20001);
   
   INVALID_WEEKDAY EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_WEEKDAY, -20002);

   NO_PET_FOUND EXCEPTION;
   PRAGMA EXCEPTION_INIT(NO_PET_FOUND, -20003);

   INVALID_SERVICE EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_SERVICE, -20004);

   v_duration Appointment.Duration%TYPE;
   v_endTime  Appointment.EndTime%TYPE;
   v_serID    Services.ServiceID%TYPE;

   CURSOR APP_CURSOR IS
      SELECT *
      FROM   Appointment
      WHERE  AppointmentDate = in_appointmentDate;

   appointment_rec APP_CURSOR%ROWTYPE;
BEGIN
   OPEN APP_CURSOR;
   FETCH APP_CURSOR INTO appointment_rec;
       
   IF v_serID = 'SER001' THEN
      v_duration := 1;
   ELSE
      v_duration := 2;
   END IF;
   
   v_endTime := in_startTime + v_duration / 24;

   WHILE APP_CURSOR%FOUND
   LOOP
      IF appointment_rec.EmployeeID = in_empID THEN
         IF appointment_rec.StartTime = in_startTime THEN
            RAISE APPOINTMENT_CONFLICT;
         ELSIF (in_startTime > appointment_rec.StartTime AND
               in_startTime < appointment_rec.EndTime) OR 
               (v_endTime > appointment_rec.StartTime AND
               v_endTime < appointment_rec.EndTime) THEN
            RAISE APPOINTMENT_CONFLICT;   
         END IF;
      END IF;
      FETCH APP_CURSOR INTO appointment_rec;
   END LOOP;

   INSERT INTO Appointment (AppointmentID, CustomerID, ServiceID, PetID, EmployeeID, AppointmentDate, StartTime, EndTime, Duration)
   VALUES ('A'||APPOINTMENT_SEQ.NEXTVAL, in_customerID, in_serviceID, in_petID, in_empID, in_appointmentDate, in_startTime, v_endTime, v_duration);
   
   DBMS_OUTPUT.PUT_LINE('==================================');
   DBMS_OUTPUT.PUT_LINE('Appointment Is Sucessfully Created');
   DBMS_OUTPUT.PUT_LINE('==================================');
   DBMS_OUTPUT.PUT_LINE(RPAD('Appointment ID', 15) || ': ' || RPAD('A'||APPOINTMENT_SEQ.CURRVAL, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Date', 15) || ': ' || RPAD(in_appointmentDate, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Start Time', 15) || ': ' || RPAD(in_startTime, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('End Time', 15) || ': ' || RPAD(v_endTime, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Duration', 15) || ': ' || v_duration || ' hour(s)');
   DBMS_OUTPUT.PUT_LINE(RPAD('Employee ID', 15) || ': ' || RPAD(in_empID, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Pet ID', 15) || ': ' || RPAD(in_petID, 10));

   CLOSE APP_CURSOR;

   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+No Customer Found+');
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Please register the as a new customer and pet before making appointment');
      WHEN NO_PET_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+No Pet Found+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Please register the pet before making appointment');
      WHEN INVALID_SERVICE THEN
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+Invalid Service+');
         DBMS_OUTPUT.PUT_LINE('+++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('This is not a valid service');
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
      WHEN APPOINTMENT_CONFLICT THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+APPOINTMENT CONFLICT+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Appointment conflicts with others');
END;
/

SET SERVEROUTPUT ON
-- Existing customer
EXEC PRC_CREATE_APPOINTMENT('C1001', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'SER002','PET1009', 'E001');

-- Error (Conflict)
EXEC PRC_CREATE_APPOINTMENT('C1004', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('14:00', 'HH24:MI'), 'SER002','PET1002', 'E001');
EXEC PRC_CREATE_APPOINTMENT('C1006', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('14:00', 'HH24:MI'), 'SER003','PET1003', 'E002');

-- Error (New Customer)
EXEC PRC_CREATE_APPOINTMENT('C'||CUSTOMER_SEQ.NEXTVAL, TO_DATE('17-03-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'SER002','PET'||PET_SEQ.NEXTVAL, 'E001');

-- Error (Existing customer with new pet or other pet)
EXEC PRC_CREATE_APPOINTMENT('C1001', TO_DATE('17-03-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'SER002','PET'||PET_SEQ.NEXTVAL, 'E001');

COLUMN AppointmentDate FORMAT A16;
COLUMN AppointmentID   FORMAT A15;
COLUMN CustomerID      FORMAT A15;
COLUMN StartTime       FORMAT A15;
COLUMN EndTime         FORMAT A11;
COLUMN Duration        FORMAT '9';

SELECT * FROM Appointment;

start D:\Text\ADM\Procedure2.sql
