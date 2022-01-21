-- Creating Database and tables:


CREATE DATABASE lms_db;

USE lms_db;

-- LMS as Liabrary Management System
Create table LMS_MEMBERS(

MEMBER_ID Varchar(10),

MEMBER_NAME Varchar(30) NOT NULL,

CITY Varchar(20),

DATE_REGISTER Date NOT NULL,

DATE_EXPIRE Date ,

MEMBERSHIP_STATUS Varchar(15)NOT NULL,

Constraint LMS_cts1 PRIMARY KEY(MEMBER_ID)

);



Create table LMS_SUPPLIERS_DETAILS(

SUPPLIER_ID Varchar(3),

SUPPLIER_NAME Varchar(30) NOT NULL,

ADDRESS Varchar(50),

CONTACT bigint(10) NOT NULL,

EMAIL Varchar(15) NOT NULL,

Constraint LMS_cts2 PRIMARY KEY(SUPPLIER_ID)

);



Create table LMS_FINE_DETAILS(

FINE_RANGE Varchar(3),

FINE_AMOUNT decimal(10,2) NOT NULL,

Constraint LMS_cts3 PRIMARY KEY(FINE_RANGE)

);



Create table LMS_BOOK_DETAILS

(

BOOK_CODE Varchar(10), 

BOOK_TITLE Varchar(50) NOT NULL,

CATEGORY Varchar(15) NOT NULL,

AUTHOR Varchar(30) NOT NULL,

PUBLICATION Varchar(30),

PUBLISH_DATE Date,

BOOK_EDITION int(2),

PRICE decimal(8,2) NOT NULL, 

RACK_NUM Varchar(3),

DATE_ARRIVAL Date NOT NULL,  

SUPPLIER_ID Varchar(3) NOT NULL,

Constraint LMS_cts4 PRIMARY KEY(BOOK_CODE), 

Constraint LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)

);



Create table LMS_BOOK_ISSUE

(

BOOK_ISSUE_NO int,

MEMBER_ID Varchar(10) NOT NULL,

BOOK_CODE Varchar(10) NOT NULL,

DATE_ISSUE Date NOT NULL,

DATE_RETURN Date NOT NULL,

DATE_RETURNED Date NULL,

FINE_RANGE Varchar(3),

Constraint LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),

Constraint LMS_Mem FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),

Constraint LMS_BookDetail FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),

Constraint LMS_FineDetail FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)

);



Insert into LMS_MEMBERS

Values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11','Temporary');

Insert into LMS_MEMBERS

Values('LM002', 'ABDHUL', 'DELHI', '2012-04-10', '2013-04-09','Temporary');

Insert into LMS_MEMBERS

Values('LM003', 'GAYAN', 'CHENNAI', '2012-05-13','2013-05-12', 'Permanent');

Insert into LMS_MEMBERS

Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');

Insert into LMS_MEMBERS

Values('LM005', 'GURU', 'BANGALORE', '2012-03-30', '2013-05-16','Temporary');

Insert into LMS_MEMBERS

Values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-05-16','Temporary');

select * from lms_members;


Insert into LMS_SUPPLIERS_DETAILS 

Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');

Insert into LMS_SUPPLIERS_DETAILS 

Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');

Insert into LMS_SUPPLIERS_DETAILS 

Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');

Insert into LMS_SUPPLIERS_DETAILS 

Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');

Insert into LMS_SUPPLIERS_DETAILS 

Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');

Insert into LMS_SUPPLIERS_DETAILS 

Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');

select * from LMS_SUPPLIERS_DETAILS;


Insert into LMS_FINE_DETAILS Values('R0', 0);

Insert into LMS_FINE_DETAILS Values('R1', 20);

insert into LMS_FINE_DETAILS Values('R2', 50);

Insert into LMS_FINE_DETAILS Values('R3', 75);

Insert into LMS_FINE_DETAILS Values('R4', 100);

Insert into LMS_FINE_DETAILS Values('R5', 150);

Insert into LMS_FINE_DETAILS Values('R6', 200);

select * from LMS_FINE_DETAILS;


Insert into LMS_BOOK_DETAILS

Values('BL000010', 'Java ForvDummies', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 575.00, 'A1', '2011-05-10', 'S01');

Insert into LMS_BOOK_DETAILS

Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2011-05-10', 'S03');

Insert into LMS_BOOK_DETAILS 

Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-05-10', 6, 600.00, 'A1', '2012-05-10', 'S01');

Insert into LMS_BOOK_DETAILS

Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-11', 'S01');

Insert into LMS_BOOK_DETAILS 

Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-05-11', 'S01');

Insert into LMS_BOOK_DETAILS

Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S03');

Insert into LMS_BOOK_DETAILS 

Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11', 9, 500.00 , 'A3', '2010-11-03', 'S03');

Insert into LMS_BOOK_DETAILS 

Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 500.00 , 'A3', '2011-08-09', 'S04');

Insert into LMS_BOOK_DETAILS 

Values('BL000009', 'Let Us C#', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 550.00 , 'A3', '2011-08-09', 'S04');

Insert into LMS_BOOK_DETAILS 

Values('BL000011', 'Let Us C++', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 650.00 , 'A3', '2011-08-09', 'S04');

select * from LMS_BOOK_DETAILS;


Insert into LMS_BOOK_ISSUE 

Values (001, 'LM001', 'BL000010', '2012-05-01', '2012-05-16', '2012-05-16', 'R0');

Insert into LMS_BOOK_ISSUE 

Values (002, 'LM002', 'BL000002', '2012-05-01', '2012-05-06','2012-05-16', 'R2');

Insert into LMS_BOOK_ISSUE

Values (003, 'LM003', 'BL000007', '2012-04-01', '2012-04-16', '2012-04-20','R1');

Insert into LMS_BOOK_ISSUE 

Values (004, 'LM004', 'BL000005', '2012-04-01', '2012-04-16','2012-04-20', 'R1');

Insert into LMS_BOOK_ISSUE 

Values (005, 'LM005', 'BL000008', '2012-03-30', '2012-04-15','2012-04-20' , 'R1');

Insert into LMS_BOOK_ISSUE 

Values (006, 'LM005', 'BL000008', '2012-04-20', '2012-05-05','2012-05-05' , 'R0');

Insert into LMS_BOOK_ISSUE 

Values (007, 'LM003', 'BL000007', '2012-04-22', '2012-05-07','2012-05-25' , 'R4');

select * from LMS_BOOK_ISSUE