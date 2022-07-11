/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

insert dbo.Person select 'Sonelie', 'Hayo'
where not exists (select 1 from dbo.Person where Id = 1)

insert dbo.Person select 'Yana', 'Yakovenko'
where not exists (select 1 from dbo.Person where Id = 2)

insert dbo.Person select 'Zmitser', 'Yeleiko'
where not exists (select 1 from dbo.Person where Id = 3)

insert dbo.Address select 'A. Politkovskaya Street', 'Tbilisi', NULL, '0001'
where not exists (select 1 from dbo.Address where Id = 1)

insert dbo.Address select 'Dadiani Avenue', 'Batumi', NULL, '0011'
where not exists (select 1 from dbo.Address where Id = 2)

insert dbo.Address select 'Pavliashvili Street', 'Telavi', NULL, '0111'
where not exists (select 1 from dbo.Address where Id = 3)

insert dbo.Company select 'EPAM', (select 1 from dbo.Address where Id = 1)
where not exists (select 1 from dbo.Company where Id = 1)

insert dbo.Company select 'Wright & Co', (select 2 from dbo.Address where Id = 2)
where not exists (select 1 from dbo.Company where Id = 2)

insert dbo.Company select 'Phoenix Coffee & Bar', (select 3 from dbo.Address where Id = 3)
where not exists (select 1 from dbo.Company where Id = 3)

insert dbo.Employee select (select 1 from dbo.Address where Id = 1), (select 1 from dbo.Person where Id = 1), 'EPAM', 'Software engineer', 'SoneHayo'
where not exists (select 1 from dbo.Employee where Id = 1)

insert dbo.Employee select (select 2 from dbo.Address where Id = 2), (select 2 from dbo.Person where Id = 2), 'Wright & Co', NULL, 'YanaYak'
where not exists (select 1 from dbo.Employee where Id = 2)

insert dbo.Employee select (select 3 from dbo.Address where Id = 3), (select 3 from dbo.Person where Id = 3), 'Phoenix Coffee & Bar', 'Barman', NULL
where not exists (select 1 from dbo.Employee where Id = 3)
