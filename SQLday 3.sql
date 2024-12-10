
----Identity---- an IDENTITY property is used to automatically generate unique values for a column, typically for primary key columns.
----This is especially useful for generating auto-incrementing values without having to manually insert them.-------
----identity-----Autoincrement
----Identity(seed,increment)

create table tblIdentity
( ID int identity(1,1) primary key , Name char(50))

insert into tblIdentity values('aman')
insert into tblIdentity values('umair')
insert into tblIdentity values('walia')
insert into tblIdentity values('kapish')

select * from tblIdentity

delete from tblIdentity where ID = 3

-----identity on 
set identity_insert tblIdentity ON
insert into tblIdentity (ID,Name) values(3,'jyoti')

set identity_insert tblIdentity OFF
insert into tblIdentity values('vikrant')
insert into tblIdentity values('rudra')

delete from tblIdentity

 -----truncate----  the TRUNCATE command is used to delete all rows from a table quickly and efficiently.---
 -----TRUNCATE is generally faster for large tables.-------
 
truncate table tblIdentity    

---identity Reseed----The IDENTITY column is an auto-incrementing value, and sometimes you may want to reseed (or reset) it.
---For example, if you delete all rows from a table and want the next inserted row to start with a specific value, 
 --you would use the DBCC CHECKIDENT command to reseed the identity value.---

DBCC CHECKIDENT ('tblidentity',RESEED,100)


