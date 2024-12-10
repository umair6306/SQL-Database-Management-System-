
---constraints-----
---types of constraints ---1)Not null---2)Unique---3)Primary key---4)Foreign key---5)default--6)index--7)check---
----Not Null Constraint---

create table tblNotNull
(ID int primary key,
Name char(50) Not Null,
Age int)

---how to apply  NotNull on the existing table or a column---

alter table tblNotNull
alter column Age int Not Null

---Unique constraints in a new table ---

create table tbleUnique
(ID int primary key,
Name char(50),
Mob char(10) Unique,
Email Varchar(50))

---how to apply unique on the existing table or a column---

alter table tbleUnique
add constraint UQ_tblUnique_Email Unique(Email)

----Primary key---

create table tblPrimarykey
(ID int,
Name char(30))

---how to apply primary key on the existing table or column---
---if the column nulltable then we cannot apply primary key
---firstly we will apply not null then we can apply primary key---

alter table tblPrimarykey
alter column ID int Not Null

alter table tblPrimarykey
add constraint PK_tblPrimarykey_ID primary key (ID)

---Foreign key---

create table tblFKdepart
(ID int Primary key ,
Depart char(20))

create table tblFKGender
(ID int primary key,
Gender char(20))

create table tblFKEmp
(ID int primary key,Name char(25) Not Null,
GenderID int foreign key references tblFKGender(ID),
DepartID int)

-----how to apply Foreign key on the existing table or a column--

alter table tblFKEmp
add constraint FK_tblFKEmp_DeaprtID Foreign key(DepartID) references tblFKDepart(ID)

----checks---

create table tblcheck
(ID int primary key , Name char(30) Not Null,
Age int check (Age >=18 and Age <=70),
Salary Money)

---how to apply checks on the existing table or a column---

alter table tblcheck
add constraint CK_tblcheck_Salary check (Salary >=18000)

--Default--

create table tblDefault
(ID int primary key , Name char(30) Not Null ,
Age int Default 18,
city char(50))

---how to apply default on the existing table or a column---

alter table tblDefault
add constraint DF_tblDefault_city Default 'Delhi' for city
