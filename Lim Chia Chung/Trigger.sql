---------------------------------------- Trigger 1 ---------------------------------------------

-- Validate Operating Hour
-- Purpose: The purpose of this trigger is to ensure that the new appointment time is within
-- operating time which is between 10am to 4pm. The appointment will no be updated if the time
-- is out of operating hours.

-- DROP TRIGGER TRG_VALIDATE_OPERATING_HR;
CREATE OR REPLACE TRIGGER TRG_VALIDATE_OPERATING_HR
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

INSERT INTO Appointment VALUES ('A10081', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('23-08-2021', 'DD-MM-YYYY'), '09:00', '12:00', 2);

start D:\Text\ADM\Trigger1.sql

---------------------------------------- Trigger 2 ---------------------------------------------

-- Validate the Availability of Appointment
-- Purpose: The purpose of this trigger is to ensure that the appointment inserted has sufficient
-- information.

-- DROP TRIGGER TRG_VALIDATE_APPOINTMENT_AVAILABILITY;
CREATE OR REPLACE TRIGGER TRG_VALIDATE_APPOINTMENT_AVAILABILITY
BEFORE INSERT ON Appointment
FOR EACH ROW
DECLARE
   v_custID   Customer.CustomerID%TYPE;
   v_petID    Pet.PetID%TYPE;
   v_serID    Services.ServiceID%TYPE;
BEGIN
   SELECT CustomerID INTO v_custID
   FROM   Customer
   WHERE  CustomerID = :NEW.CustomerID;

   SELECT PetID INTO v_petID
   FROM   Pet
   WHERE  PetID = :NEW.PetID;

   SELECT ServiceID INTO v_serID
   FROM   Services
   WHERE  ServiceID = :NEW.ServiceID;

   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('+No Records Found+');
         DBMS_OUTPUT.PUT_LINE('++++++++++++++++++');
         DBMS_OUTPUT.PUT_LINE('Please insert this specific details before making appointment');
END;
/

start D:\Text\ADM\Trigger2.sql
