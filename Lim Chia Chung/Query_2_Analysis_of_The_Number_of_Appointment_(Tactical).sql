----------------------------------------- Query 2 -----------------------------------------------

-- Analysis Of The Number of Appointment(Tactical)

SET LINESIZE 120
SET PAGESIZE 140
CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTES
CLEAR BUFFER
TTITLE OFF

COLUMN 'Appointment Month' FORMAT A15;

TTITLE LEFT '       =====================================' SKIP 1 -
LEFT '       Analysis Of The Number of Appointment' SKIP 1 -
LEFT '       =====================================' SKIP 2 -

BREAK ON "Appointment Year"
SELECT   EXTRACT(YEAR FROM AppointmentDate) AS "Appointment Year",
         FUNC_CONVERT_MONTH_TO_NAME(EXTRACT(MONTH FROM AppointmentDate)) AS "Appointment Month",
         COUNT(AppointmentID) AS "No. of Appointment"
FROM     Appointment 
GROUP BY EXTRACT(YEAR FROM AppointmentDate), EXTRACT(MONTH FROM AppointmentDate)
ORDER BY EXTRACT(MONTH FROM AppointmentDate);
