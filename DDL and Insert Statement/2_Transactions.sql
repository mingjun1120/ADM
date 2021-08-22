DROP TABLE Transactions;
CREATE TABLE Transactions
(TransactionsID  VARCHAR2(6) NOT NULL,       
 EmployeeID      VARCHAR2(5) NOT NULL,
 CustomerID      VARCHAR2(5) NOT NULL,
 Date_Paid       DATE,
PRIMARY KEY(TransactionsID),
FOREIGN KEY EmployeeID references Employee(EmployeeID),
FOREIGN KEY CustomerID references Customer(CustomerID),
CONSTRAINT CHK_td_price CHECK (Total_Price > 0)
);

--january 52 record
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10001', 'E006', 'C1001', '01/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10002', 'E006', 'C1001', '02/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10003', 'E006', 'C1002', '02/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10004', 'E006', 'C1003', '03/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10005', 'E006', 'C1004', '04/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10006', 'E006', 'C1005', '05/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10007', 'E006', 'C1006', '08/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10008', 'E006', 'C1007', '09/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10009', 'E006', 'C1008', '09/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10010', 'E006', 'C1009', '09/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10011', 'E006', 'C1010', '09/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10012', 'E006', 'C1011', '10/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10013', 'E006', 'C1012', '11/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10014', 'E006', 'C1013', '11/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10015', 'E006', 'C1014', '12/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10016', 'E006', 'C1012', '12/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10017', 'E006', 'C1015', '13/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10018', 'E006', 'C1016', '14/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10019', 'E006', 'C1012', '14/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10020', 'E006', 'C1017', '15/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10021', 'E006', 'C1018', '15/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10022', 'E006', 'C1019', '15/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10023', 'E006', 'C1020', '15/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10024', 'E006', 'C1021', '16/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10025', 'E006', 'C1022', '17/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10026', 'E006', 'C1017', '17/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10027', 'E006', 'C1023', '18/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10028', 'E006', 'C1024', '19/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10029', 'E006', 'C1025', '19/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10030', 'E006', 'C1026', '19/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10031', 'E006', 'C1027', '20/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10032', 'E006', 'C1028', '20/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10033', 'E006', 'C1029', '20/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10034', 'E006', 'C1023', '20/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10035', 'E006', 'C1030', '21/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10036', 'E006', 'C1031', '21/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10037', 'E006', 'C1032', '21/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10038', 'E006', 'C1033', '21/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10039', 'E006', 'C1034', '21/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10040', 'E006', 'C1035', '22/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10041', 'E006', 'C1036', '23/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10042', 'E006', 'C1037', '24/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10043', 'E006', 'C1038', '25/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10044', 'E006', 'C1039', '25/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10045', 'E006', 'C1040', '26/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10046', 'E006', 'C1041', '27/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10047', 'E006', 'C1033', '27/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10048', 'E006', 'C1042', '27/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10049', 'E006', 'C1043', '28/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10050', 'E006', 'C1044', '28/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10051', 'E006', 'C1045', '29/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10052', 'E006', 'C1046', '30/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10053', 'E006', 'C1047', '31/01/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10054', 'E006', 'C1048', '31/01/2018');

--feb 45 record
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10055', 'E006', 'C1049', '01/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10056', 'E006', 'C1050', '01/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10057', 'E006', 'C1051', '02/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10058', 'E006', 'C1043', '02/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10059', 'E006', 'C1052', '02/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10060', 'E006', 'C1053', '03/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10061', 'E006', 'C1054', '03/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10062', 'E006', 'C1034', '03/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10063', 'E006', 'C1055', '04/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10064', 'E006', 'C1056', '05/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10065', 'E006', 'C1057', '07/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10066', 'E006', 'C1058', '08/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10067', 'E006', 'C1059', '09/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10068', 'E006', 'C1060', '10/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10069', 'E006', 'C1061', '11/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10070', 'E006', 'C1062', '11/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10071', 'E006', 'C1063', '12/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10072', 'E006', 'C1013', '13/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10073', 'E006', 'C1064', '14/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10074', 'E006', 'C1065', '15/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10075', 'E006', 'C1066', '16/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10076', 'E006', 'C1067', '17/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10077', 'E006', 'C1068', '18/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10078', 'E006', 'C1069', '20/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10079', 'E006', 'C1070', '20/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10080', 'E006', 'C1050', '20/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10081', 'E006', 'C1071', '20/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10082', 'E006', 'C1072', '21/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10083', 'E006', 'C1073', '21/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10083', 'E006', 'C1023', '21/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10084', 'E006', 'C1074', '22/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10085', 'E006', 'C1075', '22/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10086', 'E006', 'C1076', '22/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10087', 'E006', 'C1077', '22/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10088', 'E006', 'C1078', '23/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10089', 'E006', 'C1079', '23/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10090', 'E006', 'C1060', '23/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10091', 'E006', 'C1080', '23/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10092', 'E006', 'C1081', '24/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10093', 'E006', 'C1082', '24/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10094', 'E006', 'C1083', '24/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10095', 'E006', 'C1084', '25/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10096', 'E006', 'C1085', '26/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10097', 'E006', 'C1066', '26/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10098', 'E006', 'C1086', '27/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10099', 'E006', 'C1087', '28/02/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10100', 'E006', 'C1028', '28/02/2018');

--March 28 record (total 125)
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10101', 'E007', 'C1089', '01/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10102', 'E006', 'C1090', '02/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10103', 'E007', 'C1091', '03/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10104', 'E006', 'C1032', '03/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10105', 'E006', 'C1092', '03/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10106', 'E006', 'C1093', '05/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10107', 'E007', 'C1094', '06/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10108', 'E006', 'C1095', '07/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10109', 'E007', 'C1096', '08/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10110', 'E007', 'C1097', '09/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10111', 'E006', 'C1098', '10/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10112', 'E007', 'C1099', '11/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10113', 'E006', 'C1100', '12/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10114', 'E007', 'C1101', '15/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10115', 'E007', 'C1002', '15/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10116', 'E007', 'C1042', '15/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10117', 'E007', 'C1012', '16/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10118', 'E007', 'C1062', '17/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10119', 'E007', 'C1023', '19/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10120', 'E007', 'C1027', '21/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10121', 'E007', 'C1098', '22/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10122', 'E007', 'C1076', '24/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10123', 'E007', 'C1053', '25/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10124', 'E007', 'C1013', '26/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10125', 'E007', 'C1023', '27/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10126', 'E007', 'C1053', '28/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10127', 'E007', 'C1032', '29/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10128', 'E007', 'C1057', '30/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10129', 'E007', 'C1017', '30/03/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10130', 'E007', 'C1077', '30/03/2018');

--April 25 record 
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10131', 'E007', 'C1099', '01/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10132', 'E006', 'C1010', '02/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10133', 'E007', 'C1021', '03/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10134', 'E006', 'C1032', '03/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10135', 'E006', 'C1022', '03/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10136', 'E006', 'C1053', '05/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10137', 'E007', 'C1064', '06/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10138', 'E006', 'C1065', '07/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10139', 'E007', 'C1086', '08/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10140', 'E007', 'C1047', '09/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10141', 'E006', 'C1088', '10/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10142', 'E007', 'C1009', '11/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10143', 'E006', 'C1032', '12/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10144', 'E007', 'C1100', '15/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10145', 'E007', 'C1033', '15/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10146', 'E007', 'C1043', '15/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10147', 'E007', 'C1011', '16/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10148', 'E007', 'C1065', '17/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10149', 'E007', 'C1024', '19/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10150', 'E007', 'C1022', '21/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10151', 'E007', 'C1095', '22/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10152', 'E006', 'C1073', '24/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10153', 'E007', 'C1051', '25/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10154', 'E007', 'C1015', '26/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10155', 'E007', 'C1022', '27/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10156', 'E007', 'C1057', '28/04/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10157', 'E007', 'C1031', '29/04/2018');

-- May 25 record
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10158', 'E008', 'C1029', '01/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10159', 'E006', 'C1030', '02/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10160', 'E008', 'C1001', '03/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10161', 'E006', 'C1002', '03/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10162', 'E006', 'C1042', '03/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10163', 'E006', 'C1023', '05/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10164', 'E008', 'C1044', '06/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10165', 'E006', 'C1055', '07/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10166', 'E007', 'C1066', '08/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10167', 'E008', 'C1017', '09/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10168', 'E006', 'C1048', '10/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10169', 'E008', 'C1019', '11/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10170', 'E006', 'C1101', '12/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10171', 'E007', 'C1101', '15/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10172', 'E007', 'C1012', '15/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10173', 'E007', 'C1012', '15/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10174', 'E007', 'C1022', '16/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10175', 'E008', 'C1042', '17/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10176', 'E008', 'C1053', '19/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10177', 'E007', 'C1037', '21/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10178', 'E007', 'C1068', '22/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10179', 'E008', 'C1046', '24/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10180', 'E007', 'C1033', '25/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10181', 'E007', 'C1063', '26/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10182', 'E008', 'C1083', '27/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10183', 'E008', 'C1013', '28/05/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10184', 'E008', 'C1022', '29/05/2018');

-- june 25 record
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10185', 'E008', 'C1019', '01/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10186', 'E008', 'C1010', '02/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10187', 'E008', 'C1031', '03/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10188', 'E006', 'C1042', '03/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10189', 'E008', 'C1022', '03/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10190', 'E006', 'C1033', '05/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10191', 'E008', 'C1044', '06/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10192', 'E008', 'C1055', '07/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10193', 'E007', 'C1076', '08/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10194', 'E008', 'C1087', '09/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10195', 'E006', 'C1058', '10/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10196', 'E008', 'C1049', '11/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10197', 'E008', 'C1090', '12/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10198', 'E008', 'C1100', '15/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10199', 'E007', 'C1032', '15/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10200', 'E007', 'C1062', '15/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10201', 'E007', 'C1022', '16/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10202', 'E007', 'C1032', '17/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10203', 'E008', 'C1053', '19/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10204', 'E008', 'C1037', '21/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10205', 'E008', 'C1068', '22/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10206', 'E007', 'C1056', '24/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10207', 'E007', 'C1043', '25/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10208', 'E008', 'C1043', '26/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10209', 'E007', 'C1083', '27/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10210', 'E007', 'C1053', '28/06/2018');
insert into Transactions (TransactionsID, EmployeeID, CustomerID, Date_Paid) values ('T10211', 'E008', 'C1032', '29/06/2018');

-- 211 records
SELECT COUNT(*) FROM Transactions;