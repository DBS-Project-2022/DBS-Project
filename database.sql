create schema college_dbs;
use college_dbs;
create table person(
pnum varchar(5) primary key, 
fname varchar(50),
lname varchar(50),
gender enum("M","F"),
phone_num bigint, 
email varchar(50), 
address varchar(100), 
date_joined date, 
person_type char(20)
);
create table semester(
sem_num int primary key, 
type varchar(20), 
fees bigint
);
create table department(
dnum varchar (5) primary key, 
dname varchar(50), 
pnum varchar (5), -- (of instructor who heads)
foreign key (pnum) references person(pnum)
);
create table student(
pnum varchar(5) primary key, 
sname varchar(50), 
major varchar(50), 
CGPA float, 
sem_num int,
foreign key(pnum) references person(pnum),
foreign key(sem_num) references semester(sem_num)
);
create table instructor(
pnum varchar(5) primary key, 
salary bigint, 
dnum varchar (5),
foreign key (dnum) references department(dnum)
);

create table courses(
cnum varchar(5) primary key, 
cname varchar(50), 
cred_hours int,
dnum varchar(5), 
inum varchar(5), 
sem_num int,
foreign key (inum) references person(pnum),
foreign key (dnum) references department(dnum),
foreign key (sem_num) references semester(sem_num)
);
create table assessment(
anum varchar(5) primary key, 
type varchar (20), 
total_marks int, 
weightage int
);

create table accounts(
accnum varchar(50) primary key,
username varchar(50), 
password varchar(10), 
snum varchar(5),
foreign key (snum) references person(pnum)
);

create table enrolledin(
snum varchar(5) primary key, 
cnum varchar(5), 
attendance float, 
grade varchar(5), 
foreign key (snum) references person(pnum),
foreign key (cnum) references courses(cnum)
);
create table studentsemester(
snum varchar(5) primary key, 
sem_num int, 
gpa float, 
status varchar(10),
foreign key (snum) references person(pnum),
foreign key (sem_num) references semester(sem_num)
);
create table studentassessment(
snum varchar(5), 
cnum varchar(5), 
anum varchar(5), 
marks_obtained float,
foreign key (snum) references person(pnum),
foreign key (cnum) references courses(cnum),
foreign key (anum) references assessment(anum),
primary key (snum,cnum,anum)
);

-- inserting values person
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P1', 'MARIAM', 'KHAN', 'F', '03331948107', 'mariamk.bscs21seecs@seecs.edu.pk', 'House 7, Street 9, G-6/2, Islamabad, Pakistan', '2021-10-15', 'STUDENT');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P2', 'MUHAMMAD', 'HASSAN', 'M', '03107691046', 'hassan123@gmail.com', 'House 10, Street9, G-9/2, Islamabad, Pakistan', '2021-10-15', 'STUDENT');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P3', 'BIN', 'ADEEL', 'M', '03241874907', 'adeel456@gmail.com', 'Flat 2, PHA, Karachi, Pakistan', '2021-10-15', 'STUDENT');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P4', 'ALEENA', 'AHMAD', 'F', '03452963057', 'alahamd@gmail.com', 'Room 19, Aleena Hostel, GIKI, Pakistan', '2021-10-15', 'STUDENT');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P5', 'MANAL', 'TARIQ', 'F', '03459671826', 'malihakigrammar@yahoo.com', 'McDonalds, Samyung, Alevels, Pakistan', '2021-10-15', 'STUDENT');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P6', 'ABDUL', 'WAHID', 'M', '03201840389', 'abdulwahid_computing@gmail.com', 'House 12, Street 19, I-7, Rawalpindi Pakistan', '2018-09-12', 'INSTRUCTOR');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P7', 'QUANITA', 'KIRAN', 'F', '03040190284', 'quanitakiran_naturalsciences@gmail.com', 'House 256, Rawal Colony, Rawalpindi, Pakistan', '2017-09-22', 'INSTRUCTOR');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P8', 'HASSAN', 'QURESHI', 'M', '03451873002', 'hassanqureshi_electrical@gmail.com', 'House 3, Street 94, Iqbal Town, Lahore, Pakistan', '2017-09-02', 'INSTRUCTOR');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P9', 'IBRAR', 'HUSSAIN', 'M', '03058729006', 'ibrarhussain_humanities@gmail.com', 'Apartment 291, SilverOaks,Islamabad, Pakistan', '2016-09-16', 'INSTRUCTOR');
INSERT INTO `college_dbs`.`person` (`pnum`, `fname`, `lname`, `gender`, `phone_num`, `email`, `address`, `date_joined`, `person_type`) VALUES ('P10', 'SHAMS', 'QAZI', 'M', '03047856028', 'sqazi@gmail.com', 'House 27, Street 12, I-14, Islamabad', '2019-09-14', 'INSTRUCTOR');

-- inserting values semester
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('1', 'FALL', '158000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('2', 'SPRING', '160000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('3', 'FALL', '170000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('4', 'SPRING', '170000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('5', 'FALL', '171000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('6', 'SPRING', '172000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('7', 'FALL', '171000');
INSERT INTO `college_dbs`.`semester` (`sem_num`, `type`, `fees`) VALUES ('8', 'SPRING', '169000');




-- inserting values accounts
INSERT INTO `college_dbs`.`accounts` (`accnum`, `username`, `password`, `snum`) VALUES ('1234', 'mariambabarkhan', 'mariam123', 'P1');
INSERT INTO `college_dbs`.`accounts` (`accnum`, `username`, `password`, `snum`) VALUES ('5678', 'muhammadhassan', 'hassan123', 'P2');
INSERT INTO `college_dbs`.`accounts` (`accnum`, `username`, `password`, `snum`) VALUES ('9101', 'binadeel', 'adeel456', 'P3');
INSERT INTO `college_dbs`.`accounts` (`accnum`, `username`, `password`, `snum`) VALUES ('1121', 'aleenaahmad', 'aleens052', 'P4');
INSERT INTO `college_dbs`.`accounts` (`accnum`, `username`, `password`, `snum`) VALUES ('1314', 'manaltariq', 'okslay', 'P5');

-- inserting values assessments
INSERT INTO `college_dbs`.`assessment` (`anum`, `type`, `total_marks`, `weightage`) VALUES ('A1', 'QUIZ', '10', '10');
INSERT INTO `college_dbs`.`assessment` (`anum`, `type`, `total_marks`, `weightage`) VALUES ('A2', 'ASSIGNMENT', '30', '10');
INSERT INTO `college_dbs`.`assessment` (`anum`, `type`, `total_marks`, `weightage`) VALUES ('A3', 'MID SEMESTER EXAM', '50', '30');
INSERT INTO `college_dbs`.`assessment` (`anum`, `type`, `total_marks`, `weightage`) VALUES ('A4', 'FINAL EXAM', '100', '50');

-- inserting values department
INSERT INTO `college_dbs`.`department` (`dnum`, `dname`, `pnum`) VALUES ('D1', 'COMPUTING', 'P6');
INSERT INTO `college_dbs`.`department` (`dnum`, `dname`, `pnum`) VALUES ('D2', 'MATH', 'P7');
INSERT INTO `college_dbs`.`department` (`dnum`, `dname`, `pnum`) VALUES ('D3', 'ELECTRICAL', 'P8');
INSERT INTO `college_dbs`.`department` (`dnum`, `dname`, `pnum`) VALUES ('D4', 'HUMANITIES', 'P9');

-- inserting values instructor
INSERT INTO `college_dbs`.`instructor` (`pnum`, `salary`, `dnum`) VALUES ('P6', '45000', 'D1');
INSERT INTO `college_dbs`.`instructor` (`pnum`, `salary`, `dnum`) VALUES ('P7', '50000', 'D2');
INSERT INTO `college_dbs`.`instructor` (`pnum`, `salary`, `dnum`) VALUES ('P8', '30000', 'D3');
INSERT INTO `college_dbs`.`instructor` (`pnum`, `salary`, `dnum`) VALUES ('P9', '48000', 'D4');
INSERT INTO `college_dbs`.`instructor` (`pnum`, `salary`, `dnum`) VALUES ('P10', '42000', 'D1');

-- inserting values student
INSERT INTO `college_dbs`.`student` (`pnum`, `sname`, `major`, `CGPA`, `sem_num`) VALUES ('P1', 'SHABANA AZIZ', 'COMPUTER SCIENCE', '3.24', '3');
INSERT INTO `college_dbs`.`student` (`pnum`, `sname`, `major`, `CGPA`, `sem_num`) VALUES ('P2', 'SHAFIQUE KAMRAN', 'COMPUTER SCIENCE', '3.33', '3');
INSERT INTO `college_dbs`.`student` (`pnum`, `sname`, `major`, `CGPA`, `sem_num`) VALUES ('P3', 'FARKHANDA BANO', 'ELECTRICAL ENGINEERING', '3.42', '2');
INSERT INTO `college_dbs`.`student` (`pnum`, `sname`, `major`, `CGPA`, `sem_num`) VALUES ('P4', 'SHAHRUKH KHAN', 'SOFTWARE ENGINEERING', '3.59', '2');
INSERT INTO `college_dbs`.`student` (`pnum`, `sname`, `major`,  `sem_num`) VALUES ('P5', 'MADHURI AHMAD', 'ELECTRICAL ENGINEERING', '1');

-- inserting values courses
INSERT INTO `college_dbs`.`courses` (`cnum`, `cname`, `cred_hours`, `dnum`, `inum`, `sem_num`) VALUES ('C1', 'DATABASE SYSTEMS', '4', 'D1', 'P6', '3');
INSERT INTO `college_dbs`.`courses` (`cnum`, `cname`, `cred_hours`, `dnum`, `inum`, `sem_num`) VALUES ('C2', 'LINEAR ALGEBRA', '3', 'D2', 'P7', '3');
INSERT INTO `college_dbs`.`courses` (`cnum`, `cname`, `cred_hours`, `dnum`, `inum`, `sem_num`) VALUES ('C3', 'DATA STRUCTURES & ALGORITHMS', '4', 'D1', 'P8', '3');
INSERT INTO `college_dbs`.`courses` (`cnum`, `cname`, `cred_hours`, `dnum`, `inum`, `sem_num`) VALUES ('C4', 'TECHNICAL & BUSINESS WRITING', '2', 'D4', 'P9', '3');
INSERT INTO `college_dbs`.`courses` (`cnum`, `cname`, `cred_hours`, `dnum`, `inum`, `sem_num`) VALUES ('C5', 'COAL', '4', 'D3', 'P10', '3');

-- inserting values studentassessment
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P1', 'C1', 'A1', '9.25');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P1', 'C1', 'A2', '9.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P1', 'C1', 'A3', '28.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P1', 'C1', 'A4', '42.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P2', 'C2', 'A1', '8.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P2', 'C2', 'A2', '7.21');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P2', 'C2', 'A3', '20.25');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P2', 'C2', 'A4', '39.99');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P3', 'C3', 'A1', '7.25');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P3', 'C3', 'A2', '9.00');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P3', 'C3', 'A3', '24.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P3', 'C3', 'A4', '41.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P4', 'C3', 'A1', '6.25');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P4', 'C3', 'A2', '8.95');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P4', 'C3', 'A3', '19.50');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P4', 'C3', 'A4', '39.00');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P5', 'C5', 'A1', '4.92');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P5', 'C5', 'A2', '6.25');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P5', 'C5', 'A3', '17.00');
INSERT INTO `college_dbs`.`studentassessment` (`snum`, `cnum`, `anum`, `marks_obtained`) VALUES ('P5', 'C5', 'A4', '35.50');


-- inserting values enrolled in
INSERT INTO `college_dbs`.`enrolledin` (`snum`, `cnum`, `attendance`, `grade`) VALUES ('P1', 'C1', '100.00', 'A');
INSERT INTO `college_dbs`.`enrolledin` (`snum`, `cnum`, `attendance`, `grade`) VALUES ('P2', 'C2', '85.99', 'B+');
INSERT INTO `college_dbs`.`enrolledin` (`snum`, `cnum`, `attendance`, `grade`) VALUES ('P3', 'C3', '95.42', 'B+');
INSERT INTO `college_dbs`.`enrolledin` (`snum`, `cnum`, `attendance`, `grade`) VALUES ('P4', 'C3', '74.21', 'B');
INSERT INTO `college_dbs`.`enrolledin` (`snum`, `cnum`, `attendance`, `grade`) VALUES ('P5', 'C5', '75.72', 'C');

-- inserting values studentsemester
INSERT INTO `college_dbs`.`studentsemester` (`snum`, `sem_num`, `gpa`, `status`) VALUES ('P1', '2', '3.42', 'COMPLETE');
INSERT INTO `college_dbs`.`studentsemester` (`snum`, `sem_num`, `status`) VALUES ('P2', '3', 'ONGOING');
INSERT INTO `college_dbs`.`studentsemester` (`snum`, `sem_num`, `status`) VALUES ('P3', '3' , 'ONGOING');
INSERT INTO `college_dbs`.`studentsemester` (`snum`, `sem_num`, `status`) VALUES ('P4', '3', 'ONGOING');
INSERT INTO `college_dbs`.`studentsemester` (`snum`, `sem_num`, `gpa`, `status`) VALUES ('P5', '1', '4.00', 'COMPLETE');



