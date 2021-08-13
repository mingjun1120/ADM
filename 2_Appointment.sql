DROP TABLE Appointment;
CREATE TABLE Appointment
(AppointmentID    NUMBER(6) NOT NULL,       
 CustomerID       NUMBER(6) NOT NULL,
 ServiceID        NUMBER(6) NOT NULL,
 PetID            NUMBER(6) NOT NULL,
 EmployeeID       NUMBER(6) NOT NULL,
 AppointmentDate  DATE
 StartTime        TIMESTAMP,
 EndTime          TIMESTAMP,
 Duration         NUMBER(2) NOT NULL,
PRIMARY KEY(AppointmentID),
FOREIGN KEY CustomerID references Customer(CustomerID),
FOREIGN KEY ServiceID references Services(ServiceID),
FOREIGN KEY PetID references Pet(PetID),
FOREIGN KEY EmployeeID references Employee(EmployeeID),
CONSTRAINT chk_duration CHECK (Duration > 0 AND Duration <= 2)
);