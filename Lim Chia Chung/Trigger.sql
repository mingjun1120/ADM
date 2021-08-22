---------------------------------------- Trigger 1 ---------------------------------------------

-- Validate Operating Hour
-- Purpose: The purpose of this trigger is to ensure that the new appointment time is within
-- operating time which is between 10am to 4pm. The appointment will no be updated if the time
-- is out of operating hours.

-- DROP TRIGGER TRG_VALIDATE_OPERATING_HR;
CREATE OR REPLACE TRIGGER TRG_VALIDATE_OPERATING_HR
BEFORE INSERT OR UPDATE OF StartTime, EndTime ON Appointment
FOR EACH ROW
DECLARE
   v_startTime Appointment.StartTime%TYPE;
   v_endTime   Appointment.EndTime%TYPE;
BEGIN
   -- v_startTime := :NEW.StartTime;
   -- v_endTime := :NEW.EndTime;
   IF INSERTING OR UPDATING THEN
      IF :NEW.StartTime = :OLD.StartTime THEN
         RAISE_APPLICATION_ERROR(-20000, 'No Changes Made');
      ELSIF :NEW.StartTime < 10 OR TO_NUMBER(TO_CHAR(:NEW.EndTime, 'HH24')) > 19 THEN
         RAISE_APPLICATION_ERROR(-20001, 'Not Operating Hour');
      END IF;
   -- ELSIF INSERTING THEN
            
   END IF;
END;
/

INSERT INTO Appointment VALUES ('A10081', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('30-06-2018', 'DD-MM-YYYY'), '09:00', '10:00', 1);

---------------------------------------- Trigger 2 ---------------------------------------------
