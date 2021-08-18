DROP TABLE Appointment;
CREATE TABLE Appointment
(AppointmentID    VARCHAR2(6) NOT NULL,       
 CustomerID       VARCHAR2(5) NOT NULL,
 ServiceID        VARCHAR2(6) NOT NULL,
 PetID            VARCHAR2(6) NOT NULL,
 EmployeeID       VARCHAR2(5) NOT NULL,
 AppointmentDate  DATE,
 StartTime        TIMESTAMP,
 EndTime          TIMESTAMP,
 Duration         NUMBER(2) NOT NULL,
PRIMARY KEY(AppointmentID),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
FOREIGN KEY (PetID) REFERENCES Pet(PetID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
CONSTRAINT chk_appID CHECK (SUBSTR(AppointmentID, 0, 1) = 'A'),
CONSTRAINT chk_duration CHECK (Duration > 0 AND Duration <= 2)
);

ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

-- JAN 2018
INSERT INTO Appointment VALUES ('A10001', 'C1002', 'SER002', 'PET001', 'E001', TO_DATE('02-01-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10002', 'C1004', 'SER001', 'PET002', 'E001', TO_DATE('04-01-2018', 'DD-MM-YYYY'), '10:00', '11:00', 1);
INSERT INTO Appointment VALUES ('A10003', 'C1006', 'SER003', 'PET003', 'E001', TO_DATE('08-01-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10004', 'C1010', 'SER002', 'PET004', 'E001', TO_DATE('09-01-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10005', 'C1012', 'SER001', 'PET005', 'E001', TO_DATE('11-01-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10006', 'C1014', 'SER003', 'PET006', 'E001', TO_DATE('12-01-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10007', 'C1016', 'SER002', 'PET007', 'E001', TO_DATE('15-01-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10008', 'C1020', 'SER001', 'PET008', 'E001', TO_DATE('15-01-2018', 'DD-MM-YYYY'), '10:00', '11:00', 1);
INSERT INTO Appointment VALUES ('A10009', 'C1028', 'SER003', 'PET009', 'E002', TO_DATE('19-01-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10010', 'C1002', 'SER001', 'PET001', 'E002', TO_DATE('20-01-2018', 'DD-MM-YYYY'), '14:00', '16:00', 2);
INSERT INTO Appointment VALUES ('A10011', 'C1034', 'SER001', 'PET010', 'E001', TO_DATE('23-01-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10012', 'C1038', 'SER003', 'PET011', 'E002', TO_DATE('27-01-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);

-- FEB 2018
INSERT INTO Appointment VALUES ('A10013', 'C1040', 'SER002', 'PET012', 'E001', TO_DATE('03-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10014', 'C1006', 'SER002', 'PET003', 'E002', TO_DATE('07-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10015', 'C1042', 'SER001', 'PET013', 'E002', TO_DATE('08-02-2018', 'DD-MM-YYYY'), '13:00', '14:00', 1);
INSERT INTO Appointment VALUES ('A10016', 'C1044', 'SER002', 'PET014', 'E001', TO_DATE('09-02-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10017', 'C1050', 'SER001', 'PET015', 'E002', TO_DATE('13-02-2018', 'DD-MM-YYYY'), '14:00', '15:00', 1);
INSERT INTO Appointment VALUES ('A10018', 'C1056', 'SER003', 'PET016', 'E001', TO_DATE('14-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10019', 'C1058', 'SER002', 'PET017', 'E002', TO_DATE('20-02-2018', 'DD-MM-YYYY'), '14:00', '16:00', 2);
INSERT INTO Appointment VALUES ('A10020', 'C1060', 'SER002', 'PET018', 'E003', TO_DATE('20-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10021', 'C1066', 'SER001', 'PET019', 'E001', TO_DATE('22-02-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10022', 'C1002', 'SER003', 'PET001', 'E002', TO_DATE('24-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10023', 'C1004', 'SER003', 'PET002', 'E003', TO_DATE('25-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10024', 'C1070', 'SER001', 'PET020', 'E001', TO_DATE('26-02-2018', 'DD-MM-YYYY'), '10:00', '11:00', 1);
INSERT INTO Appointment VALUES ('A10025', 'C1006', 'SER003', 'PET003', 'E002', TO_DATE('27-02-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);

-- MAR 2018
INSERT INTO Appointment VALUES ('A10026', 'C1010', 'SER002', 'PET004', 'E003', TO_DATE('01-03-2018', 'DD-MM-YYYY'), '13:00', '15:00', 2);
INSERT INTO Appointment VALUES ('A10027', 'C1012', 'SER001', 'PET005', 'E001', TO_DATE('02-03-2018', 'DD-MM-YYYY'), '10:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10028', 'C1014', 'SER003', 'PET006', 'E002', TO_DATE('02-03-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10029', 'C1016', 'SER001', 'PET007', 'E003', TO_DATE('05-03-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10030', 'C1020', 'SER002', 'PET008', 'E001', TO_DATE('06-03-2018', 'DD-MM-YYYY'), '13:00', '15:00', 2);
INSERT INTO Appointment VALUES ('A10031', 'C1002', 'SER002', 'PET001', 'E002', TO_DATE('09-03-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10032', 'C1004', 'SER002', 'PET002', 'E003', TO_DATE('10-03-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10033', 'C1006', 'SER001', 'PET003', 'E001', TO_DATE('15-03-2018', 'DD-MM-YYYY'), '15:00', '16:00', 1);
INSERT INTO Appointment VALUES ('A10034', 'C1028', 'SER001', 'PET009', 'E002', TO_DATE('15-03-2018', 'DD-MM-YYYY'), '13:00', '14:00', 1);
INSERT INTO Appointment VALUES ('A10035', 'C1034', 'SER002', 'PET010', 'E003', TO_DATE('16-03-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10036', 'C1038', 'SER003', 'PET011', 'E001', TO_DATE('20-03-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10037', 'C1040', 'SER001', 'PET012', 'E002', TO_DATE('21-03-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10038', 'C1042', 'SER002', 'PET013', 'E003', TO_DATE('23-03-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10039', 'C1044', 'SER001', 'PET014', 'E001', TO_DATE('23-03-2018', 'DD-MM-YYYY'), '10:00', '11:00', 1);
INSERT INTO Appointment VALUES ('A10040', 'C1050', 'SER001', 'PET015', 'E002', TO_DATE('26-03-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);

-- APR 2018
INSERT INTO Appointment VALUES ('A10041', 'C1004', 'SER003', 'PET002', 'E003', TO_DATE('04-04-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10042', 'C1010', 'SER002', 'PET004', 'E001', TO_DATE('04-04-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10043', 'C1012', 'SER002', 'PET005', 'E002', TO_DATE('06-04-2018', 'DD-MM-YYYY'), '14:00', '16:00', 2);
INSERT INTO Appointment VALUES ('A10044', 'C1014', 'SER003', 'PET006', 'E003', TO_DATE('07-04-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10045', 'C1016', 'SER001', 'PET007', 'E001', TO_DATE('09-04-2018', 'DD-MM-YYYY'), '14:00', '15:00', 1);
INSERT INTO Appointment VALUES ('A10046', 'C1020', 'SER002', 'PET008', 'E002', TO_DATE('11-04-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10047', 'C1058', 'SER003', 'PET017', 'E003', TO_DATE('13-04-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10048', 'C1060', 'SER002', 'PET018', 'E001', TO_DATE('18-04-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10049', 'C1066', 'SER001', 'PET019', 'E002', TO_DATE('20-04-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10050', 'C1040', 'SER002', 'PET012', 'E003', TO_DATE('21-04-2018', 'DD-MM-YYYY'), '13:00', '15:00', 2);
INSERT INTO Appointment VALUES ('A10051', 'C1002', 'SER003', 'PET001', 'E001', TO_DATE('23-04-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10052', 'C1004', 'SER002', 'PET002', 'E002', TO_DATE('24-04-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10053', 'C1006', 'SER001', 'PET003', 'E003', TO_DATE('26-04-2018', 'DD-MM-YYYY'), '10:00', '11:00', 1);

-- MAY 2018
INSERT INTO Appointment VALUES ('A10054', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('01-05-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10055', 'C1012', 'SER003', 'PET005', 'E002', TO_DATE('02-05-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10056', 'C1042', 'SER003', 'PET013', 'E003', TO_DATE('04-05-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10057', 'C1070', 'SER003', 'PET020', 'E001', TO_DATE('09-05-2018', 'DD-MM-YYYY'), '14:00', '16:00', 2);
INSERT INTO Appointment VALUES ('A10058', 'C1014', 'SER003', 'PET006', 'E001', TO_DATE('14-05-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10059', 'C1016', 'SER003', 'PET007', 'E002', TO_DATE('15-05-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10060', 'C1016', 'SER002', 'PET007', 'E003', TO_DATE('18-05-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10061', 'C1020', 'SER002', 'PET008', 'E001', TO_DATE('21-05-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10062', 'C1028', 'SER001', 'PET009', 'E002', TO_DATE('22-05-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10063', 'C1056', 'SER001', 'PET016', 'E003', TO_DATE('24-05-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10064', 'C1056', 'SER002', 'PET016', 'E003', TO_DATE('24-05-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10065', 'C1058', 'SER003', 'PET017', 'E001', TO_DATE('30-05-2018', 'DD-MM-YYYY'), '14:00', '16:00', 2);

-- JUN 2018
INSERT INTO Appointment VALUES ('A10066', 'C1060', 'SER003', 'PET018', 'E002', TO_DATE('01-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10067', 'C1066', 'SER002', 'PET019', 'E003', TO_DATE('02-06-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10068', 'C1002', 'SER002', 'PET001', 'E001', TO_DATE('08-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10069', 'C1004', 'SER001', 'PET002', 'E002', TO_DATE('09-06-2018', 'DD-MM-YYYY'), '14:00', '15:00', 1);
INSERT INTO Appointment VALUES ('A10070', 'C1070', 'SER002', 'PET020', 'E003', TO_DATE('11-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10071', 'C1034', 'SER001', 'PET010', 'E001', TO_DATE('11-06-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10072', 'C1038', 'SER001', 'PET011', 'E002', TO_DATE('12-06-2018', 'DD-MM-YYYY'), '11:00', '12:00', 1);
INSERT INTO Appointment VALUES ('A10073', 'C1040', 'SER002', 'PET012', 'E003', TO_DATE('15-06-2018', 'DD-MM-YYYY'), '12:00', '14:00', 2);
INSERT INTO Appointment VALUES ('A10074', 'C1042', 'SER003', 'PET013', 'E001', TO_DATE('18-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10075', 'C1044', 'SER002', 'PET014', 'E002', TO_DATE('21-06-2018', 'DD-MM-YYYY'), '11:00', '13:00', 2);
INSERT INTO Appointment VALUES ('A10076', 'C1050', 'SER002', 'PET015', 'E003', TO_DATE('22-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10077', 'C1002', 'SER003', 'PET001', 'E001', TO_DATE('25-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10078', 'C1004', 'SER001', 'PET002', 'E002', TO_DATE('27-06-2018', 'DD-MM-YYYY'), '12:00', '13:00', 1);
INSERT INTO Appointment VALUES ('A10079', 'C1006', 'SER002', 'PET003', 'E003', TO_DATE('29-06-2018', 'DD-MM-YYYY'), '10:00', '12:00', 2);
INSERT INTO Appointment VALUES ('A10080', 'C1010', 'SER001', 'PET004', 'E001', TO_DATE('30-06-2018', 'DD-MM-YYYY'), '13:00', '14:00', 1);


-- 80 records
SELECT COUNT(*) FROM Appointment;