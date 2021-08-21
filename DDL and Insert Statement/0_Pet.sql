DROP TABLE Pet;
CREATE TABLE Pet
(PetID    VARCHAR2(6)  NOT NULL,
 PetName  VARCHAR2(50) NOT NULL,
 PetType  VARCHAR2(50) NOT NULL,
 Sex      VARCHAR2(1)  NOT NULL,
 Color    VARCHAR2(15) NOT NULL,
PRIMARY KEY(PetID),
CONSTRAINT chk_pet_id CHECK (SUBSTR(PetID, 1, 3) = 'PET'),
CONSTRAINT chk_pet_sex CHECK (UPPER(Sex) IN ('M','F'))
);

INSERT INTO Pet VALUES ('PET001', 'Wong Choi', 'Rottweiler', 'M', 'Black');
INSERT INTO Pet VALUES ('PET002', 'Boonie', 'Beagle', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET003', 'Jacky', 'Corgi', 'M', 'Black');
INSERT INTO Pet VALUES ('PET004', 'Kingsley', 'Yorkshire Terrier', 'M', 'White');
INSERT INTO Pet VALUES ('PET005', 'Honey', 'Poodle', 'F', 'Black');
INSERT INTO Pet VALUES ('PET006', 'Darby', 'Corgi', 'M', 'Brown');
INSERT INTO Pet VALUES ('PET007', 'Daisy', 'Poodle', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET008', 'Harper', 'Dachshunds', 'M', 'Golded');
INSERT INTO Pet VALUES ('PET009', 'Jack', 'Rottweiler', 'F', 'Black');
INSERT INTO Pet VALUES ('PET010', 'Pearl', 'Bulldog', 'M', 'White');
INSERT INTO Pet VALUES ('PET011', 'Yvette', 'Persian Cat', 'M', 'White');
INSERT INTO Pet VALUES ('PET012', 'Quinn', 'Ragdoll', 'F', 'Black');
INSERT INTO Pet VALUES ('PET013', 'Bexley', 'Siberian Cat', 'M', 'Gold');
INSERT INTO Pet VALUES ('PET014', 'Mochi', 'Ragdoll', 'M', 'Grey');
INSERT INTO Pet VALUES ('PET015', 'Angie', 'British Shorthair', 'F', 'Black');
INSERT INTO Pet VALUES ('PET016', 'Mac', 'Corgi', 'F', 'Brown');
INSERT INTO Pet VALUES ('PET017', 'Rodney', 'Bulldog', 'M', 'White');
INSERT INTO Pet VALUES ('PET018', 'Kitty', 'Persian Cat', 'F', 'Golded');
INSERT INTO Pet VALUES ('PET019', 'Dude', 'Dachshunds', 'M', 'Black');
INSERT INTO Pet VALUES ('PET020', 'Luna', 'Ragdoll', 'M', 'White');

-- 20 records
SELECT COUNT(*) FROM Pet;