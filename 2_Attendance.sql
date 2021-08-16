DROP TABLE Attendance;
CREATE TABLE Attendance
(AttendanceDate    DATE         NOT NULL,
 EmployeeID       vARCHAR2(5)  NOT NULL,
 Check_In_Time     TIMESTAMP,
 Check_Out_Time    TIMESTAMP,
 Remarks          vARCHAR2(20)
 CONSTRAINT Attendance_PK PRIMARY KEY(AttendanceDate, EmployeeID),
 CONSTRAINT Attendance_FK FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
 CONSTRAINT chk_Remarks CHECK (UPPER(Remarks) IN ('PRESENT','ABSENT', 'PRESENT LATE', 'PRESENT & WORK OVERTIME'))
);

-- ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';
ALTER SESSION SET NLS_DATE_FORMAT='DD-MM-YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';


/* PET SHOP BUSINESS HOURS:  10:00AM - 7:00PM */ 

/*---------------------------------------------------------------------------- 1ST MONTH (JAN 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance VALUES (TO_DATE('01-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 1
INSERT INTO Attendance VALUES (TO_DATE('01-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-01-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-01-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-01-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-01-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('08-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 2
INSERT INTO Attendance VALUES (TO_DATE('08-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-01-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-01-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-01-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-01-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('15-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance VALUES (TO_DATE('15-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-01-2018', 'DD-MM-YYYY'), 'E001', '10:10', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('17-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-01-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-01-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-01-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-01-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-01-2018', 'DD-MM-YYYY'), 'E006', '10:10', '19:00', 'Present Late');

INSERT INTO Attendance VALUES (TO_DATE('22-01-2018', 'DD-MM-YYYY'), 'E001', '10:10', '19:00', 'Present Late'); -- WEEK 4
INSERT INTO Attendance VALUES (TO_DATE('22-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-01-2018', 'DD-MM-YYYY'), 'E004', '10:15', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('24-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-01-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-01-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-01-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-01-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('29-01-2018', 'DD-MM-YYYY'), 'E001', '9:56', '19:00', 'Present'); 
INSERT INTO Attendance VALUES (TO_DATE('29-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-01-2018', 'DD-MM-YYYY'), 'E001', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('30-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:30', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('30-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-01-2018', 'DD-MM-YYYY'), 'E001', '10:10', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('31-01-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-01-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');





/*---------------------------------------------------------------------------- 2ND MONTH (FEB 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance VALUES (TO_DATE('01-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');  -- WEEK 1
INSERT INTO Attendance VALUES (TO_DATE('01-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-02-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-02-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-02-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:40', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('02-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-02-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-02-2018', 'DD-MM-YYYY'), 'E006', '10:13', '19:00', 'Present Late');

INSERT INTO Attendance VALUES (TO_DATE('05-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '20:00', 'Present & Work Overtime'); -- WEEK 2
INSERT INTO Attendance VALUES (TO_DATE('05-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-02-2018', 'DD-MM-YYYY'), 'E004', '10:20', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('06-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('07-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-02-2018', 'DD-MM-YYYY'), 'E004', '', '', 'Absent');
INSERT INTO Attendance VALUES (TO_DATE('08-02-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-02-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-02-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-02-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('12-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance VALUES (TO_DATE('12-02-2018', 'DD-MM-YYYY'), 'E004', '10:12', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('12-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('15-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-02-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-02-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-02-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('17-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-02-2018', 'DD-MM-YYYY'), 'E004', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('19-02-2018', 'DD-MM-YYYY'), 'E001', '9:57', '19:00', 'Present'); -- WEEK 4
INSERT INTO Attendance VALUES (TO_DATE('19-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-02-2018', 'DD-MM-YYYY'), 'E004', '9:50', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:35', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('22-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:45', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('22-02-2018', 'DD-MM-YYYY'), 'E006', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-02-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-02-2018', 'DD-MM-YYYY'), 'E004', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-02-2018', 'DD-MM-YYYY'), 'E004', '', '', 'Absent');
INSERT INTO Attendance VALUES (TO_DATE('24-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('26-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-02-2018', 'DD-MM-YYYY'), 'E006', '9:51', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-02-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-02-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-02-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');





/*---------------------------------------------------------------------------- 3rd MONTH (MAR 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 1
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E002', '9:46', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E005', '9:50', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('01-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 2
INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E005', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('08-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E005', '10:30', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('15-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E002', '10:13', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E001', '', '', 'ABSENT');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '20:00', 'Present & Work Overtime');

INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present'); -- WEEK 4
INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E005', '', '', 'Absent');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('22-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-03-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('29-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-03-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('31-03-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');





/*---------------------------------------------------------------------------- 4th MONTH (APR 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');  -- WEEK 1
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('02-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('03-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('04-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E002', '10:15', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('05-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('06-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('07-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 2
INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('09-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('10-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E006', '10:15', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('11-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('12-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('13-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('14-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('16-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('17-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('18-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('19-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:36', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('20-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('21-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 4
INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('23-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('24-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E004', '9:49', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('25-04-2018', 'DD-MM-YYYY'), 'E007', '9:59', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('26-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('27-04-2018', 'DD-MM-YYYY'), 'E007', '9:55', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E005', '10:30', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E006', '9:53', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('28-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');

INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:35', 'Present & Work Overtime');
INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E006', '10:16', '19:00', 'Present Late');
INSERT INTO Attendance VALUES (TO_DATE('30-04-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');





/*---------------------------------------------------------------------------- 5th MONTH (MAY 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); --WEEK 1
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('03-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E002', '10:10', '19:00', 'Present Late');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-05-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-05-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 2
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E006', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-05-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E003', '9:55', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('10-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-05-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E006', '9:58', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-05-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('17-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-05-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E006', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E003', '10:15', '19:00', 'Present Late');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('24-05-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-05-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-05-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E006', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('31-05-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');





/*---------------------------------------------------------------------------- 6th MONTH (JUNE 2018) -----------------------------------------------------------------*/
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 1
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('01-06-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '20:00', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('02-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 2
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('04-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('05-06-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('06-06-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('07-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E006', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('08-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('09-06-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 3
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('11-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('12-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('13-06-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('14-06-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E006', '10:30', '19:00', 'Present Late');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('15-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E006', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E007', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('16-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present'); -- WEEK 4
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:35', 'Present & Work Overtime');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('18-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('19-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('20-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('21-06-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('22-06-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E003', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('23-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');

INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E002', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('25-06-2018', 'DD-MM-YYYY'), 'E008', '9:59', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('26-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E003', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E004', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E005', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E007', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('27-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E002', '10:30', '19:00', 'Present Late');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E003', '9:49', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('28-06-2018', 'DD-MM-YYYY'), 'E008', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E001', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E002', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E005', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('29-06-2018', 'DD-MM-YYYY'), 'E008', '9:55', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E001', '9:58', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E002', '9:56', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E003', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E004', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E005', '9:53', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E006', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E007', '10:00', '19:00', 'Present');
INSERT INTO Attendance values (TO_DATE('30-06-2018', 'DD-MM-YYYY'), 'E008', '9:49', '19:00', 'Present');


- 5 records
SELECT COUNT(*) FROM Attendance;




-- References
-- https://www.techonthenet.com/oracle/check.php
-- https://www.techonthenet.com/oracle/foreign_keys/foreign_keys.
-- https://www.oracletutorial.com/oracle-basics/oracle-primary-key/
-- https://www.oracletutorial.com/oracle-basics/oracle-foreign-key/
-- https://www.w3schools.com/sql/sql_foreignkey.asp