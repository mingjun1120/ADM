DROP TABLE Services;
CREATE TABLE Services
(ServiceID     VARCHAR(5)  NOT NULL,
 ServiceName   VARCHAR(50) NOT NULL,
 ServiceCharge NUMBER(7,2) NOT NULL,
PRIMARY KEY(ServiceID),
CONSTRAINT chk_service_id CHECK (SUBSTR(ServiceID, 1, 3) = 'SER'),
CONSTRAINT CHK_service_charge CHECK (ServiceCharge > 0)
);

INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER01', 'Dental Scaling', 50.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER02', 'Grooming', 60.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER03', 'Pet Boarding', 45.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER04', 'Pet Hotel', 10.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER05', 'SPA', 350.00);


-- 5 records
SELECT COUNT(*) FROM Services;