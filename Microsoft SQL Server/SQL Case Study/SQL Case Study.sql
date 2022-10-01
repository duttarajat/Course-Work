create database SQL_Case_Study

use SQL_Case_Study

create table Location
(
	Location_ID int primary key
	,	City varchar(50) not null
)

insert into Location
(
	Location_ID
	,	City
)
select 122, 'New York' union
select 123, 'Dallas' union
select 124, 'Chicago' union
select 167, 'Boston'

create table Department
(
	Department_ID int primary key
	,	Name varchar(50) not null
	,	Location_ID int foreign key references Location(Location_ID)
)

insert into Department
(
	Department_ID
	,	Name
	,	Location_ID
)
select 10, 'Accounting', 122 union
select 20, 'Sales', 124 union
select 30, 'Research', 123 union
select 40, 'Operations', 167

create table Job
(
	Job_ID int primary key
	,	Designation varchar(50) not null
)

insert into Job
(
	Job_ID
	,	Designation
)
select 667, 'Clerk' union
select 668, 'Staff' union
select 669, 'Analyst' union
select 670, 'Sales Person' union
select 671, 'Manager' union
select 672, 'President'

create table Manager
(
	Manager_ID int primary key
	,	Manager_Name varchar(50) not null
)

insert into Manager
(
	Manager_ID
	,	Manager_Name
)
select 7902, 'Sam E John' union
select 7698, 'James S Connor' union
select 7839, 'Jacob A Thomas'

create table Employee
(
	Employee_ID int primary key
	,	Last_Name varchar(50) not null
	,	First_Name varchar(50)
	,	Middle_Name varchar(50)
	,	Job_ID int foreign key references Job(Job_ID)
	,	Manager_ID int foreign key references Manager(Manager_ID)
	,	[Hire Date] date not null
	,	Salary int not null
	,	Comm int
	,	Department_ID int foreign key references Department(Department_ID)
)

insert into Employee
(
	Employee_ID
	,	Last_Name
	,	First_Name
	,	Middle_Name
	,	Job_ID
	,	Manager_ID
	,	[Hire Date]
	,	Salary
	,	Comm
	,	Department_ID
)
select 7369, 'Smith', 'John', 'Q', 667, 7902, '1984-12-17', 800, NULL, 20 union
select 7499, 'Allen', 'Kevin', 'J', 670, 7698, '1985-02-20', 1600, 300, 30 union
select 7505, 'Doyle', 'Jean', 'K', 671, 7839, '1985-04-04', 2850, NULL, 30 union
select 7506, 'Dennis', 'Lynn', 'S', 671, 7839, '1985-05-15', 2750, NULL, 30 union
select 7507, 'Baker', 'Leslie', 'D', 671, 7839, '1985-06-10', 2200, NULL, 40 union
select 7521, 'Wark', 'Cynthia', 'D', 670, 7698, '1985-02-22', 1250, 500, 30


/*
SIMPLE QUERIES:
1. LIST ALL THE EMPLOYEE DETAILS.
2. LIST ALL THE DEPARTMENT DETAILS
3. LIST ALL JOB DETAILS.
4. LIST ALL THE LOCATIONS.
5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.
6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS EMPLOYEEID AS "ID OF THE EMPLOYEE",
LAST NAME AS "NAME OF THE EMPLOYEE", DEPARTMENTID AS "DEP_ID".
7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.
*/

--1. LIST ALL THE EMPLOYEE DETAILS
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Manager_ID, FORMAT([Hire Date],'dd-MMM-yy') as [Hire Date], Salary, Comm, Department_ID from Employee

--2. LIST ALL THE DEPARTMENT DETAILS
select * from Department

--3. LIST ALL JOB DETAILS
select * from Job

--4. LIST ALL THE LOCATIONS
select * from Location

--5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES
select First_Name, Last_Name, Salary, Comm Commission from Employee

--6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS EMPLOYEEID AS "ID OF THE EMPLOYEE",
--LAST NAME AS "NAME OF THE EMPLOYEE", DEPARTMENTID AS "DEP_ID"
select Employee_ID [ID OF THE EMPLOYEE], Last_Name [NAME OF THE EMPLOYEE], Department_ID DEP_ID from Employee

--7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY
select First_Name, Middle_Name, Last_Name, Salary from Employee


/*
WHERE CONDITION:
1. LIST THE DETAILS ABOUT "SMITH"
2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.
4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE
SALARIES MORE THAN 3500.
10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
*/

--1. LIST THE DETAILS ABOUT "SMITH"
select * from Employee where Last_Name='Smith'

--2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20
select * from Employee where Department_ID=20

--3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500
select * from Employee where Salary between 3000 and 4500

--4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select * from Employee where Department_ID in (10,20)

--5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30
select * from Employee where Department_ID in (10,30)

--6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'
select * from Employee where Last_Name like 'S%'

--7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'
select * from Employee where Last_Name like 'S%H'

--8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'
select * from Employee where Last_Name like 'S___'

--9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500
select * from Employee where Department_ID=10 and Salary>3500

--10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION
select * from Employee where Comm is null


/*
ORDER BY CLAUSE:
1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
*/

--1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID
select Employee_ID, Last_Name from Employee order by Employee_ID

--2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY
select Employee_ID, First_Name, Middle_Name, Last_Name, Salary from Employee order by Salary desc

--3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER
select * from Employee order by Last_Name, Department_ID desc


/*
GROUP BY & HAVING CLAUSE
1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
*/

--1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION
select Department_ID, COUNT(Employee_ID) [No. of Employees] from Employee group by Department_ID

--2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES
select Department_ID, MAX(Salary) [Maximum Salary], MIN(Salary) [Minimum Salary], AVG(Salary) [Average Salary]
from Employee group by Department_ID

--3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES
select Job_ID, MAX(Salary) [Maximum Salary], MIN(Salary) [Minimum Salary], AVG(Salary) [Average Salary]
from Employee group by Job_ID

--4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER
select FORMAT([Hire Date],'MMM-yy') [Month of Hiring], COUNT(Employee_ID) [No. of Employees]
from Employee group by FORMAT([Hire Date],'MMM-yy') order by [No. of Employees]

--5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH
select YEAR([Hire Date]) [Hiring Year], MONTH([Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by YEAR([Hire Date]), MONTH([Hire Date]) order by [Hiring Year], [Hiring Month]

--6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES
select Department_ID, COUNT(Employee_ID) [No. of Employees]
from Employee group by Department_ID having COUNT(Employee_ID) >= 4

--7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH
select DATENAME(MONTH,[Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by DATENAME(MONTH,[Hire Date]) having DATENAME(MONTH,[Hire Date]) = 'January'

--8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH
select DATENAME(MONTH,[Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by DATENAME(MONTH,[Hire Date]) having DATENAME(MONTH,[Hire Date]) in ('January','September')

--9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select YEAR([Hire Date]) [Hiring Year], COUNT(Employee_ID) [No. of Employees]
from Employee group by YEAR([Hire Date]) having YEAR([Hire Date]) = 1985

--10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985
select YEAR([Hire Date]) [Hiring Year], MONTH([Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by YEAR([Hire Date]), MONTH([Hire Date]) having YEAR([Hire Date]) = 1985

--11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select YEAR([Hire Date]) [Hiring Year], DATENAME(MONTH,[Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by YEAR([Hire Date]), DATENAME(MONTH,[Hire Date])
having YEAR([Hire Date]) = 1985 and DATENAME(MONTH,[Hire Date]) = 'March'

--12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
select Department_ID, YEAR([Hire Date]) [Hiring Year], DATENAME(MONTH,[Hire Date]) [Hiring Month], COUNT(Employee_ID) [No. of Employees]
from Employee group by Department_ID, YEAR([Hire Date]), DATENAME(MONTH,[Hire Date])
having COUNT(Employee_ID) >= 3 and YEAR([Hire Date]) = 1985 and DATENAME(MONTH,[Hire Date]) = 'April'


/*
JOINS
1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.
15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
*/

--1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES
select Employee_ID, Last_Name, First_Name, Middle_Name, Department.Name Department_Name
from Employee left join Department on Employee.Department_ID = Department.Department_ID

--2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS
select Employee_ID, Last_Name, First_Name, Middle_Name, Designation
from Employee left join Job on Employee.Job_ID = Job.Job_ID

--3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS
select Employee_ID, First_Name, Last_Name, Middle_Name, Name Department_Name, Location.City
from Employee left join Department on Employee.Department_ID = Department.Department_ID
left join Location on Department.Location_ID = Location.Location_ID

--4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES
select Employee.Department_ID, Name Department_Name, COUNT(Employee_ID) [No. of Employees]
from Employee left join Department on Employee.Department_ID = Department.Department_ID
group by Employee.Department_ID, Department.Name order by [No. of Employees] desc

--5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT
select Employee.Department_ID, Name Department_Name, COUNT(Employee_ID) [No. of Employees]
from Employee left join Department on Employee.Department_ID = Department.Department_ID
where Department.Name = 'Sales' group by Employee.Department_ID, Department.Name

--7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS
select Job.Designation, COUNT(Employee.Job_ID) [No. of Jobs] from Employee 
left join Job on Employee.Job_ID = Job.Job_ID
group by Employee.Job_ID, Job.Designation order by [No. of Jobs] desc

--8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK"
select COUNT(Employee_ID) [No. of Employees in NY] from Employee
left join Department on Employee.Department_ID = Department.Department_ID
left join Location on Department.Location_ID = Location.Location_ID

--9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES
select Employee_ID, Last_Name, First_Name, Middle_Name, Salary,
	case when Salary <= 1000 then '0 to 1000'
		when Salary > 1000 and Salary <= 2000 then '1000 to 2000'
		when Salary > 2000 and Salary <= 3000 then '2000 to 3000'
		when Salary > 3000 and Salary <= 4000 then '3000 to 4000'
		when Salary > 4000 and Salary <= 5000 then '4000 to 5000'
	else '> 5000' end Salary_Grade
from Employee

--10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE
select Employee_ID, Last_Name, First_Name, Middle_Name, Salary,
	case when Salary <= 1000 then '0 to 1000'
		when Salary > 1000 and Salary <= 2000 then '1000 to 2000'
		when Salary > 2000 and Salary <= 3000 then '2000 to 3000'
		when Salary > 3000 and Salary <= 4000 then '3000 to 4000'
		when Salary > 4000 and Salary <= 5000 then '4000 to 5000'
	else '> 5000' end as Salary_Grade
into #Emp_Grade
from Employee
select Salary_Grade, COUNT(#Emp_Grade.Employee_ID) Count
from #Emp_Grade
group by Salary_Grade

--11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY
select Employee_ID, Last_Name, First_Name, Middle_Name, Salary,
	case when Salary <= 2000 then '0 to 1000'
		when Salary > 1000 and Salary <= 2000 then '1000 to 2000'
		when Salary > 2000 and Salary <= 5000 then '2000 to 5000'
	else '> 5000' end as Salary_Grade
into #Emp_Sal_Grade
from Employee
select Salary_Grade, COUNT(#Emp_Sal_Grade.Employee_ID) Count from #Emp_Sal_Grade 
group by Salary_Grade having Salary_Grade = '2000 to 5000'

--12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, [Hire Date], Salary, Comm, Department_ID, Employee.Manager_ID, Manager.Manager_Name
from Employee left join Manager on Employee.Manager_ID = Manager.Manager_ID

--13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES
select Manager.Manager_ID, Manager_Name, Employee.Salary into #Mngr_Sal from Manager
inner join Employee on Manager.Manager_ID = Employee.Employee_ID
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Employee.Manager_ID, [Hire Date], Employee.Salary, Comm, Department_ID, #Mngr_Sal.Salary as Manager_Salary
into #Emp_Mngr_Sal from Employee
inner join #Mngr_Sal on Employee.Manager_ID = #Mngr_Sal.Manager_ID
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Manager_ID, [Hire Date], Salary, Comm as Commission, Department_ID
from #Emp_Mngr_Sal where Salary > Manager_Salary
--There are no Employees whose salary is higher than their Manager's Salary

--14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER
select Manager_Name, COUNT(Employee.Employee_ID) Emp_Count from Manager
left join Employee on Manager.Manager_ID = Employee.Manager_ID group by Manager_Name

--15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, [Hire Date], Salary, Comm, Department_ID, Employee.Manager_ID, Manager.Manager_Name
from Employee left join Manager on Employee.Manager_ID = Manager.Manager_ID

--16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
select Employee_ID, Last_Name, First_Name, Middle_Name, Department.Name Department_Name
from Employee left join Department on Employee.Department_ID = Department.Department_ID
where Department.Name in ('Sales','Operations')


/*
SET OPERATORS
1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN  ASCENDING ORDER.
*/

--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS
select distinct Designation from Job
left join Employee on Job.Job_ID=Employee.Job_ID left join Department on Employee.Department_ID=Department.Department_ID
where Department.Name in ('Sales', 'Accounting')

--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS
select Designation from Job
left join Employee on Job.Job_ID=Employee.Job_ID left join Department on Employee.Department_ID=Department.Department_ID
where Department.Name in ('Sales', 'Accounting')

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER
select Designation from Job
left join Employee on Job.Job_ID=Employee.Job_ID left join Department on Employee.Department_ID=Department.Department_ID
where Department.Name = 'Sales' intersect
select Designation from Job
left join Employee on Job.Job_ID=Employee.Job_ID left join Department on Employee.Department_ID=Department.Department_ID
where Department.Name = 'Accounting'
--No common jobs in Sales & Accounting Departments


/*
SUB QUERIES
1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
*/

--1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY
select * from Employee where Salary = (select MAX(salary) from Employee)

--2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Employee.Department_ID, Department.Name Department_Name
from Employee left join Department on Employee.Department_ID = Department.Department_ID where Department.Name = 'Sales'

--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERK'
select Employee_ID, First_Name, Last_Name, Middle_Name, Employee.Job_ID, Job.Designation from employee
left join Job on Employee.Job_ID = Job.Job_ID where Job.Designation = 'Clerk'

--4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK"
select Employee_ID, Last_Name, First_Name, Middle_Name, Location.City from Employee
left join Department on Employee.Department_ID = Department.Department_ID
left join Location on Department.Location_ID = Location.Location_ID
where City = 'New York'

--5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT
select Department.Name Department_Name, COUNT(Employee_ID) [No. of Employees] from Employee
left join Department on Employee.Department_ID = Department.Department_ID
where Department.Name = 'Sales' group by Department.Name, Employee_ID

--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%
update Employee set Salary = (Salary + (Salary * 10 / 100)) where Job_ID =
(select Employee.Job_ID from Employee inner join Job on Employee.Job_ID = Job.Job_ID
group by Designation, Employee.Job_ID having Designation = 'CLERK')

--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
delete Employee from Employee where Department_ID = (select Employee.Department_ID from Employee
inner join Department on Employee.Department_ID = Department.Department_ID
group by Employee.Department_ID, Name having Name = 'ACCOUNTING')

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select *, DENSE_RANK() over(order by Salary desc) Rank_Value into #HS from Employee
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Manager_ID, [Hire Date], Salary, Comm, Department_ID
from #HS where Rank_Value = 2

--9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select *, DENSE_RANK() over(order by Salary desc) Rank_Value into #HSN from Employee
declare @Rank_Value as int
set @Rank_Value = 5 --Enter the value for N
select Employee_ID, Last_Name, First_Name, Middle_Name, Job_ID, Manager_ID, [Hire Date], Salary, Comm, Department_ID
from #HSN where Rank_Value = @Rank_Value

--10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select * from Employee where Salary > (select MAX(Salary) from Employee where Department_ID=30)

--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select * from Employee where Salary > (select MIN(Salary) from Employee where Department_ID=30)

--12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
select Employee.Manager_ID, COUNT(Employee.Manager_ID) COUNT from Employee 
right outer join Manager on Employee.Manager_ID=Manager.Manager_ID
group by Employee.Manager_ID
except select Employee.Manager_ID, COUNT(Employee.Manager_ID) from Employee 
left join Manager on Employee.Manager_ID=Manager.Manager_ID
group by Employee.Manager_ID
--There are no managers who don't have employees under them

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select Name from Department where Department_ID =
(select Department_ID from Department where Department_ID not in (select Department_ID from Employee))

--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
select Department_ID, AVG(Salary) [Dept's AVG Salary] into #DAS from Employee group by Department_ID
select Employee_ID, Last_Name, First_Name, Middle_Name, Employee.Department_ID from Employee
inner join #DAS on Employee.Department_ID=#DAS.Department_ID
where Salary > [Dept's AVG Salary]