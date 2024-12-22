

use SampleBatch1Dec2024 
Select * from tblPerson 

----1. Max Salary in the tblPerson.

Select MAX(Salary)as Max_Sal from tblPerson 

----2. Max Salary & Name from the tblPerson.

Select Name , Salary from tblPerson 
Where Salary = (Select MAX(Salary)as Max_Sal from tblPerson )

----3. Second Max Salary from the tblPerson.

Select MAX(Salary)as Max_Sal from tblPerson
Where Salary <
(Select MAX(Salary)as Max_Sal from tblPerson )

--4. Second Minimum Salary from the tblPerson

Select Min(Salary)as Sec_Min_Sal from tblPerson 
Where Salary >
(Select Min(Salary)as Min_Sal from tblPerson )

--5. Select Salary which is not equal to max salary.

Select Salary   from tblPerson
Where Salary <>
(Select MAX(Salary)as Max_Sal from tblPerson )

--6. Find the 1st, 2nd, 3rd …. highest Salary. 

Select * from tblPerson Where Salary = (
Select MIN(Salary) from 
(Select Top 3 * from tblPerson Order by Salary desc )as tbl)


--7. Find then 1st, 2nd, 3rd … smallest Salary. 

Select * from tblPerson Where Salary = (
Select Max(Salary) from 
(Select Top 3 * from tblPerson Order by Salary  ) as tbl)

--8. Count City with City Name from tblPerson.

Select City, COUNT(*) from tblPerson
Group by City

--9. Display Name, City where city Count > 6.

Select Name,City from tblPerson
 where City In(
Select City from tblPerson
Group by City
having COUNT(*)>6)

Select City , Count(*) from tblPerson
Group by City
having COUNT(*)>6

--10.Highest Salary City Wise and display name of the Employee

select name ,city, Salary from tblPerson where salary in (
select max(salary) as max_sal from tblPerson group by city)

--11.Write a Query which is in Noida and delhi using IN.
Select * from tblPerson Where City in ('Delhi','Noida')

--12.Write a Query which are not in Noida and delhi using NOT IN
Select * from tblPerson Where City not in ('Delhi','Noida')

--13.Write a query find the Name, City, Salary have largest Salary where city 
--count >7 from table(tblperson).select name, city , salary from tblperson where salary in (select max(salary) as max_sal from tblperson group by city having count(*) >7)--14.Find the name of Employee who are working on Project.
--15.Find the name of Employee who are not working on Project.
--Require Table for the 11 & 12 Question tblEmp & tblProject
--tblEmp(ID,Name)
--tblProject(ID, Project Name, EID foreign key reference tblEmp(ID)

create table tblProject 
(ID int primary key , Name char(15) not null)

create table tblEmp
(ID int primary key , Ename char(15) not null , PJID int foreign key references tblProject (ID))

insert into tblProject values(1,'DE')
insert into tblProject values(2,'Zerox')
insert into tblProject values(3,'Person')
insert into tblProject values(4,'Protocol')
insert into tblProject values(5,'SLA')

insert into tblEmp (ID,EName,pjid) values(1,'Purnima',1)
insert into tblEmp (ID,EName) values(2,'Shilpa')
insert into tblEmp (ID,EName,pjid) values(3,'Vanshika',2)
insert into tblEmp (ID,EName,pjid) values(4,'Nishant',4)
insert into tblEmp (ID,EName) values(5,'Divya')
insert into tblEmp (ID,EName,pjid) values(6,'Rohit',5)
insert into tblEmp (ID,EName,pjid) values(7,'Anita',3)
insert into tblEmp (ID,EName) values(8,'Deepti')
insert into tblEmp (ID,EName,pjid) values(9,'Danish',3)
insert into tblEmp (ID,EName) values(10,'Sachin')
insert into tblEmp (ID,EName,pjid) values(11,'Prabhat',1)

select * from tblProject
select * from tblEmp

--14.Find the name of Employee who are working on Project.
select * from tblEmp
where PJID in ( select ID from tblEmp)

--15.Find the name of Employee who are not working on Project.
select Ename ,
  (select COALESCE (Ename , 'not assigned') from tblProject where ID = tblEmp.PJID) as Project from tblEmp where PJID is null; 

