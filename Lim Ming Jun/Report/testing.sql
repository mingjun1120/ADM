/*
  References:
  https://community.oracle.com/tech/developers/discussion/1091621/format-number-to-two-decimal-places
  https://stackoverflow.com/questions/14702050/valid-date-checks-in-oracle
*/

CREATE OR REPLACE FUNCTION TEST_DATE(Date_Input VARCHAR2) RETURN VARCHAR2 IS
    V_DATE DATE;
BEGIN
    SELECT TO_DATE(Date_Input,'DD-MM-YYYY') INTO V_DATE FROM DUAL;
    RETURN 'VALID';
EXCEPTION 
    WHEN OTHERS THEN RETURN 'INVALID';
END;
/

CREATE OR REPLACE PROCEDURE prc_employee_trans_handled_report(startDate IN VARCHAR, endDate IN VARCHAR) AS

    CURSOR empTrans_cursor IS 
        SELECT T.Date_Paid, E.EmployeeName, E.EmployeeID, T.TransactionsID, J.JobScope, CUS.CustomerID, SUM(D.priceEach * D.quantity) AS TOTAL_AMOUNT
        FROM Transactions T, TransactionsDetails D, Customer CUS, Employee E, Job J
        WHERE T.TransactionsID = D.TransactionsID AND CUS.CustomerID = T.CustomerID AND T.EmployeeID = E.EmployeeID AND J.JobID = E.JobID 
              AND T.Date_Paid BETWEEN TO_DATE(startDate, 'DD-MM-YYYY') AND TO_DATE(endDate, 'DD-MM-YYYY')
        GROUP BY T.Date_Paid, E.EmployeeName, E.EmployeeID, T.TransactionsID, J.JobScope, CUS.CustomerID
        ORDER BY T.Date_Paid;
    
    INVALID_DATE_FORMAT EXCEPTION;
    e_invalid_input_year EXCEPTION;
    DATA_NO_FOUND EXCEPTION;
    invalid_endDate_bigger_startDate EXCEPTION;

    v_totalTransaction NUMBER := 0;
    v_totalTransAmt Employee.Salary%TYPE := 0;
    
BEGIN
    IF TEST_DATE(startDate) = 'INVALID' OR TEST_DATE(endDate) = 'INVALID' THEN
        RAISE INVALID_DATE_FORMAT;

    ELSIF EXTRACT(YEAR FROM TO_DATE(startDate, 'DD-MM-YYYY')) < 2018 THEN
        RAISE e_invalid_input_year;

    ELSIF TO_DATE(startDate, 'DD-MM-YYYY') > (SYSDATE - NUMTOYMINTERVAL(3, 'year')) THEN
        RAISE DATA_NO_FOUND;

    ELSIF TO_DATE(startDate, 'DD-MM-YYYY') > TO_DATE(endDate, 'DD-MM-YYYY') THEN
        RAISE invalid_endDate_bigger_startDate;

    END IF;

    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==============================================================', 80, ' '));
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('EMPLOYEE TRANSACTION DETAILS REPORT', 53, ' ') || ' (' || startDate || ' to ' || endDate || ')');
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('==============================================================', 80, ' ') || chr(10));

    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 17) || '-+');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('DATE', 15) || '| ' || RPAD('EMPLOYEE ID', 12) || '| ' || RPAD('EMPLOYEE NAME', 20) || '| ' || RPAD('TRANSACTION ID', 15) || '| ' || RPAD('CUSTOMER ID', 12) || '| ' || RPAD('TOTAL AMOUNT (RM)', 17) || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 17) || '-+');
    
    FOR empTrans_rec IN empTrans_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('|' || RPAD(empTrans_rec.Date_Paid, 15) || '| ' || 
                             RPAD(empTrans_rec.EmployeeID, 12) || '| ' ||
                             RPAD(empTrans_rec.EmployeeName, 20) || '| ' ||
                             RPAD(empTrans_rec.TransactionsID, 15) || '| ' ||
                             RPAD(empTrans_rec.CustomerID, 12) || '| ' ||
                             LPAD(TO_CHAR(empTrans_rec.TOTAL_AMOUNT, 'fm9999999.90'), 17) || ' |'
                            );
        v_totalTransaction := v_totalTransaction + 1;
        v_totalTransAmt := v_totalTransAmt + empTrans_rec.TOTAL_AMOUNT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '+-' || RPAD('--------------------', 12) || '+-' || RPAD('--------------------', 20) || '+-' || RPAD('--------------------', 15) || '+-' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 17) || '-+');
    DBMS_OUTPUT.PUT_LINE('|' || LPAD('TOTAL ' || ':', 82) || '| ' || LPAD(TO_CHAR(v_totalTransAmt, 'fm9999999.90'), 12) || '      |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('--------------------', 15) || '--' || RPAD('--------------------', 12) || '--' || RPAD('--------------------', 20) || '--' || RPAD('--------------------', 15) || '--' || RPAD('-----------------', 12) || '+-' || RPAD('-----------------', 17) || '-+');
    DBMS_OUTPUT.PUT_LINE('.' || LPAD('TOTAL NUMBER OF TRANSACTIONS HANDLED ' || ':', 82) || '         ' || RPAD(v_totalTransaction, 12));

EXCEPTION
    WHEN INVALID_DATE_FORMAT THEN
        DBMS_OUTPUT.PUT_LINE('Invalid input for the date! Start date and end date format are DD-MM-YYYY! (E.g. 01-01-2018)');
    
    WHEN e_invalid_input_year THEN
        DBMS_OUTPUT.PUT_LINE ('The year value must start from 2018!');
     
    WHEN DATA_NO_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No transactions were found within this timeframe!');

    WHEN invalid_endDate_bigger_startDate THEN
        DBMS_OUTPUT.PUT_LINE('End date must later than the start date!');
END;
/
EXEC prc_employee_trans_handled_report('dfava', '09-01-2017')
EXEC prc_employee_trans_handled_report('09-01-2015', '09-01-2018')
EXEC prc_employee_trans_handled_report('01-12-2018', '09-12-2018')
EXEC prc_employee_trans_handled_report('01-01-2018', '09-01-2017')
EXEC prc_employee_trans_handled_report('01-06-2018', '11-06-2018')