use Company_SD;
------------------

update Employee set Salary=Salary+Salary*0.2 where SSN=102672;
--
update Employee set Salary=Salary+((Salary*30)/100)where SSN in 
(select E.SSN from Employee E,Works_for W,Project P where E.SSN=W.ESSn and P.Pnumber=W.Pno and P.Pname='Al Rabwah')
--
update Departments set MGRSSN=968574 where Dnum=100
--
update Departments set MGRSSN=102672 where Dnum=20
--
update Employee set Superssn=102672 where SSN=102660
--
update Departments set MGRSSN=102672 where MGRSSN=223344 
--
update Works_for set ESSn=102672 where ESSn=223344
--
update Employee set Superssn=102672 where Superssn=223344


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

use AdventureWorks2012;
------------------------------

UPDATE Production.ProductDescription SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
--






