use [SD32-Company]
-------------------
--element
select * from HumanResource.Employee
for xml raw('Employee') ,ROOT('Employees')
--root
select * from HumanResource.Employee
for xml raw('Employee'),ELEMENTS,ROOT('Employees')

-----------------------------------------------------------------------------------
declare @docs xml ='<customers>
              <customer FirstName="Bob" Zipcode="91126">
                     <order ID="12221">Laptop</order>
              </customer>
              <customer FirstName="Judy" Zipcode="23235">
                     <order ID="12221">Workstation</order>
              </customer>
              <customer FirstName="Howard" Zipcode="20009">
                     <order ID="3331122">Laptop</order>
              </customer>
              <customer FirstName="Mary" Zipcode="12345">
                     <order ID="555555">Server</order>
              </customer>
       </customers>'

declare @hdocs int

Exec sp_xml_preparedocument @hdocs output, @docs

select * into Customers
 from  OPENXML (@hdocs, '//customer') 
WITH (FirstName varchar(20) '@FirstName',
      Zipcode int '@Zipcode',
	  orders varchar(20) 'order',
	  orderID int 'order/@ID'
	  )

Exec sp_xml_removedocument @hdocs

select * from Customers

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

use ITI;
------------
--XML Auto
select i.Ins_Name , d.Dept_Name from Instructor i , Department d
where i.Dept_Id=d.Dept_Id 
for xml auto ,elements,Root('Instructors')
--XML Path
select i.Ins_Name , d.Dept_Name from Instructor i , Department d
where i.Dept_Id=d.Dept_Id 
for xml path('Instructor'),Root('Instructors')

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

