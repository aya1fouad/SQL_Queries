use Company_SD;
---------------

select Dnum ,Dname, Fname from Departments d inner join Employee e on d.MGRSSN=e.SSN;
--
select Pname , Dname from Project p inner join Departments d on p.Dnum=d.Dnum;
--
select m.* from employee m inner join Departments d on m.SSN=d.MGRSSN;
--
select e.*,d.* from Employee e left outer join Dependent d on e.SSN=d.ESSN;
--
select D.Dependent_name ,D.Sex from Dependent D inner join Employee E on E.SSN =D.ESSN
where D.Sex= 'F' and E.Sex='F'
union all
select D.Dependent_name ,D.Sex from Dependent D inner join Employee E on E.SSN =D.ESSN
where D.Sex= 'M' and E.Sex='M';

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

use ITI;
----------

select I.Ins_Name, D.Dept_Name FROM Instructor I LEFT OUTER JOIN Department D ON I.Dept_Id=D.Dept_Id;
--







