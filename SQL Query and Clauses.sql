
use SampleBatch1Dec2024

---Query---

---select all column---

select * from tblPerson
select * from tblDepart
select * from tblGender

---select specific column column using Alias ---
select P.Name , P.Age , P.salary , P.city from tblPerson P

select city from tblPerson

---Unique City =Distinct--
select Distinct(City) from tblPerson

---Aggregate function ----sum,max, min, avg---

select SUM(Salary) as totalsal from tblPerson
select max(salary) as [Max salary] from tblPerson
select min(salary) as [Min salary] from tblPerson
select Avg(salary) as [Avg salary] from tblPerson

update tblPerson set city =null where ID in(2,26,38,44)

select count(*) as [row count], count(city) as [city count] from tblPerson

----Clauses--
----Where , groupBy , having , Order By

---where clause is used for filter the data

select * from tblPerson where city = 'delhi' or city ='Noida'

select * from tblPerson where Age =33 or Age=38

select * from tblPerson where Age >=33 or Age<=38

select * from tblPerson where Age >=20 and Age<=25 or Age >=30 and Age <=35

select * from tblPerson where Age in(25,27,29,32)

---Wild Card ---- data searching pattern

select * from tblPerson where Name like 'A%'
select * from tblPerson where Name like 'A%t'
select * from tblPerson where Name like 'A__t'
select * from tblPerson where Name like '[KVPS]%'
select * from tblPerson where Name like '[^KVPS]%'

---Group By  --summary

select city, sum(salary) as totalsal from tblPerson group by city
select city, sum(salary) as totalsal, Max(salary) as Maxsal from tblPerson group by city
select city, desig, sum(salary) as totalsal from tblPerson group by city, desig order by city 

---order By ---sorting by Default ascending 

select * from tblPerson order by  Name
select * from tblPerson order by city  desc
select * from tblPerson order by city  desc, desig asc
select * from tblPerson order by desig asc, city desc

------Having---

select City,sum(salary) as totalsal from tblPerson group by city
having sum(salary)>=50000

select city, count(*) as totalsal from tblPerson where city in ('delhi','noida','Faridabad','gazibad')
group by city having count(*)>2 order by totalsal 

---Top 

select top 3 * from tblPerson
select top 3 * from tblPerson order by salary desc
select top 3 * from tblPerson order by Salary asc

