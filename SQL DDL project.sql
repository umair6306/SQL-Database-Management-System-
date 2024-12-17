---project institute---
---Ques 1
create database SLAinstitute
use SLAinstitute

---Ques 3
create table tblCourse
(ID int primary key, course char(50) not null, fee money)

---Ques 6---
create table tblGender
(ID int primary key, Gender char(50) not null)

---Ques 4----
create table tblCenter
(ID int primary key,Center char(50))

---Ques 7---
create table tblTrainer
(ID int primary key, Name char(50) not null, Specilization char(50),
GenderID  int foreign key references tblGender(ID), EmailID varchar(100),
CenterID int foreign key references tblCenter(ID))

---Ques 2---
create table tblStudent 
(ID int primary key not null, Name char(50) not null, Age int CHECK(age between 18 and 150),
GenderID int, Email varchar(100) unique, Location char(50), Jobstatus char(50),
CenterID int foreign key references tblCenter(ID)) 

---Ques 5----
create table tblApply 
(AppID int primary key, StudID int foreign key references tblStudent(ID),
CourseID int foreign key references tblCourse(ID), CenterID int foreign key references tblCenter(ID))
---Ques 8-----
alter table tblStudent
add constraint FK_tblStudent_GenderID foreign key (GenderID) references tblGender(ID)
---Ques 9-----
alter table tblCenter add Head char(50)

