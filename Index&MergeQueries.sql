use ITI;
-------------
create nonclustered index myindex
on Department(manager_hiredate);
--
create unique index iage
on Student(St_Age);

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

use Company_SD;
----------------
create table LastTrans
(
	userid int,
	Trans int
)
--
create table DailyTrans
(
	userid int,
	Trans int
)
--
insert into LastTrans
values (1,1000),(2,2000),(3,3000)
--
select * from LastTrans

insert into DailyTrans
values (1,4000),(4,2000),(2,10000)
--
select * from DailyTrans
--
merge into LastTrans as L
using DailyTrans D
on L.userid = D.userid
when matched then
	update set L.Trans = D.Trans
when not matched then 
	insert values(D.userid,D.Trans);