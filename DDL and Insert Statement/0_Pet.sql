DROP TABLE Pet;
CREATE TABLE Pet
(PetID    VARCHAR2(7)  NOT NULL,
 PetName  VARCHAR2(50) NOT NULL,
 PetType  VARCHAR2(50) NOT NULL,
 Sex      VARCHAR2(1)  NOT NULL,
 Color    VARCHAR2(15) NOT NULL,
PRIMARY KEY(PetID),
CONSTRAINT chk_pet_id CHECK (SUBSTR(PetID, 1, 3) = 'PET'),
CONSTRAINT chk_pet_sex CHECK (UPPER(Sex) IN ('M','F'))
);

INSERT INTO Pet VALUES ('PET1001', 'Wong Choi', 'Rottweiler', 'M', 'Black');
INSERT INTO Pet VALUES ('PET1002', 'Boonie', 'Beagle', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET1003', 'Jacky', 'Corgi', 'M', 'Black');
INSERT INTO Pet VALUES ('PET1004', 'Kingsley', 'Yorkshire Terrier', 'M', 'White');
INSERT INTO Pet VALUES ('PET1005', 'Honey', 'Poodle', 'F', 'Black');
INSERT INTO Pet VALUES ('PET1006', 'Darby', 'Corgi', 'M', 'Brown');
INSERT INTO Pet VALUES ('PET1007', 'Daisy', 'Poodle', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET1008', 'Harper', 'Dachshunds', 'M', 'Golded');
INSERT INTO Pet VALUES ('PET1009', 'Jack', 'Rottweiler', 'F', 'Black');
INSERT INTO Pet VALUES ('PET1010', 'Pearl', 'Bulldog', 'M', 'White');
INSERT INTO Pet VALUES ('PET1011', 'Yvette', 'Persian Cat', 'M', 'White');
INSERT INTO Pet VALUES ('PET1012', 'Quinn', 'Ragdoll', 'F', 'Black');
INSERT INTO Pet VALUES ('PET1013', 'Bexley', 'Siberian Cat', 'M', 'Gold');
INSERT INTO Pet VALUES ('PET1014', 'Mochi', 'Ragdoll', 'M', 'Grey');
INSERT INTO Pet VALUES ('PET1015', 'Angie', 'British Shorthair', 'F', 'Black');
INSERT INTO Pet VALUES ('PET1016', 'Mac', 'Corgi', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET1017', 'Rodney', 'Bulldog', 'M', 'White');
INSERT INTO Pet VALUES ('PET1018', 'Kitty', 'Persian Cat', 'F', 'Golded');
INSERT INTO Pet VALUES ('PET1019', 'Dude', 'Dachshunds', 'M', 'Black');
INSERT INTO Pet VALUES ('PET1020', 'Luna', 'Ragdoll', 'M', 'White');

-- 20 records
SELECT COUNT(*) FROM Pet;