use ITI;
----------
create proc nstud
as
	select count(*) ,Dept_Name from Student s , Department d
	where s.Dept_Id=d.Dept_Id
	group by Dept_Name

nstud

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

use [SD32-Company];
-------------------
create proc checkEmp 
as
if (select COUNT(*) from Works_on where ProjectNo='p1') > 3
	print 'The number of employees in the project p1 is 3 or more'
else
	print 'The following employees work for the project p1'

	select EmpFname+' '+EmpLname as 'Name'
	from HumanResource.Employee e, Works_on w
	where e.EmpNo=w.EmpNo
	and w.ProjectNo='P1'

checkEmp
-----------------------------------------------------------------------------
create proc ONPROJECT @OldEmpNumber int , @NewEmpNumber  int ,@ProjectNumber int
as
	update Works_on 
	set EmpNo=@NewEmpNumber
	where EmpNo=@OldEmpNumber 
	      and ProjectNo=@ProjectNumber

ONPROJECT 2 ,1 ,2

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


