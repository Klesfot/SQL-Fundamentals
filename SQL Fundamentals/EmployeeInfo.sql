CREATE VIEW [dbo].[EmployeeInfo]
	AS SELECT top 100 Percent Employee.Id AS EmployeeId,
ISNULL(NULLIF(EmployeeName, ''), (SELECT FirstName + LastName FROM Person WHERE Person.Id = (SELECT Id FROM Employee WHERE EmployeeName = ''))) AS EmployeeFullName,
(SELECT ZipCode + '_' + State + ',' + City + '-' + Street FROM Address WHERE Address.Id = Employee.Id) AS EmployeeFullAddress,
CompanyName + '(' + Position + ')' AS EmployeeCompanyInfo
FROM Employee
INNER JOIN Address ON Employee.AddressId = Address.Id
ORDER BY CompanyName, City ASC 
/*top 100 percent here is supposed to serve the purpose to legalize order by in view body,
because usually order by is not allowed. However it does little to accomplish the goal of 
sorting each view when querying it, because each query is returned in the most efficient way,
which may not be the way a user intended with this order by statement. To order by required
parameters it is better to use order by in the queries on view itself.*/