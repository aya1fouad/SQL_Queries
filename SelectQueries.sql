use Company_SD;
---------------

select * from Employee ;
--
select Fname ,Lname ,Salary ,Dno from Employee;
--
select Pname,Plocation ,Dname from Project ,Departments where Project.Dnum =Departments.Dnum;
--
select Fname+' '+Lname as [Full Name] ,Salary*12*0.1 as [ANNUAL COMM] from Employee;
--
select SSN ,Fname+' '+Lname as [Full Name] from Employee where Salary>1000;
--
select SSN ,Fname+' '+Lname as [Full Name] from Employee where Salary*12>10000;
--
select Fname+' '+Lname as [Full Name] ,Salary from Employee where Sex='f';
--
select  Dnum ,Dname from Departments where MGRSSN=968574;
--
select Pname ,Pnumber ,Plocation from Project where Dnum=10;
--
select d.*,Fname from Dependent d , Employee e where d.ESSN=e.SSN;
--
select Pname ,Pnumber , Plocation from Project where City in ('Cairo','Alex');
--
select *from Project where Pname like 'a%';
--
select * from Employee where Dno=30 and Salary between 1000 and 2000;
--
select e.Fname from Employee e ,Works_for w , Project p where w.ESSn=e.SSN and p.Pnumber=w.Pno 
and e.Dno=10 and w.Hours>=10 and p.Pname='AL Rabwah';
--
select e.Fname as employees ,m.Fname as manager from Employee e, Employee m where e.Superssn=m.SSN and m.Fname+' '+m.Lname='Kamel Mohamed';
--
select Fname ,Pname from Employee e,Project p,Works_for w where e.SSN=w.ESSn and w.Pno=p.Pnumber order by Pname; 
--
select p.Pnumber, d.Dname ,e.Lname, e.Address ,e.Bdate from Project p , Departments d, Employee e 
where p.City ='Cairo' and p.Dnum=d.Dnum and d.MGRSSN=e.SSN;
--
select E.Fname,E.Lname,P.Pname from Employee E,Project P,Works_for W where W.ESSn=E.SSN and W.Pno=P.Pnumber 
order by E.Dno,2,1
--
select E.Fname+' '+E.Lname as 'fullName' from Employee E,Dependent D 
where E.SSN=D.ESSN and D.Dependent_name like '%'+E.Fname+'%'
--
select SSN,Fname from Employee where exists(select SSN from Employee,Dependent where ESSN =SSN)

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

use ITI;
-------------

select count(St_Id) as studentsNumber from Student where St_Age is not NULL;
--
select distinct I.Ins_Name from Instructor I;
--
select S.St_Id as 'Student ID',(ISNULL(S.St_Fname,'')+' '+ISNULL(S.St_Lname,'')) as 'Student Full Name',
D.Dept_Name as 'Department Name' from Student S,Department D where S.Dept_Id=D.Dept_Id ;
--
select S.St_Fname+' '+S.St_Lname as 'Student Full Name',C.Crs_Name as 'Course Name'
from Student S ,Course C,Stud_Course SC
where S.St_Id=SC.St_Id and C.Crs_Id=SC.Crs_Id and SC.Grade is not NULL;
--
select  Ins_Name , COALESCE(SaLary,0) from Instructor;
--
select S2.St_Fname+' '+S2.St_Lname as 'Student Full Name' ,S1.* from Student S1, Student S2
where S1.St_Id=S2.St_super;

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

use AdventureWorks2012;
---------------------------

select SalesOrderID ,ShipDate from Sales.SalesOrderHeader
where  OrderDate between '7/28/2002' and '7/29/2014';
--
select ProductID, Name from Production.Product where StandardCost < 110;
--
select ProductID , Name from Production.Product where Weight  IS NULL;
--
select * from Production.Product where COLOR IN ('SILVER','BLACK','Red');
--
select * from Production.Product where Name LIKE 'B%';
--
select PP.* from Production.Product PP, Production.ProductDescription PD
where PD.ProductDescriptionID =PP.ProductID and PD.Description LIKE '%[_]%'
--
select distinct HireDate from HumanResources.Employee;
--
select AVG(distinct ListPrice) as 'average of the unique ListPrices' from Production.Product;
--
select 'The'+Name+' is only!'+ CONVERT (VARCHAR(50),ListPrice) as 'list price'
from Production.Product where ListPrice between 100 and 120 order by ListPrice;
---------------

select @@VERSION;
--
select @@SERVERNAME;

------------------- 


