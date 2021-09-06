---------------------------------------- Sequence 2 ---------------------------------------------

-- Pet Sequence

DROP SEQUENCE PET_SEQ;
CREATE SEQUENCE PET_SEQ
                INCREMENT BY 1
                START WITH 1021
                MAXVALUE 99999999
                NOCACHE
                NOCYCLE;

-- INSERT INTO Pet VALUES ('PET'||PET_SEQ.NEXTVAL, 'LCC', 'Ragdoll', 'M', 'White');
