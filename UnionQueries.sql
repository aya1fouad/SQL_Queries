use Company_SD;
----------------

select MAX(Salary) from Employee
union 
select MAX(Salary) from Employee where Salary < (select MAX(Salary) from Employee )

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

use AdventureWorks2012;
------------------------

select CONVERT(VARCHAR(30),GETDATE()) as 'today’s date'
union
select CONVERT(VARCHAR(30),GETDATE(),1)
union
select CONVERT(VARCHAR(30),GETDATE(),3)
--
