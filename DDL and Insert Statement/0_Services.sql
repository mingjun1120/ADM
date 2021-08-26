DROP TABLE Services;
CREATE TABLE Services
(ServiceID     VARCHAR(6)  NOT NULL,
 ServiceName   VARCHAR(50) NOT NULL,
 ServiceCharge NUMBER(7,2) NOT NULL,
PRIMARY KEY(ServiceID),
CONSTRAINT chk_service_id CHECK (SUBSTR(ServiceID, 1, 3) = 'SER'),
CONSTRAINT CHK_service_charge CHECK (ServiceCharge > 0)
);

INSERT INTO Services VALUES ('SER001', 'Dental Scaling', 266.00);
INSERT INTO Services VALUES ('SER002', 'Grooming', 120.00);
INSERT INTO Services VALUES ('SER003', 'SPA', 149.00);

-- 3 records
SELECT COUNT(*) FROM Services;