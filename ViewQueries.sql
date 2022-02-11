use ITI;
---------
create view vstudent
as	select s.St_Fname + ' ' + s.St_Lname as fullname, c.Crs_Name
	from Student s, Course c,Stud_Course sc
	where sc.St_Id = s.St_Id
	and sc.Crs_Id = c.Crs_Id
	and Grade > 50

select * from vstudent
-------------------------------------------------------------------------------------
create view vmanager
with encryption 
as 
	select i.Ins_Name, t.Top_Name
	from Instructor i, Topic t,Course c,Ins_Course ins,Department d
	where c.Top_Id = t.Top_Id
	and i.Ins_Id = ins.Ins_Id
	and c.Crs_Id = ins.Crs_Id
	and d.Dept_Manager = ins.Ins_Id

select * from vmanager
-------------------------------------------------------------------------------------
create view vminstr
with schemabinding 
as 
	select i.Ins_Name,d.Dept_Name
	from dbo.Instructor i, dbo.Department d
	where i.Dept_Id = d.Dept_Id 
	and Dept_Name in('SD','Java')

select * from vminstr
--------------------------------------------------------------------------------------
create view V1
as
	select * from Student
	where St_Address in('Alex','Cairo')
	with check option

select * from V1

--------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

use Company_SD;
--------------------
create table #emp
(
	emp_name varchar(20),
	t_task varchar(20)
)
select * from #emp
----------------------------------------------------------------------------------------------------
create view vmproject
as
	select p.Pname,count(ESSn) as noofemployeeinproject
	from Project p, Works_for w, Employee e
	where w.Pno = p.Pnumber
	and w.ESSn = e.SSN
	group by p.Pname

select * from vmproject

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

use [SD32-Company];
--------------------
create view v_clerk
as
	select e.empNo, p.ProjectNo, w.Enter_Date
	from HumanResource.Employee e, company.Project p, dbo.Works_on w
	where w.ProjectNo=p.ProjectNo
	and w.EmpNo=e.EmpNo
	and job='clerck'

select * from v_clerk
---------------------------------------------------------------------------------------
create view v_without_budget
as
	select p.ProjectNo, p.ProjectName
	from company.Project p

select * from v_without_budget
---------------------------------------------------------------------------------------
create view v_count 
as
	select p.ProjectName, count(job) as numofjobs
	from company.Project p, dbo.Works_on w
	where w.ProjectNo = p.ProjectNo 
	group by p.ProjectName

select * from v_count
-------------------------------------------------------------------------------------
create view v_project_p2
as
	select *
	from v_clerk v
	where v.ProjectNo='p2'

select * from v_project_p2
---------------------------------------------------------------------------------------
alter view v_without_budget
as
	select * from company.Project 
	where ProjectNo in ('p1', 'p2')

select * from v_without_budget
---------------------------------------------------------------------------------------
drop view v_clerk
--
drop view v_count
--------------------------------------------------------------------------------------
create view vmemp
as
	select e.empNo, e.empLname
	from HumanResource.Employee e, Company.Department d
	where d.DeptNO=e.DeptNo
	and d.DeptNO='d2'

select * from vmemp

select * from vmemp where EmpLname like '%j%'
------------------------------------------------------------------------------------------
create view v_dept
as
	select DeptNO, DeptName from Company.Department

select * from v_dept

select * from v_dept

insert into v_dept
values ('d4', 'Development')

-------------------------------------------------------------------------------------------
create view v_2006_check
as
	select e.EmpNo, p.ProjectNo
	from HumanResource.Employee e, company.Project p, dbo.Works_on w
	where w.ProjectNo=p.ProjectNo
	and w.EmpNo=e.EmpNo
	and w.Enter_Date between '2006-01-01' and '2006-12-31'
	with check option
select * from v_2006_check

select * from v_dept