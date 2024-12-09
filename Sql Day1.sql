
--- How to create a database 
Create database SampleBatch1Dec24

-- which two file create when we create database 
--- MDF - Master Data File 
--- LDF - Transaction Log File 

--- how to use database 
use SampleBatch1Dec24

---- how Rename database     
--- By using Alter command 
Alter DATABASE SampleBatch1Dec24 MODIFY NAME =SampleBatch1Dec2024
		
---by using System store procedure 
sp_renamedb 'SampleBatch1Dec2024','SampleBatch1Dec24'

--- how to drop the database 
drop database SampleBatch1Dec24

--- how to create table 

--- tblPerson, tblDepart, tblGender
--- tblPerson, tblGender, tblDepart
-- tblPerson (ID, Name,Age,GenderID,City,Desig,DepartID,Salary)
--- tblGender (ID, Gender)
---tblDepart (ID, Department,Location,Head)
Create table tblGender
(ID int Primary Key,
Gender Char(30) Not Null)

Create table tblDepart
(ID int Primary Key,
Depart Char(30) Not Null,
Loc char(30),
Head char(30))

Create table tblPerson
( ID int Primary Key,
Name Char(100)Not Null,
Age int ,
GenderID int Foreign Key References tblGender(ID),
City Char(30),
Desig Char(30),
DepartID int Foreign Key References tblDepart(ID),
Salary money)

--- how to check the table properties 
-- Firstly select the table name and press Alt + F1 

---- How to add new column 
Alter table tblPerson Add PAN Char(10)

Alter table tblPerson Add temp Char(10)

--- how to alter column (size , data type)
Alter table tblPerson Alter column temp char(30) not null

--- how to rename field name 
sp_rename 'tblPerson.temp','temp1'

--- how to check all field name with data 
Select * from tblPerson 

--- how to drop field 
Alter table tblPerson Drop column temp


