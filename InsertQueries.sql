use Company_SD;
----------------

insert into Employee (Fname,Lname,SSN,Bdate,Address,Superssn,Sex,Salary,Dno)
values ('aya','fouad',102672,1/8/1998,'suez',112233,'f',3000,30);
--
insert into Employee (Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values ('mai','ali',102660,20/3/1998,'suez','f',30);

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

use AdventureWorks2012;
------------------------------

select rowguid, Name ,SalesPersonID , Demographics 
    into store_Archive from Sales.Store;
--
select rowguid, Name ,SalesPersonID , Demographics 
    into second_store_Archive from Sales.Store where 1=2;
--





