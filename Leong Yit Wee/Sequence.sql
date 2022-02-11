-- Customer Sequence

DROP SEQUENCE CUSTOMER_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ
                INCREMENT BY 1
                START WITH 1102
                MAXVALUE 99999999
                NOCACHE
                NOCYCLE;

-- INSERT INTO Customer VALUES ('C'||CUSTOMER_SEQ.NEXTVAL, 'LCC', 'F', '011-2323232', 'lorrayne@gmail.com', TO_DATE('25-05-2000', 'DD-MM-YYYY'), 'C-2-8, Jalan Vista Mutiara 1, Tsi Business Park', 52000, 'Kepong Baru', 'Kuala Lumpur');
