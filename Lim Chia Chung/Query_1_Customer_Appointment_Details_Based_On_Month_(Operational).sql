----------------------------------------- Query 1 -----------------------------------------------

-- Customer Appointment Details Based On Month (Operational)

SET LINESIZE 180
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

TTITLE LEFT '                              ============================================================' SKIP 1 -
LEFT '                                      Customer Appointment Details Based On Month' SKIP 1 -
LEFT '                              ============================================================' SKIP 2 -

SELECT   A.AppointmentDate, A.AppointmentID, A.CustomerID, C.CustomerName, C.ContactNo,
         A.PetID, P.PetName, A.ServiceID, S.ServiceName, S.ServiceCharge
FROM     Appointment A, Customer C, Services S, Pet P
WHERE    A.CustomerID = C.CustomerID AND
         A.PetID = P.PetID AND
         A.ServiceID = S.ServiceID AND
         TO_CHAR(AppointmentDate, 'YYYY') = '&year' AND
         TO_CHAR(AppointmentDate, 'MM') = '&month'
ORDER BY A.AppointmentID;
