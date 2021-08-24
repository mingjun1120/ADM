---------------------------------------- Procedure 1 ---------------------------------------------

-- Update The Appointment Date And Time
-- Purpose: Purpose: The purpose of this procedure is used to update the appointment time. Once
-- the start time has been set, the end time will also be updated based on the duration.

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

-- Purpose: Purpose: The purpose of this procedure is used to update the appointment time. Once
-- the start time has been set, the end time will also be updated based on the

CREATE OR REPLACE PROCEDURE PRC_CREATE_APPOINTMENT (in_customerName IN VARCHAR2,
                                                    in_appointmentDate IN DATE,
                                                    in_startTime IN TIMESTAMP,
                                                    in_serviceName IN VARCHAR2,
                                                    in_petName IN VARCHAR2,
                                                    in_empID IN VARCHAR2) IS
   EMP_ABSENT EXCEPTION;
   INVALID_OPERATING_TIME EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_OPERATING_TIME, -20001);
   INVALID_WEEKDAY EXCEPTION;
   PRAGMA EXCEPTION_INIT(INVALID_WEEKDAY, -20002);
 
   -- Appointment
   v_duration Appointment.Duration%TYPE;
   v_endTime  Appointment.EndTime%TYPE;

   -- Customer
   v_custID   Customer.CustomerID%TYPE;
   v_custName Customer.CustomerName%TYPE;

   -- Pet
   v_petID   Pet.PetID%TYPE;
   v_petName Pet.PetName%TYPE;

   -- Services
   v_serID   Services.ServiceID%TYPE;
   v_sername Services.ServiceName%TYPE;

   CURSOR APP_CURSOR IS
      SELECT *
      FROM   Appointment
      WHERE  AppointmentDate = in_appointmentDate;

   appointment_rec APP_CURSOR%ROWTYPE;
BEGIN
   OPEN APP_CURSOR;
   FETCH APP_CURSOR INTO appointment_rec;

   SELECT CustomerID, CustomerName INTO v_custID, v_custName
   FROM   Customer
   WHERE  CustomerName = in_customerName;
   DBMS_OUTPUT.PUT_LINE('Customer');

   SELECT PetID, PetName INTO v_petID, v_petName
   FROM   Pet
   WHERE  PetName = in_petName;
   DBMS_OUTPUT.PUT_LINE('Pet');

   SELECT ServiceID, ServiceName INTO v_serID, v_sername
   FROM   Services
   WHERE  ServiceName = in_serviceName;
   DBMS_OUTPUT.PUT_LINE('Services');
       
   IF v_sername = 'Dental Scaling' THEN
      v_duration := 1;
   ELSE
      v_duration := 2;
   END IF;
   
   v_endTime := in_startTime + v_duration / 24;
   -- DBMS_OUTPUT.PUT_LINE(in_startTime);
   -- DBMS_OUTPUT.PUT_LINE(v_duration);
   -- DBMS_OUTPUT.PUT_LINE(v_endTime);

   WHILE APP_CURSOR%FOUND
   LOOP
      IF appointment_rec.StartTime = in_startTime THEN
         IF appointment_rec.EmployeeID = in_empID THEN
            IF appointment_rec.StartTime BETWEEN appointment_rec.StartTime AND v_endTime THEN
               DBMS_OUTPUT.PUT_LINE('Appointment cannot be made');
            END IF;
         END IF;
      END IF;

      DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || appointment_rec.AppointmentID);
      DBMS_OUTPUT.PUT_LINE('Date: ' || appointment_rec.AppointmentDate);
      DBMS_OUTPUT.PUT_LINE('Employee ID: ' || appointment_rec.EmployeeID);
      DBMS_OUTPUT.PUT_LINE('Start Time: ' || appointment_rec.StartTime);
      DBMS_OUTPUT.PUT_LINE('====================================');
      FETCH APP_CURSOR INTO appointment_rec;
   END LOOP;

   INSERT INTO Appointment (AppointmentID, CustomerID, ServiceID, PetID, EmployeeID, AppointmentDate, StartTime, EndTime, Duration)
   VALUES ('A'||APPOINTMENT_SEQ.NEXTVAL, v_custID, v_serID, v_petID, in_empID, in_appointmentDate, in_startTime, v_endTime, v_duration);
   
   DBMS_OUTPUT.PUT_LINE('==================================');
   DBMS_OUTPUT.PUT_LINE('Appointment Is Sucessfully Created');
   DBMS_OUTPUT.PUT_LINE('==================================');
   DBMS_OUTPUT.PUT_LINE(RPAD('Appointment ID', 15) || ': ' || RPAD('A'||APPOINTMENT_SEQ.CURRVAL, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Date', 15) || ': ' || RPAD(in_appointmentDate, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Start Time', 15) || ': ' || RPAD(in_startTime, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('End Time', 15) || ': ' || RPAD(v_endTime, 10));
   DBMS_OUTPUT.PUT_LINE(RPAD('Duration', 15) || ': ' || v_duration || ' hour');
   DBMS_OUTPUT.PUT_LINE(RPAD('Employee ID', 15) || ': ' || RPAD(in_empID, 10));

   CLOSE APP_CURSOR;

   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+No Records Found+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Please insert this specific details before making appointment');
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
EXEC PRC_CREATE_APPOINTMENT('Milly Harrision', TO_DATE('17-03-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('14:00', 'HH24:MI'), 'Grooming','Wong Choi', 'E001');
EXEC PRC_CREATE_APPOINTMENT('Archy Krule', TO_DATE('17-03-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'Grooming','Boonie', 'E001');

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

SELECT * FROM Appointment;

INSERT INTO Appointment VALUES ('A'||APPOINTMENT_SEQ.NEXTVAL, 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('30-07-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);



--       J.JOBPOSITION = 'Pet Grommer'