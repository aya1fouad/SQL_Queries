use ITI
------------
create function rMonthName(@da date)
returns varchar(10)
	begin
		declare @moname varchar(10)
		 select @moname= FORMAT(@da,'MMMM')
		return @moname
	end
select dbo.rMonthName(GETDATE())
----------------------------------------------------------
create function numbers (@num1 int , @num2 int)
returns @numbers table
	(
		num int
	)
as
	begin
		if @num1>@num2
			while @num1>@num2
			begin
				select @num2+=1
					if @num1=@num2
					break
				insert into @numbers
				select @num2
			end
		else if @num2>@num1
			while @num2>@num1
			begin
				select @num2-=1
					if @num1=@num2
					break
				insert into @numbers
				select @num2
			end
		return
	end
select * from numbers(1,10)
-------------------------------------------------------------------------------------
create function retStudentInfo (@studentNo int)
returns table
as
	return
	(
		select D.Dept_Name,S.St_Fname+' '+S.St_Lname as 'full name'
		from Department D,Student S
		where S.Dept_Id=D.Dept_Id and S.St_Id=@studentNo
	)

select * from retStudentInfo(3)
----------------------------------------------------------------------------------------
create function retMessage(@studentId int)
returns varchar(30)
	begin 
		declare @fname varchar(30)
		select @fname= S.St_Fname from Student S where S.St_Id=@studentId
		declare @lname varchar(30)
		select @lname= S.St_Lname from Student S where S.St_Id=@studentId
		declare @message varchar(30)

		if @fname is null and @lname is null
			set @message ='First name & last name are null'
		else if @fname is null 
			set @message ='first name is null'
		else if @lname is null 
			set @message ='last name is null'
		else 
			set @message ='First name & last name are not null'

		return @message
	end

select dbo.retMessage(9)
select dbo.retMessage(13)
select dbo.retMessage(14)
---------------------------------------------------------------------------------------------
create function hiringDate(@hiringFormat int)
returns table
as
	return
	(
		select D.Dept_Name,I.Ins_Name,CONVERT(varchar(20),D.Manager_hiredate,@hiringFormat)as 'hiring date'
		from Department D , Instructor I
		where I.Ins_Id=D.Dept_Manager
	)

select * from hiringDate(104)
select * from hiringDate(105)
select * from hiringDate(106)
-------------------------------------------------------------------------------------------------
create function retStudents(@str varchar(20))
returns @studentNames table 
	(
		studentName varchar(20)
	)
as
	begin
		if @str='first name'
		begin
			insert into @studentNames
			select ISNULL(S.St_Fname,'no firstname') from Student S
		end
		else if @str='last name'
		begin
			insert into @studentNames
			select ISNULL(S.St_Lname,'no lastname')from Student S
		end
		else if @str='full name'
		begin
			insert into @studentNames
			select ISNULL(S.St_Fname,'no firstname')+' '+ISNULL(S.St_Lname,'no lastname') as 'full name' from Student S
		end
		return 
	end

select * from retStudents('first name')
select * from retStudents('last name')
select * from retStudents('full name')
-------------------------------------------------------------------------------------------------------------
select S.St_Id,SUBSTRING(S.St_Fname,1,LEN(S.St_Fname)-1) as 'firstname cutted' from Student S
-------------------------------------------------------------------------------------------------------------
declare @col varchar(20)='*',@t varchar(20)='student'
execute('select '+@col+'from '+@t)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
use Company_SD
---------------
create function retEmployees (@projectNo int)
returns table
as
	return
	(
		select * 
		from Employee E,Works_for W
		where E.SSN=W.ESSn and W.Pno=@projectNo
	)

select * from retEmployees(100)
select * from retEmployees(700)

---------------------------------------------------------------------------------------------------------
select * into EmployeeCopy from Employee where 1=2

declare @counter int =1
while @counter<=3000
begin
	insert into EmployeeCopy(SSN,Fname,Lname,Dno)
	values(@counter,'Smith','Jane',1)
	select @counter+=1
end

select * from EmployeeCopy
--------------------------------------------------------------------------------------------------------


