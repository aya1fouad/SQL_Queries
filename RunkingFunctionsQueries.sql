use ITI;
----------

select top(2) Salary from Instructor order by Salary desc;
--
select * from( select *,ROW_NUMBER() OVER(PARTITION BY Dept_id ORDER BY Salary desc) as RN from Instructor) AS New_table
where RN<=2
--
select * from( select *,ROW_NUMBER() OVER(PARTITION BY Dept_id ORDER BY NEWID() desc) as RN from Student) as New_table
where RN=1
--


