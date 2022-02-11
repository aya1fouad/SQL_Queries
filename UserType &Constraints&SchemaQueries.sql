use [SD32-Company]
--------------------
sp_addtype loc,'nchar(2)'
create default def1 as 'NY'
sp_bindefault def1,loc
create rule r1 as @x in ('NY','DS','KW')
sp_bindrule r1,loc
--
create table Department(
DeptNo loc not null primary key,
DeptName varchar(20),
Location loc
)
--
create table Employee(EmpNo int not null,EmpFname varchar(20) not null,EmpLname varchar(20) not null,DeptNo loc,Salary int)

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

alter table Employee add constraint c1 primary key (EmpNo)
--
alter table Employee add constraint c2 foreign key (DeptNo) references Department(DeptNo)
--
alter table Employee add constraint c3 unique (salary)
--
create rule r2 as @x<6000
sp_bindrule r2, 'Employee.Salary'
--
insert into works_on (EmpNo, ProjectNo)
values(11111, 'p1')
--
update works_on set EmpNo=101022 where EmpNo= 11111 
--
update Employee set EmpNo=22222 where EmpNo=10102
--
delete from Employee where EmpNo=10102
--
alter table Employee add TelephoneNumber int
--
alter table Employee drop column TelephoneNumber

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

create schema Company
--
alter schema Company transfer Department
--
alter schema Company transfer Project
--
create schema HumanResource
--
alter schema HumanResource transfer Employee
--
sp_helpconstraint N'HumanResource.Employee'
--
create synonym Emp for HumanResource.Employee
--
Select * from [HumanResource].Employee
--
Select * from Emp 
--
update Company.Project  set Company.project.budget =Company.project.budget+ Company.project.budget * 0.1 
from dbo.works_on, company.Project
where  dbo.works_on.empno = 10102 and company.project.projectno = dbo.works_on.projectno
--
update Company.Department set DeptName='Sales'
from Company.Department d, HumanResource.Employee e
where d.DeptNo=e.DeptNo and e.EmpFname='Ann'
--
update works_on
set enter_date = '12.12.2007'
from HumanResource.Employee, works_on, company.Department
where works_on.ProjectNo = 'p1' and works_on.EmpNo = HumanResource.Employee.EmpNo  
and HumanResource.Employee.DeptNo = company.Department.DeptNO  and Company.Department.DeptName ='sales'
--
delete from works_on
where works_on.EmpNo in (select works_on.EmpNo from works_on, HumanResource.Employee, company.Department 
	where works_on.EmpNo = HumanResource.Employee.EmpNo and HumanResource.Employee.DeptNo = Company.Department.DeptNO 
	and Company.Department.Location = 'KW')
--