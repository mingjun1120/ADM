----------------------------------------- Query 3 -----------------------------------------------

-- Service Popularity Summary (Strategy)

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

TTITLE LEFT '                  ==========================' SKIP 1 -
LEFT '                  Service Popularity Summary' SKIP 1 -
LEFT '                  ==========================' SKIP 2 -

SELECT   A.ServiceID, S.ServiceName, S.ServiceCharge, COUNT(A.AppointmentID) AS "Total Appointment"
FROM     Appointment A
JOIN     Services S
ON       A.ServiceID = S.ServiceID
GROUP BY A.ServiceID, S.ServiceName, S.ServiceCharge
ORDER BY 1;
