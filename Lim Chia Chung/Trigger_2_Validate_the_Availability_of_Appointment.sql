---------------------------------------- Trigger 2 ---------------------------------------------

-- Validate the Availability of Appointment

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
-- EXEC PRC_CREATE_APPOINTMENT('C1038', TO_DATE('30-06-2018', 'DD-MM-YYYY'), TO_TIMESTAMP('15:00', 'HH24:MI'), 'SER020','PET1011', 'E001');
