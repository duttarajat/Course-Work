create database Assignment_SQL_Queries

use Assignment_SQL_Queries

CREATE TABLE Studies
(	PNAME varchar(20)
	,	INSTITUTE varchar(20)
	,	COURSE varchar(20)
	,	COURSE_FEE int
)

INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000

CREATE TABLE Software
(
	PNAME varchar(20)
	,	TITLE varchar(20)
	,	DEVELOPIN varchar(20)
	,	SCOST decimal(10,2)
	,	DCOST int
	,	SOLD int
)

INSERT INTO Software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6

CREATE TABLE Programmer
(
	PNAME varchar(20)
	,	DOB date
	,	DOJ date
	,	GENDER varchar(2)
	,	PROF1 varchar(20)
	,	PROF2 varchar(20)
	,	SALARY int
)

INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500

--1. Find out the selling cost AVG for packages developed in Pascal.
select CAST(AVG(SCOST) as decimal(10,2)) [Pascal AVG Selling Cost] from Software where DEVELOPIN = 'Pascal'

--2. Display Names, Ages of all Programmers.
select PNAME, DATEDIFF(yy,DOB,GETDATE()) AGE from Programmer

--3. Display the Names of those who have done the DAP Course.
select PNAME from Studies where COURSE = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January.
select PNAME, DOB from Programmer where MONTH(DOB) = 1

--5. What is the Highest Number of copies sold by a Package?
select MAX(SOLD) [Max Sold] from Software

--6. Display lowest course Fee.
select MIN(COURSE_FEE) [Lowest Course Fee] from Studies

--7. How many programmers done the PGDCA Course?
select COUNT(PNAME) [PGDCA Programmers] from Studies where COURSE = 'PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.
select SUM(SCOST * SOLD) [Revenue from C Packages] from Software where DEVELOPIN = 'C'

--9. Display the Details of the Software Developed by Ramesh.
select * from Software where PNAME = 'Ramesh'

--10. How many Programmers Studied at Sabhari?
select COUNT(PNAME) [Sabhari Student Count] from Studies where INSTITUTE = 'Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.
select * from Software where (SCOST * SOLD) > 2000 order by (SCOST * SOLD) DESC

--12. Display the Details of Packages for which Development Cost have been recovered.
select * from Software where (SCOST*SOLD) > DCOST order by (SCOST*SOLD) DESC

--13. What is the cost of the costliest software development in Basic? 
select MAX(DCOST) [Max DCOST - Basic] from Software where DEVELOPIN = 'Basic'

--14. How many Packages Developed in DBASE?
select COUNT(TITLE) [DBASE Packages] from Software where DEVELOPIN = 'DBASE'

--15. How many programmers studied in Pragathi?
select COUNT(PNAME) [Pragathi Student Count] from Studies where INSTITUTE = 'Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?
select COUNT(PNAME) [Paid Fee - 5K & 10K] from Studies where COURSE_FEE between 5000 and 10000

--17. What is AVG Course Fee
select AVG(COURSE_FEE) [Avg Course Fee] from Studies

--18. Display the details of the Programmers Knowing C.
select * from Programmer where PROF1 = 'C' or PROF2 = 'C'

--19. How many Programmers know either COBOL or PASCAL.
select COUNT(PNAME) [No. of COBOL/PASCAL Programmers] from Programmer where PROF1 in ('COBOL','PASCAL') or PROF2 in ('COBOL','PASCAL')

--20. How many Programmers Don’t know PASCAL and C
select COUNT(PNAME) [No. of non PASCAL/C Programmers] from Programmer where not(PROF1 in ('PASCAL','C') or PROF2 in ('PASCAL','C'))

--21. How old is the Oldest Male Programmer.
select MAX(DATEDIFF(yy,DOB,GETDATE())) [Oldest Male Programmer] from Programmer where GENDER = 'M'

--22. What is the AVG age of Female Programmers?
select AVG(DATEDIFF(yy,DOB,GETDATE())) [Female Programmer Avg Age] from Programmer where GENDER = 'F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select PNAME, DATEDIFF(yy,DOJ,GETDATE()) Experience from Programmer order by Experience desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month? 
select PNAME, DOB from Programmer where MONTH(DOB) = MONTH(GETDATE())

--25. How many Female Programmers are there?
select COUNT(*) [No. of Female Programmers] from Programmer where GENDER = 'F'

--26. What are the Languages studied by Male Programmers.
select PNAME, PROF1, PROF2 from Programmer where GENDER='M'

--27. What is the AVG Salary?
select AVG(SALARY) Avg_Salary from Programmer

--28. How many people draw salary 2000 to 4000?
select COUNT(*) [No. of Programmers drawing 2K to 4K Salary] from Programmer where SALARY between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from Programmer where PROF1 not in ('Clipper','COBOL', 'PASCAL') and PROF2 not in ('Clipper','COBOL', 'PASCAL')

--30. Display the Cost of Package Developed By each Programmer.
select PNAME, SUM(DCOST) [Package Cost] from Software group by PNAME order by SUM(DCOST) desc

--31. Display the sales values of the Packages Developed by the each Programmer.
select PNAME, SUM(SCOST*SOLD) [Sales Value] from Software group by PNAME order by SUM(SCOST*SOLD) desc

--32. Display the Number of Packages sold by Each Programmer.
select PNAME, SUM(SOLD) [Packages Sold] from Software group by PNAME order by SUM(SOLD) desc

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select TITLE, PNAME, DEVELOPIN, SUM(SCOST) [Sales Cost] from Software group by DEVELOPIN, TITLE, PNAME

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select DEVELOPIN
	, AVG(DCOST) Avg_Development_Cost
	, CAST(AVG(SCOST) as decimal (10,2)) Avg_Selling_Cost
	, CAST(AVG(SCOST/NULLIF(SOLD,0)) as decimal (10,2)) [Avg_Price/Copy]
from Software group by DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select PNAME, MAX(DCOST) Costliest_Package, MIN(DCOST) Cheapest_Package from Software group by PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
select INSTITUTE, COUNT(COURSE) [No. of Courses], AVG(COURSE_FEE) [Avg Course Fee] from Studies group by INSTITUTE

--37. Display each institute Name with Number of Students.
select INSTITUTE, COUNT(PNAME) [No. of Students] from Studies group by INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
select PNAME, GENDER from Programmer

--39. Display the Name of Programmers and Their Packages.
select PNAME, TITLE from Software

--40. Display the Number of Packages in Each Language Except C and C++.
select DEVELOPIN [Language], COUNT(TITLE) [No. of Packages] from Software where DEVELOPIN not in ('C','CPP')
group by DEVELOPIN order by [No. of Packages] desc

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select DEVELOPIN Language, DCOST [Development Cost], COUNT(TITLE) [No. of Titles] from Software where DCOST < 1000 group by DEVELOPIN, DCOST

--42. Display AVG Difference between SCOST, DCOST for Each Package.
select TITLE Package, CAST((DCOST - SCOST) as decimal(10,2)) [Cost Difference] from Software order by [Cost Difference] desc

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select PNAME, DCOST, SCOST, SOLD, (SCOST*SOLD) Revenue, DCOST-(SCOST*SOLD) [Amt Yet to Recover] from Software where DCOST-(SCOST*SOLD) > 0

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
select MAX(Salary) Max_Salary, MIN(Salary) Min_Salary, AVG(Salary) Avg_Salary from Programmer where SALARY > 2000

--45. Who is the Highest Paid C Programmers?
select PNAME [Highest Paid C Programmer] from Programmer where (PROF1 = 'C' or PROF2 = 'C') and SALARY = 
(select MAX(SALARY) from Programmer where PROF1 = 'C' or PROF2 = 'C')

--46. Who is the Highest Paid Female COBOL Programmer?
select PNAME [Highest Paid Female COBOL Programmer] from Programmer where (PROF1 = 'COBOL' or PROF2 = 'COBOL') and GENDER='F' and SALARY = 
(select MAX(SALARY) from Programmer where (PROF1 = 'COBOL' or PROF2 = 'COBOL') and GENDER='F')

--47. Display the names of the highest paid programmers for each Language.
select PROF1 PROF, MAX(SALARY) Highest_Pay into #HPPEL from Programmer group by PROF1
insert into #HPPEL select PROF2, MAX(SALARY) from Programmer group by PROF2
select PROF, MAX(Highest_Pay) Highest_Pay into #HPPELS from #HPPEL group by PROF
select PNAME, PROF, Highest_Pay from Programmer inner join #HPPELS on PROF=PROF1 or PROF=PROF2 where Highest_Pay = SALARY order by PROF

--48. Who is the least experienced Programmer.
select PNAME from Programmer where DOJ = (select MAX(DOJ) from Programmer)

--49. Who is the most experienced male programmer knowing PASCAL.
select PNAME from Programmer where GENDER='M' and (PROF1 = 'PASCAL' or PROF2 = 'PASCAL') and DOJ = 
(select MIN(DOJ) from Programmer where GENDER='M' and (PROF1 = 'PASCAL' or PROF2 = 'PASCAL'))

--50. Which Language is known by only one Programmer?
select PNAME, PROF1 PROF into #OLP from Programmer
insert into #OLP select PNAME, PROF2 PROF from Programmer
select PROF from #OLP group by PROF having COUNT(PNAME)=1

--51. Who is the Above Programmer Referred in 50?
select PNAME, PROF1 PROF into #OLP1 from Programmer
insert into #OLP1 select PNAME, PROF2 PROF from Programmer
select distinct PNAME from #OLP1 where PROF in (select PROF from #OLP1 group by PROF having COUNT(PNAME)=1)

--52. Who is the Youngest Programmer knowing DBASE?
select PNAME from Programmer where (PROF1 = 'DBASE' or PROF2 = 'DBASE') and DOB = (select MAX(DOB) from Programmer)

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
select PNAME from Programmer where GENDER='F' and
Salary>3000 and PROF1 not in ('C','CPP','ORACLE','DBASE') and PROF2 not in ('C','CPP','ORACLE','DBASE')

--54. Which Institute has most number of Students?
select INSTITUTE, COUNT(INSTITUTE) Count into #TINS from Studies group by INSTITUTE
select * from #TINS where Count = (select MAX(Count) from #TINS)

--55. What is the Costliest course?
select COURSE from Studies where COURSE_FEE = (select MAX(COURSE_FEE) from Studies)

--56. Which course has been done by the most of the Students?
select COURSE, COUNT(COURSE) COUNT into #CC from Studies group by COURSE
select * from #CC where COUNT = (select MAX(COUNT) from #CC)

--57. Which Institute conducts costliest course.
select INSTITUTE from Studies where COURSE_FEE = (select MAX(COURSE_FEE) from Studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.
select INSTITUTE, COURSE from Studies where COURSE_FEE < (select AVG(COURSE_FEE) from Studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
select INSTITUTE, COURSE from Studies
where COURSE_FEE between (select AVG(COURSE_FEE)-1000 from Studies) and (select AVG(COURSE_FEE)+1000 from Studies)

--60. Which package has the Highest Development cost?
select TITLE from Software where DCOST = (select MAX(DCOST) from Software)

--61. Which course has below AVG number of Students?
select COURSE, CAST(COUNT(COURSE) as decimal (4,2)) Count into #ACRS from Studies group by COURSE
select COURSE from #ACRS where Count < (select AVG(Count) from #ACRS)

--62. Which Package has the lowest selling cost?
select TITLE from Software where SCOST = (select MIN(SCOST) from Software)

--63. Who Developed the Package that has sold the least number of copies? 
select PNAME from Software where SOLD = (select MIN(SOLD) from Software)

--64. Which language has used to develop the package, which has the highest sales amount?
select DEVELOPIN from Software where SCOST*SOLD = (select MAX(SCOST*SOLD) from Software)

--65. How many copies of package that has the least difference between development and selling cost where sold.
select SOLD from Software where DCOST - SCOST = (select MIN(DCOST - SCOST) from Software)

--66. Which is the costliest package developed in PASCAL.
select TITLE from Software where DEVELOPIN = 'PASCAL' and DCOST = (select MAX(DCOST) from Software where DEVELOPIN='PASCAL')

--67. Which language was used to develop the most number of Packages.
select DEVELOPIN, COUNT(TITLE) Count into #CDI from Software group by DEVELOPIN
select DEVELOPIN from #CDI where Count = (select MAX(Count) from #CDI)

--68. Which programmer has developed the highest number of Packages?
select PNAME, COUNT(PNAME) Count into #PMX from Software group by PNAME
select PNAME from #PMX where Count = (select MAX(Count) from #PMX)

--69. Who is the Author of the Costliest Package?
select PNAME from Software where SCOST = (select MAX(SCOST) from Software)

--70. Display the names of the packages, which have sold less than the AVG number of copies.
select TITLE, SOLD from Software where SOLD < (select AVG(SOLD) from Software) order by SOLD

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
select TITLE, PNAME from Software where SCOST*SOLD > DCOST*2

--72. Display the programmer Name and the cheapest packages developed by them in each language.
select PNAME, MIN(DCOST) Lowest_Development_Cost from Software group by PNAME

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
select PNAME, MAX(SOLD) Highest_Selling_Package into #HSP from Software where SOLD<>0 group by PNAME
select PNAME, MIN(SOLD) Lowest_Selling_Package into #LSP from Software where SOLD<>0 group by PNAME
select #HSP.PNAME, Highest_Selling_Package, DEVELOPIN HSP_Language into #HSP1 from #HSP
left join Software on #HSP.PNAME=Software.PNAME where Highest_Selling_Package=SOLD
select #LSP.PNAME, Lowest_Selling_Package, DEVELOPIN LSP_Language into #LSP1 from #LSP
left join Software on #LSP.PNAME=Software.PNAME where Lowest_Selling_Package=SOLD
select #HSP1.PNAME, Highest_Selling_Package, HSP_Language, Lowest_Selling_Package, LSP_Language from #HSP1
full join #LSP1 on #HSP1.PNAME=#LSP1.PNAME

--74. Who is the youngest male Programmer born in 1965?
select * into #YMP from Programmer where GENDER='M' and YEAR(DOB)=1965
select PNAME from #YMP where DOB = (select MAX(DOB) from #YMP)

--75. Who is the oldest Female Programmer who joined in 1992?
select * into #OFP from Programmer where GENDER='F' and YEAR(DOJ)=1992
select PNAME from #OFP where DOJ = (select MAX(DOJ) from #OFP)

--76. In which year was the most number of Programmers born.
select YEAR(DOB) Year, COUNT(YEAR(DOB)) Count into #PBY from Programmer group by YEAR(DOB)
select Year from #PBY where Count = (select MAX(Count) from #PBY)

--77. In which month did most number of programmers join?
select MONTH(DOJ) Month, COUNT(MONTH(DOJ)) Count into #PJM from Programmer group by MONTH(DOJ)
select Month from #PJM where Count = (select MAX(Count) from #PJM)

--78. In which language are most of the programmer’s proficient.
select PROF1 PROF into #PROFT from Programmer union all select PROF2 from Programmer
select Prof, COUNT(Prof) Count into #PROFT1 from #PROFT group by PROF
select Prof from #PROFT1 where Count=(select MAX(Count) from #PROFT1)

--79. Who are the male programmers earning below the AVG salary of Female Programmers?
select PNAME from Programmer where GENDER = 'M' and SALARY < (select AVG(SALARY) from Programmer where GENDER = 'F')

--80. Who are the Female Programmers earning more than the Highest Paid?
select PNAME from Programmer where GENDER = 'F' and SALARY > (select MAX(SALARY) from Programmer)

--81. Which language has been stated as the proficiency by most of the Programmers?
select PROF1 PROF into #TP from Programmer union all select PROF2 from Programmer
select PROF, COUNT(PROF) Count into #TP1 from #TP group by PROF
select Prof, Count Programmer_Count from #TP1 where Count = (select MAX(Count) from #TP1)

--82. Display the details of those who are drawing the same salary.
select * from Programmer where SALARY in (select Salary from Programmer group by SALARY having COUNT(Salary)>1) order by SALARY

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME where GENDER='M' and SALARY>3000

--84. Display the details of the packages developed in Pascal by the Female Programmers.
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME where GENDER='F' and DEVELOPIN='PASCAL'

--85. Display the details of the Programmers who joined before 1990.
select * from Programmer where YEAR(DOJ)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi.
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME left join Studies on Software.PNAME=Studies.PNAME
where DEVELOPIN='C' and GENDER='F' and INSTITUTE='PRAGATHI'

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
select Software.PNAME, INSTITUTE, COUNT(TITLE) [No. of Packages], SUM(SOLD) [No. of Copies Sold], SUM(SCOST) [Sales Value] from Software
inner join Studies on Software.PNAME=Studies.PNAME group by INSTITUTE, Software.PNAME order by INSTITUTE

/*88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute
in which most number of Programmers studied.*/
select INSTITUTE, COUNT(INSTITUTE) Count into #CI from Studies group by INSTITUTE
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME left join Studies on Software.PNAME=Studies.PNAME
where DEVELOPIN='DBASE' and GENDER='M' and INSTITUTE=(select INSTITUTE from #CI where Count=(select MAX(Count) from #CI))

--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME where (GENDER='M' and YEAR(DOB)<1965) or (GENDER='F' and YEAR(DOB)<1975)

/*90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency
of the programmers.*/
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME where DEVELOPIN not in (PROF1,PROF2)

--91. Display the details of the software developed by the male students of Sabhari.
select Software.PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD from Software
left join Programmer on Software.PNAME=Programmer.PNAME left join Studies on Software.PNAME=Studies.PNAME
where GENDER='M' and INSTITUTE='Sabhari'

--92. Display the names of the programmers who have not developed any packages.
select PNAME from Programmer except select PNAME from Software

--93. What is the total cost of the Software developed by the programmers of Apple?
select INSTITUTE, Software.PNAME, SUM(DCOST) [Total S/W Cost] from Software left join Studies on Software.PNAME=Studies.PNAME
where INSTITUTE='APPLE' group by INSTITUTE, Software.PNAME

--94. Who are the programmers who joined on the same day?
select PNAME, DOJ from Programmer where DOJ in (select DOJ from Programmer group by DOJ having COUNT(DOJ)>1) order by DOJ

--95. Who are the programmers who have the same Prof2?
select PNAME, PROF2 from Programmer where PROF2 in (select PROF2 from Programmer group by PROF2 having COUNT(PROF2)>1) order by PROF2

--96. Display the total sales value of the software, institute wise.
select Institute, SUM(SCOST*SOLD) [Total Sales Value] from Software left join Studies on Software.PNAME=Studies.PNAME
group by INSTITUTE order by SUM(SCOST*SOLD) desc
--Last INSTITUTE is NULL as PATTRICK's name is spelled differently in Studies Table who studied from DCAP.

--97. In which institute does the person who developed the costliest package studied.
select INSTITUTE, TITLE, DEVELOPIN, SCOST from Studies left join Software on Studies.PNAME=Software.PNAME
where SCOST=(select MAX(SCOST) from Software)

--98. Which language listed in prof1, prof2 has not been used to develop any package.
select PROF1 [Languages not used] from Programmer union all select PROF2 from Programmer except select DEVELOPIN from Software

-- 99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
select Software.PNAME, SALARY, COURSE from Software
left join Programmer on Software.PNAME=Programmer.PNAME left join Studies on Software.PNAME=Studies.PNAME
where SOLD=(select MAX(SOLD) from Software)
--PATTRICK's COURSE is NULL as his name is spelled differently in Studies Table.

--100. What is the AVG salary for those whose software sales is more than 50,000/-.
select AVG(Salary) Avg_Salary from Programmer where PNAME in (select PNAME from Software where SCOST*SOLD>50000)

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
select COUNT(TITLE) Packages_Developed from Software left join Studies on Software.PNAME=Studies.PNAME
where INSTITUTE=(select distinct INSTITUTE from Studies where COURSE_FEE=(select MIN(COURSE_FEE) [Minimum Course Fee] from Studies))

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
select Software.PNAME, COUNT(TITLE) COUNT, INSTITUTE from Software left join Studies on Software.PNAME=Studies.PNAME
where SCOST=(select MIN(SCOST) from Software) group by Software.PNAME, INSTITUTE

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
select COUNT(TITLE) Count from Software left join Programmer on Software.PNAME=Programmer.PNAME
where GENDER='F' and SALARY>(select MAX(SALARY) from Programmer where GENDER='M')

--104. How many packages are developed by the most experienced programmer from BDPS.
select Programmer.PNAME, DOJ into #BDPSPDOJ from Programmer left join Studies on Programmer.PNAME=Studies.PNAME where INSTITUTE='BDPS'
select #BDPSPDOJ.PNAME [Most Experienced Programmer from BDPS], COUNT(TITLE) [Packages Developed] from #BDPSPDOJ left join Software
on #BDPSPDOJ.PNAME=Software.PNAME where DOJ=(select MIN(DOJ) from #BDPSPDOJ) group by #BDPSPDOJ.PNAME

--105. List the programmers (form the software table) and the institutes they studied.
select Software.PNAME, INSTITUTE from Software left join Studies on Software.PNAME=Studies.PNAME

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
select PROF1 PROF, PNAME into #ProfP from Programmer union select PROF2, PNAME from Programmer
select PROF, COUNT(PNAME) [No. of Programmers] into #ProfPF from #ProfP group by PROF
select DEVELOPIN, COUNT(TITLE) Count into #ProfC from Software group by DEVELOPIN
select PROF, [No. of Programmers], iif(Count is null,0,Count) [No. of Packages] from #ProfPF left join #ProfC on #ProfPF.PROF=#ProfC.DEVELOPIN

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
select Programmer.PNAME, COUNT(TITLE) [No. of Packages Developed] from Programmer
left join Software on Programmer.PNAME=Software.PNAME group by Programmer.PNAME order by [No. of Packages Developed] desc