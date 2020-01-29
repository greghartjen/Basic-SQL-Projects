USE AdventureWorks2017
GO
CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS 
SELECT *
FROM Person.Address
WHERE City = @City
GO

EXEC dbo.uspGetAddress @City = 'New York'

/* Multiple Parameters */

USE AdventureWorks2017
GO
CREATE PROC dbo.uspGetAddress1 @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1,AddressLine1) + '%'
GO

EXEC dbo.uspGetAddress1 @City = 'Calgary', @AddressLine1 = 'A'

/* My practice stored procedure using AdventureWorks2017 */

USE AdventureWorks2017
GO
CREATE PROC dbo.uspAddressCitySales2 @City nvarchar(30) = NULL, @Sales MONEY = NULL
AS
SELECT AddressLine1, City, SalesYTD
FROM person.StateProvince 
	INNER JOIN person.address ON person.stateprovince.StateProvinceID = person.address.StateProvinceID
	INNER JOIN sales.SalesTerritory ON person.stateprovince.TerritoryID = sales.SalesTerritory.TerritoryID
WHERE City = @City AND SalesYTD <= @Sales

EXEC uspAddressCitySales2 @City = 'Seattle', @Sales = 9000000