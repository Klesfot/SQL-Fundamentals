CREATE PROCEDURE [dbo].[InsertEmployee]
	@EmployeeName NVARCHAR(100) = '',
	@FirstName NVARCHAR(50) = '',
	@LastName NVARCHAR(50) = '',
	@CompanyName NVARCHAR(20),
	@Position NVARCHAR(30) = '',
	@Street NVARCHAR(50),
	@City NVARCHAR(20) = '',
	@State NVARCHAR(50) = '',
	@ZipCode NVARCHAR(50) = ''
AS
	BEGIN;
		DECLARE @truncatedCompanyName NVARCHAR(20)
		IF TRIM(@EmployeeName) IS NULL OR TRIM(@EmployeeName) = '' AND
		TRIM(@FirstName) IS NULL OR TRIM(@FirstName) = '' AND
		TRIM(@LastName) IS NULL OR TRIM(@LastName) = ''
		BEGIN;
			THROW 51000, 'One of EmployeeName, FirstName, LastName
			should be not null, empty, or contain only space symbols', 1;
			RETURN
		END;

		IF LEN(@CompanyName) > 20
		BEGIN;
			SET @truncatedCompanyName = LEFT(@CompanyName, 20)
		END;
		ELSE
			SET @truncatedCompanyName = @CompanyName
	END;
	INSERT INTO Person (FirstName, LastName)
	VALUES (@FirstName, @LastName);
	INSERT INTO Address (Street, City, State, ZipCode)
	VALUES (@Street, @City, @State, @ZipCode);
	INSERT INTO Company (Name, AddressId)
	VALUES (@CompanyName, IDENT_CURRENT('Address'))
	INSERT INTO Employee (EmployeeName, CompanyName, Position, AddressId, PersonId)
	VALUES (@EmployeeName, @CompanyName, @Position, IDENT_CURRENT('Address'),
	IDENT_CURRENT('Person'));
RETURN 0
