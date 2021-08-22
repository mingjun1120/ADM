---------------------------------------- Trigger 1 ---------------------------------------------

-- Validate Operating Hour
-- Purpose: The purpose of this trigger is to ensure that the new appointment time is within
-- operating time which is between 10am to 4pm. The appointment will no be updated if the time
-- is out of operating hours.

DROP TRIGGER TRG_VALIDATE_OPERATING_HR;
CREATE OR REPLACE TRIGGER TRG_VALIDATE_OPERATING_HR
BEFORE INSERT OR UPDATE OF StartTime, EndTime ON Appointment
FOR EACH ROW
DECLARE
   v_startTime Appointment.StartTime%TYPE;
   v_endTime   Appointment.EndTime%TYPE;
BEGIN
   -- v_startTime := :NEW.StartTime;
   -- v_endTime := :NEW.EndTime;
   CASE WHEN UPDATING THEN
      IF :NEW.StartTime < 10 OR TO_NUMBER(TO_CHAR(:NEW.EndTime, 'HH24')) > 19 THEN
         RAISE_APPLICATION_ERROR(-20000, 'Not Operating Hour');
      END IF;
   END CASE;
END;
/

---------------------------------------- Trigger 2 ---------------------------------------------
