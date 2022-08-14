
show databases;
create database DESIKA_2211587;
show databases;
use DESIKA_2211587;

/*Exercise_1*/

CREATE table Trainer_Info(
Trainer_ID char(20) not null,
Salutation char(7) not null,
Trainer_Name char(30) not null,
Trainer_Location char(30) not null,
Trainer_Track char(15) not null,
Trainer_Qualification char(100) not null,
Trainer_Experience integer not null,
Trainer_Email char(100) not null,
Trainer_Password char(20) not null,
primary key(Trainer_ID));


Create table Batch_Info(
Batch_Id char(20) not null,
Batch_Owner char(30) not null,
Batch_BU_Name char(30) not null,
primary key(Batch_Id));


create table Module_Info(
Module_Id char(20) not null,
Module_Name char(40) not null,
Module_Duration INT not null,
primary key(Module_Id));

CREATE table Associate_Info(
Associate_ID char(20) not null,
Salutation char(7)not null,
Associate_Name char(30) not null,
Associate_Location char(30) not null,
Associate_Track char(15) not null,
Associate_Qualification char(200) not null,
Associate_Email char(100) not null,
Associate_Password char(20) not null,
primary key(Associate_ID));

create table Questions(
Question_Id char(20) not null,
module_Id char(20) not null,
Question_Text text(900) not null,
primary key(Question_Id));


create table Associate_status(
Associate_id char(20) not null,
Module_Id char(20) not null,
Batch_Id char(20) not null,
Trainer_Id char(20) not null,
Start_Date char(20) not null,
End_Date char(20) not null,
 Foreign key(Associate_Id) references Associate_Info(Associate_Id) ,
foreign key(Module_Id) references Module_Info(Module_Id),
foreign key(Batch_Id) references Batch_Info(Batch_Id),
foreign key(Trainer_Id) references Trainer_Info(Trainer_Id)
);


create table Trainer_Feedback(
Trainer_Id char(20) not null,
Question_Id char(20) not null,
Batch_Id char(20) not null,
Module_Id char(20) not null,
Trainer_Rating INT ,
foreign key(Trainer_Id) references Trainer_Info(Trainer_Id),
Foreign key(Question_Id) references Questions(Question_Id),
foreign key(Batch_Id) references Batch_Info(Batch_Id),
foreign key(Module_Id) references Module_Info(Module_Id));

create table Associate_Feedback(
Associate_Id char(20) not null,
Question_Id char(20) not null,
Module_Id char(20) not null,
Associate_Rating INT,
Foreign key(Associate_Id) references Associate_Info(Associate_Id) ,
Foreign key(Question_Id) references Questions(Question_Id),
foreign key(Module_Id) references Module_Info(Module_Id));

create table Login_Details(
User_Id char(20) not null,
User_Password char(20) not null
);
show tables;
describe Trainer_info;
describe batch_info;
describe module_info;
describe associate_info;
describe questions;
describe associate_status;
describe trainer_feedback;
describe associate_feedback;
describe login_details;

/*Exercise 2*/
insert into trainer_info(Trainer_id, salutation, trainer_name, trainer_location,
 trainer_track, trainer_qualification, trainer_experience, trainer_email, trainer_password) 
values('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of Technology',12,'Pankaj.Ghosh@ALLIANCE.COM', 'fac1@123'),
('F002','Mr.','SANJAY RADHAKRISHNAN','Bangalore','DotNET','Bachelor of Technology', 12, 'Sanjay.Radhakrishnan@alliance.com','fac2@123'),
('F003','Mr.','VIJAY MATHUR', 'Chennai', 'Mainframe', 'Bachelor of Technology', 10, 'Vijay.Mathur@alliance.com','fac@123'),
('F004','Mrs.','NANDINI NAIR', 'Kolkata', 'Java',' Master of Computer applications',9,'Nandini.Nair@alliance.com',' fac4@123'),
('F005', 'Miss.','ANITHA PAREKH',' Hyderabad', 'Testing',' Master of Computer applications', 6, 'Anitha.Parekh@alliance.com', 'fac5@123'),
('F006','Mr.','MANOJ AGRAWAL',' Mumbai', 'Mainframe', 'Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123'),
('F007', 'Ms.','MEENA KULKARNI','Coimbatore', 'Testing', 'Bachelor of Technology',5, 'Meena.Kulkarni@alliance.com','fac7@123'),
('F009', 'Mr.', 'SAGAR MENON', 'Mumbai', 'Java', 'Master of Science In Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');

insert into Batch_Info(Batch_Id, Batch_Owner,Batch_BU_Name) value('B001','MRS.SWATI ROY', 'MSP'),
('B002', 'MRS.ARURNA K', 'HEALTH CARE'),
('B003','MR.RAJESH KRISHNAN', 'LIFE SCIENCES'),
('B004','MR.SACHIN SHETTY',' BFS'),
('B005', 'MR.RAMESH PATEL', 'COMMUNICATION'),
('B006', 'MRS.SUSAN CHERIAN', 'RETAIL & HOSPITALITY'),
('B007', 'MRS.SAMPADA JAIN','MSP'),
('B008','MRS.KAVITA REGE','BPO'),
('B009','MR.RAVI SEJPAL','MSP');

INSERT INTO Module_Info(Module_Id, Module_Name,Module_Duration) value('O10SQL', 'Oracle 10g SQL', 16),('O10PLSQL', 'Oracle 10g PL/SQL',16),
('J2SE',' Core Java SE 1.6', 288),('J2EE', 'Advanced Java EE 1.6', 80),('JAVAFX', 'JavaFX 2.1', 80),('DOTNT4', 'Net Framework 4.0', 50),
('SQL2008', 'M S SQL Server 2008', 120),('MSBI08', 'M S BI Studio 2008', 158),
('SHRPNT', 'M S Share Point', 80),('ANDRD4', 'Android 4.0', 200),
('EM001', 'Instructor', 0),('EM002', 'Course Material', 0),
('EM003', 'Learning Effectiveness',0),('EM004', 'Environment',0),
('EM005',' Job Impact',0),('TM001','Attendees',0),
('TM002', 'Course Material', 0),('TM003', 'Environment', 0);

insert into associate_info(associate_id, salutation, associate_name, associate_Location, 
associate_track, associate_qualification, associate_email, associate_password) 
value('A001', 'Miss.', 'GAYATHRI NARAYANAN', 'Gurgaon', 'Java', 'Bachelor of Technology', 'Gayathri.Narayanan@hp.com', 'tne1@123'),
('A002','Mrs.', 'RADHIKA MOHAN', 'Kerala', 'Java', 'Bachelor of Engineering In Information Technology', 'Radhika.Mohan@cognizant.com','tne2@123'),
('A003', 'Mr.','KISHORE SRINIVAS', 'Chennai',' Java', 'Bachelor of Engineering in Computers', 'Kishore.Srinivas@ibm.com', 'tne3@123'),
('A004', 'Mr.', 'ANAND RANGANATHAN', 'Mumbai', 'DotNet', 'Master of Computer Applications', 'Anand.Ranganathan@finolex.com',' tne4@123'),
('A005', 'Miss.','LEELA MENON', 'Kerala', 'Mainframe', 'Bachelor of Engineering in Information Technology', 
'Leela.Menon@microsoft.com','ten5@123'),
('A006','Mrs.','ARTI KRISHNAN', 'Pune', 'Testing', 'Master of Computer Applications', 'Arti.Krishnan@cognizant.com','tne6@123'),
('A007','Mr.','PRABHAKAR SHUNMUGAM', 'Mumbai', 'Java', 'Bachelor of Technology',' Prabhakar.Shunmugam@honda.com', 'tne7@123');

INSERT INTO Questions values('Q001','EM001',
'Instructor knowledgeable and able to handle all your queries.'),
('Q002', 'EM001', 'All the topics in a particular course handled by the trainer without any gaps or slippages.'),
('Q003','EM002', 
'The course materials presentation, handson, etc. refered during the training or relevant and useful.'),
('Q004','EM002',' The Handson session adequate enough to grasp the understanding of the topic.'),
('Q005','EM002', 'The reference materials suggested for each module are adequate.'),
('Q006', 'EM003', 'Knowledge and skills presented in this training are applicatible at your work.'),
('Q007','EM003','This training increases my proficiency level.'),
('Q008', 'EM004',' The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q009','EM004', 'The software/hardware environment provided was sufficient for the purpose of the training.'),
('Q010','EM005',' This training will improve your job performance.'),
('Q011','EM005',' This training align with the business properties and goals.'),
('Q012','TM001', 'Participants where receptive and had attitude towards learning.'),
('Q013','TM001', 'All participates gained the knowledge and the practical skills after this training.'),
('Q014','TM002',' The course materials presentation, handson, etc. available for the session covers the entire objectives of the course.'),
('Q015', 'TM002','Complexity of the course is adequate for the participate level.'),
('Q016','TM002',' Case study and practical helpful in understanding of the topic.'),
('Q017','TM003', 'The physical environment e.g. classroom space, air-conditioning was conducive to learning.'),
('Q018',' TM003', 'The software/hardware environment provided was adequate for the purpose of the training.');

Insert into associate_status values('A001','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A002','O10SQL','B001','F001','2000-12-15','2000-12-25'),('A003','O10SQL','B001','F001','2000-12-15','2000-12-25'),
('A001','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A002','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),('A003','O10PLSQL','B002','F002','2001-2-1','2001-2-12'),
('A001','J2SE','B003','F003','2002-8-20','2002-10-25'),('A002','J2SE','B003','F003','2002-8-20','2002-10-25'),
('A001','J2EE','B004','F004','2005-12-1','2005-12-25'),('A002','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A003','J2EE','B004','F004','2005-12-1','2005-12-25'),('A004','J2EE','B004','F004','2005-12-1','2005-12-25'),
('A005','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','JAVAFX','B005','F006','2005-12-4','2005-12-20'),
('A006','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A007','SQL2008','B006','F007','2007-6-21','2007-6-28'),
('A002','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A003','MSBI08','B007','F006','2009-6-26','2009-6-29'),('A004','MSBI08','B007','F006','2009-6-26','2009-6-29'),
('A002','ANDRD4','B008','F005','2010-6-5','2010-6-28'),('A005','ANDRD4','B008','F005','2010-6-5','2010-6-28'),
('A003','ANDRD4','B009','F005','2011-8-1','2011-8-20'),('A006','ANDRD4','B009','F005','2011-8-1','2011-8-20');

select * from trainer_info;
select * from batch_info;
select * from module_info;
select * from associate_info;
select * from questions;
select * from associate_status;

/*exercise 3*/
update TRAINER_INFO SET TRAINER_PASSWORD='nn4@123' where trainer_id='F004';
SELECT * FROM TRAINER_INFO;

/*exercise 4*/
DELETE FROM ASSOCIATE_STATUS WHERE ASSOCIATE_ID='A003' AND MODULE_ID='J2EE' ;
SELECT * FROM ASSOCIATE_STATUS;

/*EXERCISE 5*/
SELECT * FROM Trainer_Info
ORDER BY Trainer_Experience DESC
LIMIT 5; 


/*EXERCISE 6*/
select * from login_details;
start transaction;
INSERT INTO LOGIN_DETAILS value('U001','Admin1@123'),('U001','Admin1@123');
commit;
select*from login_details;
rollback;
select * from login_details;

/*exercise 7*/

CREATE USER 'desika@localhost' identified by 'desika0909';
GRANT CREATE ON desika_2211587 TO 'desika@localhost';
GRANT SELECT ON desika_2211587.Login_Details TO 'desika@localhost';
start TRANSACTION;
SELECT*FROM Login_Details;
INSERT INTO Login_Details(User_Id,User_Password)
VALUES
('U001','Admin1@123'),
('U002','Admin2@123');
ROLLBACK;
SELECT*FROM Login_Details;
REVOKE CREATE ON desika_2211587 FROM 'desika@localhost';
REVOKE SELECT ON desika_2211587.Login_Details FROM 'desika@localhost';

/*exercise 8*/

drop table login_details;

/*exercise 9*/

CREATE TABLE suppliers(
supplier_id_Id INTEGER NOT NULL,
supplier_name VARCHAR(50) NOT NULL,
address VARCHAR(50),
city VARCHAR(50),
state VARCHAR(25),
zip_code VARCHAR(10)
);

describe suppliers;

/*exercise 10*/
drop table course_fees;
CREATE TABLE Course_Fees(
COURSE_CODE VARCHAR(20) primary key ,
BASE_FEES INTEGER,
SPECIAL_FEES INTEGER,
DISCOUNT INTEGER
);
describe course_Fees;

CREATE TABLE CourseFees_History(
COURSE_CODE VARCHAR(20) PRIMARY KEY,
BASE_FEES INTEGER,
SPECIAL_FEES INTEGER,
CREATED_BY VARCHAR(50),
Updated_BY VARCHAR(50)
);

describe courseFees_History;

INSERT INTO Course_Fees VALUES
('1',180,100,10),
('2',150,110,10),
('3',160,170,5),
('4',150,100,10),
('6',190,100,10);

select * from course_fees;

INSERT INTO CourseFees_History VALUES
('1',120,123,'Ram','Ramesh'),
('2',150,110,'Bala','Ram'),
('3',160,170,'Bala','Vinu'),
('4',170,235,'Ram','Ram'),
('6',190,100,'Vinod','Vinod');

select * from coursefees_history;

SELECT DISTINCT COURSE_CODE,BASE_FEES,SPECIAL_FEES FROM Course_Fees
UNION
SELECT DISTINCT COURSE_CODE,BASE_FEES,SPECIAL_FEES FROM CourseFees_History
ORDER BY COURSE_CODE;

/*exercise 11*/

SELECT COUNT(*) FROM Course_Fees;
SELECT COUNT(DISTINCT COURSE_CODE)FROM Course_Fees;
/*yes, all are unique*/
SELECT COUNT(DISTINCT BASE_FEES)FROM Course_Fees;
/*no, some are not unique*/
SELECT COUNT(DISTINCT SPECIAL_FEES)FROM Course_Fees;
/*no, some are not unique*/
SELECT COUNT(*) FROM CourseFees_History;
SELECT COUNT(DISTINCT COURSE_CODE)FROM CourseFees_History;
/*yes, all are unique*/
SELECT COUNT(DISTINCT BASE_FEES)FROM CourseFees_History;
/*yes, all are unique*/
SELECT COUNT(DISTINCT SPECIAL_FEES)FROM CourseFees_History;
/*yes, all are unique*/

/*Exercise 12*/

CREATE TABLE course_info(
COURSE_CODE VARCHAR(10),
COURSE_NAME VARCHAR(20) NOT NULL,
COURSE_DESCRIPTION VARCHAR(25),
COURSE_START_DATE DATE,
COURSE_DURATION INTEGER,
NO_OF_PARTICIPANTS INTEGER,
COURSE_TYPE CHAR(3),
primary key(course_code));

CREATE TABLE Student_info(
STUDENT_ID VARCHAR(10) PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(25),
ADDRESS VARCHAR(150));

INSERT INTO Course_Fees
VALUES
('7',NULL,200,12),
('8',NULL,310,16),
('9',300,410,13),
('10',175,400,12);
select * from course_fees;
SELECT MIN(base_fees),Max(base_fees)FROM course_fees;

/*exercise 13*/
ALTER TABLE Course_Fees ADD COLUMN Infra_Fees DECIMAL(5,3);
select* from course_fees;
UPDATE Course_Fees SET Infra_Fees = 45.751 WHERE Course_Code = '1';
UPDATE Course_Fees SET Infra_Fees = 43.453 WHERE Course_Code = '2';
UPDATE Course_Fees SET Infra_Fees = 41.234 WHERE Course_Code = '3';
UPDATE Course_Fees SET Infra_Fees = 47.493 WHERE Course_Code = '4';
UPDATE Course_Fees SET Infra_Fees = 48.051 WHERE Course_Code = '6';
UPDATE Course_Fees SET Infra_Fees = 42.481 WHERE Course_Code = '7';
UPDATE Course_Fees SET Infra_Fees = 46.021 WHERE Course_Code = '8';
UPDATE Course_Fees SET Infra_Fees = 40.373 WHERE Course_Code = '9';
UPDATE Course_Fees SET Infra_Fees = 49.761 WHERE Course_Code = '10';

SELECT ROUND(AVG(Infra_Fees)) FROM Course_Fees;


/*EXERCISE 14*/

SELECT Course_Name, datediff(CURRENT_DATE,Course_Start_DATE) AS number_of_days FROM Course_info;
 select* from course_info;
 
 /*exercise 15*/
 SELECT CONCAT('<',Course_Name,'>','<',Course_Code,'>') As New_Col FROM Course_Info;

/*exercise 16*/
SELECT NULLIF(AVG(base_fees),0)FROM course_fees;

/*exercise 17*/

ALTER TABLE Course_Info ADD Message VARCHAR(50);
INSERT INTO Course_Info(Course_code,Course_Name,Course_Type,Message) Values
('A12','Java','CLR'," 'Class Room' "),
('B11','DotNet','EL'," 'ELearning' "),
('C21','Data','OF'," 'Offline Reading' ");
SELECT Course_Type,Message FROM Course_Info;

/*exercise 18*/

SELECT Course_Start_Date, SUM(No_Of_Participants)As Tot_No_Of_Students FROM
Course_Info
GROUP BY Course_Start_Date;

/*exercise 19*/

SELECT Course_Start_Date, SUM(No_Of_Participants)As Tot_No_Of_Students FROM
Course_Info
WHERE Course_Type = 'CLR'
GROUP BY Course_Start_Date;

/*exercise 20*/

SELECT Course_Start_Date, SUM(No_Of_Participants) As Tot_No_Of_Students FROM
Course_Info
WHERE Course_Type = 'CLR'
GROUP BY Course_Start_Date
HAVING SUM(No_Of_Participants)>10;

/*exercise 21*/

SELECT * FROM Course_Info
ORDER BY Course_Duration ASC;

/*exercise 22*/

ALTER TABLE Student_INFO
ADD COLUMN Course_Code VARCHAR(10) REFERENCES Course_Info(Course_Code);
SELECT Student_Info.Student_Id,
Student_Info.First_Name,Student_Info.Last_Name,Course_Info.Course_Code
FROM Student_Info
INNER JOIN Course_Info ON
Student_Info.Course_Code = Course_Info.Course_Code
WHERE Course_Info.Course_Code= '167';

/*exercise 23*/

SELECT Course_Info.Course_Name,Course_Info.Course_Description,Course_Fees.Discount
FROM Course_Fees
INNER JOIN Course_Info
ON Course_Fees.Course_Code = Course_Info.Course_Code;

/*exercise 24*/

INSERT INTO Student_Info
VALUES
('C001','SANDIA','MANI','Perambur,Chennai','s09'),
('C002','DESIKA','KALIMUTHU','CHOOLAIMEDU,MADRAS','S26'),
('C003','Shane','Den','GST road,Rio','C21');
SELECT Student_Info.First_Name,Course_Info.Course_Code From Student_Info
LEFT JOIN Course_Info
ON Student_Info.Course_Code=Course_Info.Course_Code;
SELECT Student_Info.First_Name,Course_Info.Course_Code From Student_Info
RIGHT JOIN Course_Info
ON Student_Info.Course_Code=Course_Info.Course_Code;

/*EXERCISE 25*/

INSERT INTO Course_Info(Course_code,Course_Name,No_Of_Participants,Course_Type)
VALUES
('A1','SQL',5,'SBA'),
('A2','PYTHON',3,'KBA');
INSERT INTO Course_Fees(Course_Code,Base_Fees,Special_Fees,Discount,Infra_Fees)
VALUES
('A1',150,140,18,43.643),
('A2',135,155,14,47.980);
INSERT INTO Student_Info(Student_Id,First_Name,Last_Name,Course_Code)
VALUES
('C004','Anita','Suresh','A1'),
('C005','Sundar','Pichai','A2'),
('C006','Suresh','Pachai','A1'),
('C007','Sowndar','Paramu','A2'),
('C008','ramar','nisha','A2');
SELECT Student_Info.Student_Id From Student_Info
INNER JOIN Course_Fees
ON Student_Info.Course_code=Course_Fees.Course_Code
WHERE ((Base_Fees + Special_Fees + Infra_Fees)*(1-Discount/100))<1500;

/*exercise 26*/

SELECT Student_Info.Student_Id,Student_Info.First_Name,Student_Info.Last_Name From
Student_Info
INNER JOIN Course_Fees
ON Student_Info.Course_code=Course_Fees.Course_Code
WHERE ((Base_Fees + Special_Fees + Infra_Fees)*(1-Discount/100))<1500;
