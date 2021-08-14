DROP TABLE Services;
CREATE TABLE Services
(ServiceID     VARCHAR(6)  NOT NULL,
 ServiceName   VARCHAR(50) NOT NULL,
 ServiceCharge NUMBER(7,2) NOT NULL,
PRIMARY KEY(ServiceID),
CONSTRAINT chk_service_id CHECK (SUBSTR(ServiceID, 1, 3) = 'SER'),
CONSTRAINT CHK_service_charge CHECK (ServiceCharge > 0)
);

INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER001', 'Dental Scaling', 50.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER002', 'Grooming', 60.00);
INSERT INTO Services (ServiceID, ServiceName, ServiceCharge) VALUES ('SER003', 'SPA', 150.00);

-- 3 records
SELECT COUNT(*) FROM Services;