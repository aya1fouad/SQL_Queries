use Company_SD;
----------------

select P.Pname,sum(W.Hours) from Project P,Works_for W  ,Employee e where e.SSN=w.ESSn and P.Pnumber=W.Pno group by P.Pname;
--
select D.* from Departments D,Employee E where D.Dnum=E.Dno and E.SSN in (select min(SSN) from Employee);
--
select D.Dname,max(E.Salary) as 'max salary',min(E.Salary) as 'min salary',AVG(E.Salary) as 'avg salary'
from Departments D,Employee E where E.Dno=D.Dnum group by D.Dname;
--
select*from Dependent
--
select * from Employee
--
select e.fname
from Employee e, Departments d
where e.SSN = d.MGRSSN and 0 = (select count(*) from Dependent where d.MGRSSN = Dependent.ESSN );
--
select D.Dnum,D.Dname,COUNT(E.SSN) as 'Empolyee Number' from Departments D,Employee E
where E.Dno=D.Dnum group by D.Dname,D.Dnum
having AVG(E.Salary)< (select AVG(Salary) from Employee )

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

use ITI;
----------

select MAX(Salary) as 'max salary',MIN(Salary) as 'min salary' from Instructor;
--
select Ins_Name from Instructor where Salary < (select AVG(Salary) from Instructor);
--
select distinct D.Dept_Name from Department D,Instructor I
where D.Dept_Id=I.Dept_Id and I.Salary=(select MIN(Salary) from Instructor);
--
select AVG(Salary) as 'Avg Salary' from Instructor;

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

use AdventureWorks2012;
-----------------------

select SUM(TotalDue) as 'Sum Of TotalDue' from Sales.SalesOrderHeader 
where DueDate between '7/1/2001' AND '7/31/2014'group by (OrderDate);
--
