
use SampleBatch1Dec2024

select * from tblPerson

---ques 1--- how to find the highest salaries for each city.

select city, max(salary) as max_sal from tblPerson group by city

----ques 2----- how to find the highest salaries for each designation.

select Desig, max(salary) as max_sal from tblPerson group by Desig

----ques 3---- how to find the highest salaries for each city in it for each job.

select city,desig , max(salary) as max_sal from tblPerson group by city,desig

---ques 4--- how to find the number of employee working in each city.

select city, count(*) as working_count from tblperson group by city

---ques 5--- how to find the number of employees working for each city only if the number is greater than 3.

select city , count(*) as working_count from tblperson group by city
having count(*) >3 order by city

--ques 6--- how to find the number of executive working for each city.

select city,count(*) as working_count from tblPerson where desig = 'executive' group by city

---ques 7--- how to find the number of analyst working for each city only if the count is greater than 2

select city,count(*) as working_count from tblPerson where desig = 'executive' group by city having count(*) >2
