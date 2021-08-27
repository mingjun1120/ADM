---------------------------------------- Trigger 1 ---------------------------------------------

-- Validate Operating Hour and Day
-- Purpose: The purpose of this trigger is to ensure that the new appointment time is within
-- operating time which is between 10am to 4pm. The appointment will no be updated if the time
-- is out of operating hours.

CREATE OR REPLACE TRIGGER TRG_VALIDATE_OPERATING_HR_DAY
BEFORE INSERT OR UPDATE OF AppointmentDate, StartTime, EndTime ON Appointment
FOR EACH ROW
DECLARE
   v_day CHAR(9);
BEGIN
   v_day := FUNC_CONVERT_DAY_TO_NAME(EXTRACT(DAY FROM :NEW.AppointmentDate));

   IF UPDATING THEN
      IF :NEW.AppointmentDate = :OLD.AppointmentDate AND
         :NEW.StartTime = :OLD.StartTime THEN
         RAISE_APPLICATION_ERROR(-20000, 'No Changes Made');
      ELSIF v_day = 'SUNDAY' OR v_day = 'SATURDAY' THEN
         DBMS_OUTPUT.PUT_LINE(v_day);
         RAISE_APPLICATION_ERROR(-20002, 'Pet Shop is closed on weekends');
      ELSIF :NEW.StartTime < 10 OR TO_NUMBER(TO_CHAR(:NEW.EndTime, 'HH24')) > 19 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Not Operating Hour');
      END IF;
   ELSIF INSERTING THEN
      IF :NEW.StartTime < 10 OR TO_NUMBER(TO_CHAR(:NEW.EndTime, 'HH24')) > 19 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Not Operating Hour');
      ELSIF v_day = 'SUNDAY' OR v_day = 'SATURDAY' THEN
         DBMS_OUTPUT.PUT_LINE(v_day);
         RAISE_APPLICATION_ERROR(-20002, 'Pet Shop is closed on weekends');
      END IF;
   END IF;
END;
/

-- INSERT INTO Appointment VALUES ('A10081', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('23-08-2021', 'DD-MM-YYYY'), '09:00', '12:00', 2);

-- Trigger (No Changes Made)
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('13:00', 'HH24:MI'));

---------------------------------------- Trigger 2 ---------------------------------------------

-- Validate the Availability of Appointment
-- Purpose: The purpose of this trigger is to ensure that the appointment inserted and updated 
-- has sufficient information or to prevent human error from user.

CREATE OR REPLACE TRIGGER TRG_VALIDATE_APPOINTMENT_AVAILABILITY
BEFORE INSERT OR UPDATE ON Appointment
FOR EACH ROW
DECLARE
   INVALID_SERVICE EXCEPTION;
   NO_PET_FOUND EXCEPTION;
   v_custID   Customer.CustomerID%TYPE;
   v_petID    Pet.PetID%TYPE;
   v_serID    Services.ServiceID%TYPE;

   CURSOR PET_CURSOR IS
      SELECT *
      FROM   Pet
      WHERE  PetID = :NEW.PetID;

   CURSOR SER_CURSOR IS
      SELECT *
      FROM   Services
      WHERE  ServiceID = :NEW.ServiceID;
   
   pet_rec      PET_CURSOR%ROWTYPE;
   services_rec SER_CURSOR%ROWTYPE;
BEGIN

   OPEN SER_CURSOR;
   FETCH SER_CURSOR INTO services_rec;

   OPEN PET_CURSOR;
   FETCH PET_CURSOR INTO pet_rec;

   IF SER_CURSOR%NOTFOUND THEN
      RAISE_APPLICATION_ERROR(-20004, 'Invalid Service');
   ELSE
      SELECT CustomerID INTO v_custID
      FROM   Customer
      WHERE  CustomerID = :NEW.CustomerID;

      IF PET_CURSOR%NOTFOUND THEN
         RAISE_APPLICATION_ERROR(-20003, 'No Pet Found');
      END IF;
   END IF;

   CLOSE SER_CURSOR;
   CLOSE PET_CURSOR;
END;
/

-- Trigger (Invalid Service)
EXEC PRC_CREATE_APPOINTMENT('C1038', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'SER020','PET1011', 'E001');

start D:\Text\ADM\Trigger.sql
