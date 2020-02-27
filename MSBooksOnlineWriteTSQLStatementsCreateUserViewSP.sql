USE [AdventureWorks2012];
GO

CREATE USER [wfarmer] FOR LOGIN [UKCARDDEV\Domain Users];
GO

CREATE VIEW VwNames
AS
SELECT 
	[Name]
	, [ListPrice]
FROM [Production].[Product];
GO

SELECT
*
FROM
	VwNames;
GO

CREATE PROCEDURE Production.Products_Sel @VarPrice MONEY
	AS
	BEGIN
		--The PRINT statement returns text to the User
		PRINT 'Products less than ' + CAST(@VarPrice AS VARCHAR(10));
		--A second statement starts here
		SELECT
			[Name]
			, [ListPrice]
		FROM VwNames
		WHERE
			ListPrice < @VarPrice
	END
GO

EXECUTE Production.Products_Sel 1.00;