---------------------------------------- Sequence 1 ---------------------------------------------

-- Appointment Sequence

DROP SEQUENCE APPOINTMENT_SEQ;
CREATE SEQUENCE APPOINTMENT_SEQ
                INCREMENT BY 1
                START WITH 10081
                MAXVALUE 99999999
                NOCACHE
                NOCYCLE;

INSERT INTO Appointment VALUES ('A'||APPOINTMENT_SEQ.NEXTVAL, 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('30-07-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
