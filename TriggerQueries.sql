use [SD32-Company];
-------------------
create table Audit
(
	ProjectNo nvarchar(20) primary key,
	UserName nvarchar(20) default user_name(),
	ModifiedDate datetime default getdate(),
	Budget_Old int,
	Budget_New int
)
--
create trigger UpdateTrials 
 on Company.Project
    after update
         as
            if update(Budget) 
                begin
	            insert into Audit
	            select i.ProjectNo, USER_NAME(),GETDATE(),d.Budget,i.Budget
	            from inserted i,deleted d
                end

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

use ITI;
-----------
create trigger NoInsert
on Department 
instead of insert 
as
	select 'you can’t insert a new record in that table'
--------------------------------------------------------------
create table StudentAudit
(
	serverUname varchar(50),
	ddate date,
	note varchar(50)
)

create trigger insertrow
on Student 
after insert
as
	declare @KeyValue int 
set @KeyValue = (select St_Id from inserted )
	insert into StudentAudit
	values(user_name(),GETDATE(),@KeyValue)
----------------------------------------------------------------
create trigger AddRow
on Student
instead of delete
as
declare @KeyValue int 
set @KeyValue = (select St_Id from deleted )
insert into StudentAudit
values ('try to delete Row with Key= '+ convert(nvarchar(50),@KeyValue))

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

use Company_SD;
---------------
create trigger NoInsertionMarch
on Employee
after insert
as
	if format(getdate(),'MMM')!='march'
		insert into Employee
		select * from deleted
	else
		select 'insertion not alloed on March'

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------