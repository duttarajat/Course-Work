/*
3) Perform the following with help of the above database
Get all the details from the person table including email ID, phone number, and phone number type
Get the details of the sales header order made in May 2011
Get the details of the sales details order made in the month of May 2011
Get the total sales made in May 2011
Get the total sales made in the year 2011 by month order by increasing sales
Get the total sales made to the customer with FirstName='Gustavo' and LastName='Achong'
*/

--Get all the details from the person table including email ID, phone number, and phone number type
select [Person].[Person].*, [Person].[EmailAddress].EmailAddress, [Person].[PersonPhone].PhoneNumber,[Person].[PhoneNumberType].Name
from [Person].[Person] inner join [Person].[EmailAddress] on [Person].[Person].BusinessEntityID=[Person].[EmailAddress].BusinessEntityID
inner join [Person].[PersonPhone] on [Person].[Person].BusinessEntityID=[Person].[PersonPhone].BusinessEntityID
inner join [Person].[PhoneNumberType] on [Person].[PersonPhone].PhoneNumberTypeID=[Person].[PhoneNumberType].PhoneNumberTypeID

--Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader] where YEAR(OrderDate)=2011 and DATENAME(MM,OrderDate)='May'

--Get the details of the sales details order made in the month of May 2011
select [Sales].[SalesOrderDetail].* from [Sales].[SalesOrderHeader]
inner join [Sales].[SalesOrderDetail] on [Sales].[SalesOrderHeader].SalesOrderID=[Sales].[SalesOrderDetail].SalesOrderID
where DATENAME(MM,[SalesOrderHeader].OrderDate)='May' and YEAR([Sales].[SalesOrderHeader].OrderDate)=2011

--Get the total sales made in May 2011
select CAST(SUM(LineTotal) as decimal (12,2)) [May, 11 Total Sales] from [Sales].[SalesOrderHeader]
inner join [Sales].[SalesOrderDetail] on  [Sales].[SalesOrderHeader].SalesOrderID=[Sales].[SalesOrderDetail].SalesOrderID
where DATENAME(MM,[Sales].[SalesOrderHeader].OrderDate)='May' and YEAR([Sales].[SalesOrderHeader].OrderDate)=2011

--Get the total sales made in the year 2011 by month order by increasing sales
select DATENAME(MM,OrderDate) Month, CAST(SUM(LineTotal) as decimal(12,2)) Total_Sales from [Sales].[SalesOrderHeader]
inner join[Sales].[SalesOrderDetail] on [Sales].[SalesOrderHeader].SalesOrderID=[Sales].[SalesOrderDetail].SalesOrderID
where YEAR(OrderDate)=2011 group by  DATENAME(MM,OrderDate) order by Total_Sales

--Get the total sales made to the customer with FirstName='Gustavo' and LastName='Achong'
select * from [Sales].[SalesPerson] inner join [Person].[Person]
on [Sales].[SalesPerson].BusinessEntityID=[Person].[Person].BusinessEntityID
where FirstName='Gustavo' and LastName='Achong'
--No sales made to the said customer