DROP TABLE Customer;
CREATE TABLE Customer
(CustomerID     VARCHAR2(5)   NOT NULL,
 CustomerName   VARCHAR2(50)  NOT NULL,
 Gender         VARCHAR2(1)   NOT NULL,
 ContactNo      VARCHAR2(15)  NOT NULL,
 Email          VARCHAR2(50)  NOT NULL,
 DOB            DATE,
 StreetName     VARCHAR2(100) NOT NULL,
 PostCode       NUMBER(7)     NOT NULL,
 City           VARCHAR2(30)  NOT NULL,
 states         VARCHAR2(30)  NOT NULL,
 PRIMARY KEY (CustomerID),
 CONSTRAINT chk_cust_id CHECK (SUBSTR(CustomerID, 0, 1) = 'C'),
 CONSTRAINT chk_ContactNo UNIQUE (ContactNo),
 CONSTRAINT chk_cust_gender CHECK (UPPER(Gender) IN ('M','F')),
 CONSTRAINT chk_email CHECK (REGEXP_LIKE(email,'^[a-zA-Z]\w+@(\S+)$'))
);

INSERT INTO Customer VALUES ('C1001', 'Milly Harrision', 'F', '013-8780611', 'milly@gmail.com', TO_DATE('08-05-1994', 'DD-MM-YYYY'), 'G-3A RESIDENSI UNGGUL KEPONG, Jalan Vista Mutiara 1', 52000, 'Kepong Baru', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1002', 'Kalindi Rogers', 'F', '019-5450750', 'kalindi@gmail.com', TO_DATE('18-02-1984', 'DD-MM-YYYY'), 'Lot 1464, Jalan Delima 1/1, Subang Hi-tech Industrial Park', 40000, 'Subang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1003', 'Judah Patinnson', 'M', '016-3369481', 'judah@gmail.com', TO_DATE('08-12-1964', 'DD-MM-YYYY'), 'PT 120, Jalan Ampang Hilir, Taman U Thant', 55000, 'Ampang', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1004', 'Archy Krule', 'M', '014-6902511', 'archy@gmail.com', TO_DATE('28-01-1994', 'DD-MM-YYYY'), 'A-2020, Jalan PJU 3/27, Sunway Damansara', 47810, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1005', 'Noby Stark', 'M', '013-8312174', 'noby@gmail.com', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'A-21-4 PV13 Condo, Jalan Danau Saujana 1', 53300, 'Setapak', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1006', 'Byrle Stone', 'M', '014-2941876', 'byrle@gmail.com', TO_DATE('11-12-1998', 'DD-MM-YYYY'), 'A-3A01, Jalan PJU 3/27, Sunway Damansara', 47810, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1007', 'Tedra Stan', 'F', '018-2430762', 'tedra@gmail.com', TO_DATE('08-02-1999', 'DD-MM-YYYY'), 'E-3A Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1008', 'Rafaela Downey', 'F', '012-9511081', 'rafaela@gmail.com', TO_DATE('18-01-2000', 'DD-MM-YYYY'), 'D-21/11 Epic Residence, Jln BP 7/12, Bandar Bukit Puchong 2', 47120, 'Puchong', 'Selangor');
INSERT INTO Customer VALUES ('C1009', 'Tansy Carlos', 'F', '017-4049014', 'tansy@gmail.com', TO_DATE('08-07-1994', 'DD-MM-YYYY'), 'B-31 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1010', 'Arman Pier', 'M', '018-9126750', 'arman@gmail.com', TO_DATE('18-12-2004', 'DD-MM-YYYY'), 'BlockA-033 Putra One Residence, Persiaran Bukit Rahman Putra 1', 47000, 'Sungai Buloh', 'Selangor');
INSERT INTO Customer VALUES ('C1011', 'Heywood Johanson', 'M', '011-2714249', 'heywood@gmail.com', TO_DATE('08-12-1991', 'DD-MM-YYYY'), 'D-33-01 One Jelatek Condo, Jalan Jelatek', 54200 , 'Jelatek', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1012', 'Jerrold Fury', 'M', '015-6794318', 'jerrold@gmail.com', TO_DATE('04-12-1971', 'DD-MM-YYYY'), 'E-3A, Green Residence, Jalan Sayang 1', 43200, 'Cheras', 'Selangor');
INSERT INTO Customer VALUES ('C1013', 'Theodore Carter', 'M', '018-6878938', 'theodore@gmail.com', TO_DATE('07-12-1954', 'DD-MM-YYYY'), 'Lot 1469 Menara Sri Jati, Jalan 30/56, Taman Setiawangsa', 54200, 'Setiawangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1014', 'Thorpe Olsen', 'M', '011-9844343', 'thorpe@gmail.com', TO_DATE('01-02-1958', 'DD-MM-YYYY'), '18A-05 Ampang Damai Condominium, Jalan Wawasan 3', 68000, 'Ampang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1015', 'Ivette Fred', 'F', '016-3947772', 'ivette@gmail.com', TO_DATE('08-05-1971', 'DD-MM-YYYY'), 'PT 3434, Seri Titiwangsa, Lorong Titiwangsa 1', 53200, 'Titiwangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1016', 'Casar Barnes', 'M', '019-2588895', 'casar@gmail.com', TO_DATE('06-11-1962', 'DD-MM-YYYY'), 'A-33-14 MH Platinum Residence, Jalan Gombak', 53100, 'Gombak', 'Selangor');
INSERT INTO Customer VALUES ('C1017', 'Sigismundo Lord', 'M', '018-8424071', 'sigismundo@gmail.com', TO_DATE('25-12-2001', 'DD-MM-YYYY'), 'Lot 235, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1018', 'Kat Quil', 'F', '015-6866156', 'kat@gmail.com', TO_DATE('24-03-1994', 'DD-MM-YYYY'), 'Lot 111, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1019', 'Tersina Debicki', 'F', '016-4465107', 'tersina@gmail.com', TO_DATE('12-06-2010', 'DD-MM-YYYY'), 'A-20/11 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1020', 'Brunhilda Holmes', 'F', '019-3485500', 'brunhilda@gmail.com', TO_DATE('31-05-1999', 'DD-MM-YYYY'), 'A-03/13A Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1021', 'Patrica Jones', 'F', '013-3237059', 'patrica@gmail.com', TO_DATE('08-07-1993', 'DD-MM-YYYY'), 'G-21 RESIDENSI UNGGUL KEPONG, Jalan Vista Mutiara 1,', 52000, 'Kepong Baru', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1022', 'Blythe Johnson', 'F', '015-6497485', 'blythe@gmail.com', TO_DATE('12-06-1991', 'DD-MM-YYYY'), 'Block E, No.482, Jalan SS 15/6, Ss 15', 47500, 'Subang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1023', 'Matt Washington', 'M', '019-7515960', 'matt@gmail.com', TO_DATE('30-05-1993', 'DD-MM-YYYY'), 'PT 440, Jalan Ampang Hilir, Taman U Thant', 55000, 'Ampang', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1024', 'Selig Howard', 'M', '012-8954544', 'selig@gmail.com', TO_DATE('24-04-2003', 'DD-MM-YYYY'), 'A-1801, Jalan PJU 3/27, Sunway Damansara', 47810, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1025', 'Annora Holland', 'F', '012-9038830', 'annora@gmail.com', TO_DATE('08-08-2005', 'DD-MM-YYYY'), 'A-18-4 PV13 Condo, Jalan Danau Saujana 1', 53300, 'Setapak', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1026', 'Kirstin Hiddleston', 'F', '012-7016166', 'kirstin@gmail.com', TO_DATE('08-09-2001', 'DD-MM-YYYY'), 'B-13/02 Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1027', 'Lanie Portman', 'M', '011-2765349', 'lanie@gmail.com', TO_DATE('08-12-2001', 'DD-MM-YYYY'), 'G-18 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1028', 'Elladine Kirby', 'F', '015-1933831', 'elladine@gmail.com', TO_DATE('28-07-2003', 'DD-MM-YYYY'), 'B-11/11 Epic Residence, Jln BP 7/12, Bandar Bukit Puchong 2', 47120, 'Puchong', 'Selangor');
INSERT INTO Customer VALUES ('C1029', 'Dore Hemsworth', 'F', '011-2295793', 'dore@gmail.com', TO_DATE('02-12-2001', 'DD-MM-YYYY'), 'A-13A Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1030', 'Konrad Stark', 'M', '014-6707411', 'konrad@gmail.com', TO_DATE('08-11-2008', 'DD-MM-YYYY'), 'BlockA-122 Putra One Residence, Persiaran Bukit Rahman Putra 1', 47000, 'Sungai Buloh', 'Selangor');
INSERT INTO Customer VALUES ('C1031', 'Elisa Dennings', 'F', '017-7776012', 'elisa@gmail.com', TO_DATE('25-05-2000', 'DD-MM-YYYY'), 'A-35-22 One Jelatek Condo, Jalan Jelatek', 54200, 'Jelatek', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1032', 'Eachelle Russo', 'F', '017-8138479', 'eachelle@gmail.com', TO_DATE('30-11-2000', 'DD-MM-YYYY'), 'F-26, Green Residence, Jalan Sayang 1', 43200, 'Cheras', 'Selangor');
INSERT INTO Customer VALUES ('C1033', 'Mandel Elba', 'M', '019-5032124', 'mandel@gmail.com', TO_DATE('08-02-2000', 'DD-MM-YYYY'), 'Lot 1759 Menara Sri Jati, Jalan 30/56, Taman Setiawangsa', 54200, 'Setiawangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1034', 'Basilius Alexander', 'M', '019-7895658', 'basilius@gmail.com', TO_DATE('10-11-2000', 'DD-MM-YYYY'), '13B-15 Ampang Damai Condominium, Jalan Wawasan 3', 68000, 'Ampang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1035', 'Aubry Waititi', 'F', '018-1749904', 'aubry@gmail.com', TO_DATE('21-07-2006', 'DD-MM-YYYY'), 'PT 5544, Seri Titiwangsa, Lorong Titiwangsa 1', 53200, 'Titiwangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1036', 'Milicent Thompson', 'F', '017-7553024', 'milicent@gmail.com', TO_DATE('14-04-2000', 'DD-MM-YYYY'), 'A-03-11 MH Platinum Residence, Jalan Gombak', 53100, 'Gombak', 'Selangor');
INSERT INTO Customer VALUES ('C1037', 'Frederico Ruffalo', 'M', '015-6487811', 'frederico@gmail.com', TO_DATE('14-07-1995', 'DD-MM-YYYY'), 'Lot 234, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1038', 'Bartholemy Urban', 'M', '014-2357815', 'bartholemy@gmail.com', TO_DATE('23-02-2000', 'DD-MM-YYYY'), 'Lot 345, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1039', 'Cobb Batal', 'M', '011-7233367', 'cobb@gmail.com', TO_DATE('20-01-1961', 'DD-MM-YYYY'), 'B-20/01 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1040', 'Dickie Feigi', 'M', '014-2327326', 'dickie@gmail.com', TO_DATE('29-08-1965', 'DD-MM-YYYY'), 'E-17/23A Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1041', 'Delinda Stone', 'F', '019-3952452', 'delinda@gmail.com', TO_DATE('19-06-1995', 'DD-MM-YYYY'), 'G-8 RESIDENSI UNGGUL KEPONG, Jalan Vista Mutiara 1,', 52000, 'Kepong Baru', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1042', 'Ebony Darby', 'F', '017-2718893', 'ebony@gmail.com', TO_DATE('03-10-1996', 'DD-MM-YYYY'), 'Lot 1123, Jalan Delima 1/1, Subang Hi-tech Industrial Park', 40000, 'Subang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1043', 'Marshal', 'M', '015-6841896', 'marshal@gmail.com', TO_DATE('20-05-2000', 'DD-MM-YYYY'), 'PT 85, Jalan Ampang Hilir, Taman U Thant', 55000, 'Ampang', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1044', 'Chev Watson', 'M', '018-3328080', 'chev@gmail.com', TO_DATE('19-05-2000', 'DD-MM-YYYY'), 'A-1508, Jalan PJU 3/27, Sunway Damansara', 47810, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1045', 'Jerrome Holland', 'M', '012-3976414', 'jerrome@gmail.com', TO_DATE('08-02-2002', 'DD-MM-YYYY'), 'B-21-18 PV13 Condo, Jalan Danau Saujana 1', 53300, 'Setapak', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1046', 'Eugen Wick', 'M', '014-8924858', 'eugen@gmail.com', TO_DATE('11-11-2002', 'DD-MM-YYYY'), 'B-3A/21, Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1047', 'Adora Kingsley', 'F', '016-6157800', 'adora@gmail.com', TO_DATE('12-12-2001', 'DD-MM-YYYY'), 'C-20 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1048', 'Jenine Donald', 'F', '013-5106832', 'jenine@gmail.com', TO_DATE('08-05-1993', 'DD-MM-YYYY'), 'A-03/22 Epic Residence, Jln BP 7/12, Bandar Bukit Puchong 2', 47120, 'Puchong', 'Selangor');
INSERT INTO Customer VALUES ('C1049', 'Caesar Pier', 'M', '014-5189459', 'caesar@gmail.com', TO_DATE('28-11-1994', 'DD-MM-YYYY'), 'F-11 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1050', 'Abdul Larson', 'M', '018-9578736', 'abdul@gmail.com', TO_DATE('08-03-1995', 'DD-MM-YYYY'), 'BlockB-078 Putra One Residence, Persiaran Bukit Rahman Putra 1', 47000, 'Sungai Buloh', 'Selangor');
INSERT INTO Customer VALUES ('C1051', 'Andrus Johanson', 'M', '015-4336744', 'andrus@gmail.com', TO_DATE('25-12-1996', 'DD-MM-YYYY'), 'C-13-21 One Jelatek Condo, Jalan Jelatek', 54200, 'Jelatek', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1052', 'Devin Howard', 'F', '013-8847334', 'devin@gmail.com', TO_DATE('13-11-1994', 'DD-MM-YYYY'), 'B-13A, Green Residence, Jalan Sayang 1', 43200, 'Cheras', 'Selangor');
INSERT INTO Customer VALUES ('C1053', 'Gareth Junior', 'M', '015-1082902', 'gareth@gmail.com', TO_DATE('08-03-1999', 'DD-MM-YYYY'), 'Lot 1111 Menara Sri Jati, Jalan 30/56, Taman Setiawangsa', 54200, 'Setiawangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1054', 'Cosetta Hall', 'F', '013-1250317', 'cosetta@gmail.com', TO_DATE('17-02-2001', 'DD-MM-YYYY'), '24A-10 Ampang Damai Condominium, Jalan Wawasan 3', 68000, 'Ampang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1055', 'Justinian Bettany', 'M', '014-4000253', 'justinian@gmail.com', TO_DATE('19-02-1994', 'DD-MM-YYYY'), 'PT 3579, Seri Titiwangsa, Lorong Titiwangsa 1', 53200, 'Titiwangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1056', 'Natividad Donald', 'F', '019-4420505', 'natividad@gmail.com', TO_DATE('14-12-1996', 'DD-MM-YYYY'), 'B-20-14 MH Platinum Residence, Jalan Gombak', 53100, 'Gombak', 'Selangor');
INSERT INTO Customer VALUES ('C1057', 'Pace Ben', 'M', '014-2726488', 'pace@gmail.com', TO_DATE('15-09-1984', 'DD-MM-YYYY'), 'Lot 456, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1058', 'Lefty Kidman', 'M', '013-3306626', 'lefty@gmail.com', TO_DATE('12-10-1999', 'DD-MM-YYYY'), 'Lot 630, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1059', 'Tore Larson', 'M', '015-2825892', 'tore@gmail.com', TO_DATE('18-11-1964', 'DD-MM-YYYY'), 'B-23/05 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1060', 'Rhodie Johanson', 'F', '014-2701915', 'rhodie@gmail.com', TO_DATE('12-02-1994', 'DD-MM-YYYY'), 'A-15/29 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1061', 'Jody Dickey', 'F', '012-9515666', 'jody@gmail.com', TO_DATE('15-02-1994', 'DD-MM-YYYY'), 'A-28 RESIDENSI UNGGUL KEPONG, Jalan Vista Mutiara 1,', 52000, 'Kepong Baru', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1062', 'Loren Alexander', 'F', '019-2502368', 'loren@gmail.com', TO_DATE('16-11-2009', 'DD-MM-YYYY'), 'Lot 8888, Jalan Delima 1/1, Subang Hi-tech Industrial Park', 40000, 'Subang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1063', 'Susette Cumberbatch', 'F', '014-6829471', 'susette@gmail.com', TO_DATE('21-07-2006', 'DD-MM-YYYY'), 'A-15-9, Jalan Kelab Ukay 2, Taman Kelab Ukay', 68000, 'Ampang', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1064', 'Eirena Sweeden', 'F', '011-7797683', 'eirena@gmail.com', TO_DATE('21-07-2001', 'DD-MM-YYYY'), 'A-21/3A, Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1065', 'Paxton Boseman', 'M', '017-6355678', 'paxton@gmail.com', TO_DATE('27-02-2003', 'DD-MM-YYYY'), 'B-18-20 PV13 Condo, Jalan Danau Saujana 1', 53300, 'Setapak', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1066', 'Pia Jordon', 'F', '016-6612386', 'pia@gmail.com', TO_DATE('08-04-1982', 'DD-MM-YYYY'), 'D-14/08, Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1067', 'Dacy Walker', 'F', '014-3478197', 'dacy@gmail.com', TO_DATE('16-02-1994', 'DD-MM-YYYY'), 'B-23 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1068', 'Olin Stark', 'M', '013-3474377', 'olin@gmail.com', TO_DATE('12-05-2001', 'DD-MM-YYYY'), 'A-18/21 Epic Residence, Jln BP 7/12, Bandar Bukit Puchong 2', 47120, 'Puchong', 'Selangor');
INSERT INTO Customer VALUES ('C1069', 'Ileane Barnes', 'F', '015-1393678', 'ileane@gmail.com', TO_DATE('08-02-2000', 'DD-MM-YYYY'), 'A-19/08 Seri Riana Residence, Jalan Wangsa Delima 7', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1070', 'Ozzie Wilson', 'M', '015-1719860', 'ozzie@gmail.com', TO_DATE('09-11-2001', 'DD-MM-YYYY'), 'BlockC-053 Putra One Residence, Persiaran Bukit Rahman Putra 1', 47000, 'Sungai Buloh', 'Selangor');
INSERT INTO Customer VALUES ('C1071', 'Ker Valentina', 'M', '017-7549624', 'ker@gmail.com', TO_DATE('19-02-2001', 'DD-MM-YYYY'), 'A-18-14 One Jelatek Condo, Jalan Jelatek', 54200, 'Jelatek', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1072', 'Margalit Yondu', 'F', '011-7158336', 'margalit@gmail.com', TO_DATE('08-08-2000', 'DD-MM-YYYY'), 'C-17, Green Residence, Jalan Sayang 1', 43200, 'Cheras', 'Selangor');
INSERT INTO Customer VALUES ('C1073', 'Arabella Chela', 'F', '014-3999186', 'arabella@gmail.com', TO_DATE('12-02-1994', 'DD-MM-YYYY'), 'Lot 1466 Menara Sri Jati, Jalan 30/56, Taman Setiawangsa', 54200, 'Setiawangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1074', 'Ernie Stans', 'M', '013-3024468', 'ernie@gmail.com', TO_DATE('07-08-1987', 'DD-MM-YYYY'), '21C-41 Ampang Damai Condominium, Jalan Wawasan 3', 68000, 'Ampang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1075', 'Rhoda Evans', 'F', '015-6086948', 'rhoda@gmail.com', TO_DATE('13-09-2000', 'DD-MM-YYYY'), 'PT 2981, Seri Titiwangsa, Lorong Titiwangsa 1', 53200, 'Titiwangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1076', 'Ravi Grillo', 'M', '011-9525769', 'ravi@gmail.com', TO_DATE('16-07-2000', 'DD-MM-YYYY'), 'A-18-11 MH Platinum Residence, Jalan Gombak', 53100, 'Gombak', 'Selangor');
INSERT INTO Customer VALUES ('C1077', 'Sherwin Weaving', 'M', '014-2738613', 'sherwin@gmail.com', TO_DATE('23-09-2000', 'DD-MM-YYYY'), 'Lot 122, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1078', 'Bernelle Atwell', 'F', '015-7115120', 'bernelle@gmail.com', TO_DATE('08-08-1992', 'DD-MM-YYYY'), 'Lot 224, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1079', 'Darryl Luke', 'F', '012-1406853', 'darryl@gmail.com', TO_DATE('28-02-1992', 'DD-MM-YYYY'), 'A-20/11 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1080', 'Lissi Richi', 'F', '015-9870310', 'lissi@gmail.com', TO_DATE('11-02-2008', 'DD-MM-YYYY'), 'A-19/04 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1081', 'Hedwiga Brandon', 'F', '019-1395914', 'hedwiga@gmail.com', TO_DATE('05-02-2003', 'DD-MM-YYYY'), 'A-21-3A, Jalan Vista Mutiara 1, Tsi Business Park', 52000, 'Kepong Baru', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1082', 'Cynthea Caesar', 'F', '018-6279266', 'cynthea@gmail.com', TO_DATE('04-02-1994', 'DD-MM-YYYY'), 'Lot 2589, Jalan Delima 1/1, Subang Hi-tech Industrial Park', 40000, 'Subang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1083', 'Niven Denny', 'M', '011-1434505', 'niven@gmail.com', TO_DATE('30-06-1994', 'DD-MM-YYYY'), 'A-3A-1, Jalan Kelab Ukay 2, Taman Kelab Ukay', 68000, 'Ampang', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1084', 'Ronalda Jackson', 'F', '019-5626591', 'ronalda@gmail.com', TO_DATE('31-07-1988', 'DD-MM-YYYY'), 'C-13/02, Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1085', 'Dolley Law', 'F', '011-8799708', 'dolley@gmail.com', TO_DATE('08-02-1989', 'DD-MM-YYYY'), 'A-21-4 PV15 Condo, Jalan Danau Saujana 1', 53300, 'Setapak', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1086', 'Carleen Flek', 'F', '012-7321388', 'carleen@gmail.com', TO_DATE('08-12-2002', 'DD-MM-YYYY'), 'A-18/24, Jalan PJU 1a/3, Ara Damansara', 47301, 'Petaling Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1087', 'Hubie Alexander', 'M', '016-1621910', 'hubie@gmail.com', TO_DATE('15-08-1992', 'DD-MM-YYYY'), 'C-08 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1088', 'Northrop Bening', 'M', '015-5915816', 'northrop@gmail.com', TO_DATE('02-02-1996', 'DD-MM-YYYY'), 'B-08/14 Epic Residence, Jln BP 7/12, Bandar Bukit Puchong 2', 47120, 'Puchong', 'Selangor');
INSERT INTO Customer VALUES ('C1089', 'Adina Modu', 'F', '012-5809723', 'adina@gmail.com', TO_DATE('08-04-1995', 'DD-MM-YYYY'), 'E-18 Wangsa 9 Residency, Jalan Wangsa Perdana 1', 53300, 'Wangsa Maju', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1090', 'Merralee Diesel', 'F', '012-6158928', 'merralee@gmail.com', TO_DATE('18-07-1992', 'DD-MM-YYYY'), 'BlockC-141 Putra One Residence, Persiaran Bukit Rahman Putra 1', 47000, 'Sungai Buloh', 'Selangor');
INSERT INTO Customer VALUES ('C1091', 'Otto Gillan Rooker', 'M', '011-7354170', 'otto@gmail.com', TO_DATE('08-11-1998', 'DD-MM-YYYY'), 'B-22-23 One Jelatek Condo, Jalan Jelatek', 54200, 'Jelatek', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1092', 'Flss Saldana', 'F', '017-2230278', 'flss@gmail.com', TO_DATE('26-12-2000', 'DD-MM-YYYY'), 'F-11, Green Residence, Jalan Sayang 1', 43200, 'Cheras', 'Selangor');
INSERT INTO Customer VALUES ('C1093', 'Esme Pratt', 'M', '011-1805813', 'esme@gmail.com', TO_DATE('27-02-1993', 'DD-MM-YYYY'), 'Lot 1007 Menara Sri Jati, Jalan 30/56, Taman Setiawangsa', 54200, 'Setiawangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1094', 'Rae Gunn', 'F', '016-7513147', 'rae@gmail.com', TO_DATE('29-07-1994', 'DD-MM-YYYY'), '19A-55 Ampang Damai Condominium, Jalan Wawasan 3', 68000, 'Ampang Jaya', 'Selangor');
INSERT INTO Customer VALUES ('C1095', 'George Peter', 'M', '012-8849303', 'george@gmail.com', TO_DATE('14-08-2002', 'DD-MM-YYYY'), 'PT 3277, Seri Titiwangsa, Lorong Titiwangsa 1', 53200, 'Titiwangsa', 'Kuala Lumpur');
INSERT INTO Customer VALUES ('C1096', 'Sheilakathryn Bautista', 'F', '018-1823908', 'sheilakathryn@gmail.com', TO_DATE('30-03-2001', 'DD-MM-YYYY'), 'B-16-06 MH Platinum Residence, Jalan Gombak', 53100, 'Gombak', 'Selangor');
INSERT INTO Customer VALUES ('C1097', 'Silvia Gillian', 'F', '018-8644995', 'silvia@gmail.com', TO_DATE('19-04-1999', 'DD-MM-YYYY'), 'Lot 326, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1098', 'Gare Rice', 'M', '011-9192021', 'gare@gmail.com', TO_DATE('12-12-1992', 'DD-MM-YYYY'), 'Lot 428, Jalan Nora 2', 53100, 'Taman Melawati', 'Selangor');
INSERT INTO Customer VALUES ('C1099', 'Hunter Stark', 'M', '013-9818221', 'hunter@gmail.com', TO_DATE('21-07-2003', 'DD-MM-YYYY'), 'C-14/30 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1100', 'Thurstan Brolin', 'M', '019-9305622', 'thurstan@gmail.com', TO_DATE('21-07-2001', 'DD-MM-YYYY'), 'A-10/12 Amara Residensi, Jalan Raintree Utama', 68100, 'Batu Caves', 'Selangor');
INSERT INTO Customer VALUES ('C1101', 'Lorrayne Alexander', 'F', '011-5900172', 'lorrayne@gmail.com', TO_DATE('25-05-2000', 'DD-MM-YYYY'), 'C-2-8, Jalan Vista Mutiara 1, Tsi Business Park', 52000, 'Kepong Baru', 'Kuala Lumpur');

-- 101 records
SELECT COUNT(*) FROM Customer;
