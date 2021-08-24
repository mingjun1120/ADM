----------------------------------------- Query 1 -----------------------------------------------

-- Customer Appointment Details Based On Month (Operational)
-- Purpose: The purpose of this query is to retrieve all the appointments made by customer based
-- on month. This query is helpful in operational level which allow staff to monitor the 
-- appointment by sorting the month.

SET LINESIZE 150
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

ACCEPT year DATE FORMAT 'YYYY'-
PROMPT 'Enter Year (YYYY): '

ACCEPT month DATE FORMAT 'MM'-
PROMPT 'Enter Month (MM): '

COLUMN AppointmentDate FORMAT A16      HEADING 'Appointment Date';
COLUMN AppointmentID   FORMAT A15      HEADING 'Appointment ID';
COLUMN CustomerID      FORMAT A10      HEADING 'Customer ID';
COLUMN CustomerName    FORMAT A18      HEADING 'Customer Name';
COLUMN ContactNo       FORMAT A11      HEADING 'Contact No.';
COLUMN PetID           FORMAT A7       HEADING 'Pet ID';
COLUMN PetName         FORMAT A10      HEADING 'Pet Name';
COLUMN ServiceID       FORMAT A10      HEADING 'Service ID';
COLUMN ServiceName     FORMAT A15      HEADING 'Service Name';
COLUMN ServiceCharge   FORMAT '990.90' HEADING 'Charge (RM)';

TTITLE CENTER '============================================================' SKIP 1 -
CENTER 'Customer Appointment Details Based On Month' SKIP 1 -
CENTER '============================================================' SKIP 2 -

SELECT   A.AppointmentDate, A.AppointmentID, A.CustomerID, C.CustomerName, C.ContactNo,
         A.PetID, P.PetName, A.ServiceID, S.ServiceName, S.ServiceCharge
FROM     Appointment A, Customer C, Services S, Pet P
WHERE    A.CustomerID = C.CustomerID AND
         A.PetID = P.PetID AND
         A.ServiceID = S.ServiceID AND
         TO_CHAR(AppointmentDate, 'YYYY') = '&year' AND
         TO_CHAR(AppointmentDate, 'MM') = '&month'
ORDER BY A.AppointmentID;

start D:\Text\ADM\Query1.sql

----------------------------------------- Query 2 -----------------------------------------------

-- Analysis Of The Number of Appointment(Tactical)
-- Purpose: The purpose of this query is to discover which month achieves the highest appointment
-- made by customer. This can be useful for tactical management where this allowed management
-- level to identify the peak and nadir of the number of appointment, whereby management can
-- make decision to impove the nadir month.

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

COLUMN 'Appointment Month' FORMAT A15;

TTITLE LEFT '=====================================' SKIP 1 -
LEFT 'Analysis Of The Number of Appointment' SKIP 1 -
LEFT '=====================================' SKIP 2 -

BREAK ON "Appointment Year"
SELECT   EXTRACT(YEAR FROM AppointmentDate) AS "Appointment Year",
         FUNC_CONVERT_MONTH_TO_NAME(EXTRACT(MONTH FROM AppointmentDate)) AS "Appointment Month",
         COUNT(AppointmentID) AS "No. of Appointment"
FROM     Appointment 
GROUP BY EXTRACT(YEAR FROM AppointmentDate), EXTRACT(MONTH FROM AppointmentDate)
ORDER BY EXTRACT(MONTH FROM AppointmentDate);

start D:\Text\ADM\Query2.sql

----------------------------------------- Query 3 -----------------------------------------------

-- Service Popularity Summary (Strategy)
-- Purpose: The purpose of this query is to determine the most popular services. This allows the
-- company to identify which service is help them to gain more customer flow and profit. In 
-- addition, it helps customer to put more effort in providing more services in the future and
-- improve the particular service.

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

COLUMN ServiceID     FORMAT A10 HEADING 'Service ID';
COLUMN ServiceName   FORMAT A15 HEADING 'Service Name';
COLUMN ServiceCharge FORMAT '990.90' HEADING 'Price Per Time (RM)';

TTITLE LEFT '==========================' SKIP 1 -
LEFT 'Service Popularity Summary' SKIP 1 -
LEFT '==========================' SKIP 2 -

SELECT   A.ServiceID, S.ServiceName, S.ServiceCharge, COUNT(A.AppointmentID) AS "Total Appointment"
FROM     Appointment A
JOIN     Services S
ON       A.ServiceID = S.ServiceID
GROUP BY A.ServiceID, S.ServiceName, S.ServiceCharge
ORDER BY 1;

start D:\Text\ADM\Query3.sql
