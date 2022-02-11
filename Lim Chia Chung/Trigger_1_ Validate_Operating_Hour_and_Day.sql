---------------------------------------- Trigger 1 ---------------------------------------------

-- Validate Operating Hour and Day

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

INSERT INTO Appointment VALUES ('A10081', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('23-08-2021', 'DD-MM-YYYY'), '09:00', '12:00', 2);

-- Trigger (No Changes Made)
EXEC PRC_UPDATE_APPOINTMENT_DATE_TIME('A10080', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('13:00', 'HH24:MI'));
