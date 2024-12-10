
----identity ka use hum kise column ko sequence wise value dene ke liye karte h jaise agar hum chahte h ID ki indexing 1 se shuru ho aur apne app 
----badhti chali jaye jabtak ham data ko insert kare----
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

 -----truncate---- indexing ko reset kar deta h mtlb 1 se shuru kar deta h
truncate table tblIdentity    

---identity Reseed----ki help se hum identity column ko kisi bhi no se start kar sakte h jaise agar hame indexing karni h 100 se to hum identity 
----------------------reseed ka istemal karenge

DBCC CHECKIDENT ('tblidentity',RESEED,100)


