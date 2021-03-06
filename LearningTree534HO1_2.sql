/****** Script for SelectTopNRows command from SSMS  ******/
--Exercise 1.2
--Step 1
SELECT [EmployeeID]
      ,[FirstName] + ' ' + [LastName] AS [Name]
	  ,[CurrentSalary] AS [Salary]
      ,[BirthDate]
  FROM [Eastwind].[dbo].[Employees]

-------------------------------------------------
--Step 2
SELECT [EmployeeID]
      ,[FirstName] + ' ' + [LastName] AS [Name]
	  ,([CurrentSalary] * 12) AS [YearlySalary]
      ,[BirthDate]
  FROM [Eastwind].[dbo].[Employees]

-------------------------------------------------
--Step 3
SELECT [EmployeeID]
      ,[FirstName] + ' ' + [LastName] AS [Name]
	  ,(CAST([CurrentSalary] AS numeric(10, 2)) * 12) AS [YearlySalary]
      ,CONVERT(varchar(10), [BirthDate], 120) AS [BirthDate]
  FROM [Eastwind].[dbo].[Employees]
  WHERE
	([CurrentSalary] * 12) > 50000
ORDER BY
	[YearlySalary] DESC

-------------------------------------------------
--Step 4
SELECT [EmployeeID]
      ,[FirstName] + ' ' + [LastName] AS [Name]
	  ,(CAST([CurrentSalary] AS numeric(10, 2)) * 12) AS [YearlySalary]
      ,CONVERT(varchar(10), [BirthDate], 120) AS [BirthDate]
  FROM [Eastwind].[dbo].[Employees]
  WHERE
	([CurrentSalary] * 12) > 50000
	AND [Gender] = 'F'
ORDER BY
	[YearlySalary] DESC

-------------------------------------------------
--Step 5
SELECT [SupplierID]
      ,[CompanyName]
      ,[ContactName]
  FROM [Eastwind].[dbo].[Suppliers]

-------------------------------------------------
--Step 6
SELECT [SupplierID]
      ,[CompanyName]
      ,[ContactName]
  FROM [Eastwind].[dbo].[Suppliers]
  WHERE
	[ContactName] LIKE '%peters[eo]%'

-------------------------------------------------
--Step 7
SELECT [OrderID]
      ,[ProductID]
      ,[UnitPrice] * [Quantity] AS [Amount]
--      ,[Discount]
  FROM [Eastwind].[dbo].[OrderDetails]
  WHERE
	[OrderID] BETWEEN 10580 AND 10582

-------------------------------------------------
--Step 8
SELECT [OrderID]
      , [ProductID]
      , [UnitPrice] * [Quantity] AS [Amount]
      , CAST(([Discount] * 100) AS int) AS [Discount percent]
	  , ([UnitPrice] * [Quantity]) * (1.0 - [Discount]) AS [Net amount]
  FROM [Eastwind].[dbo].[OrderDetails]
  WHERE
	[OrderID] BETWEEN 10580 AND 10582

-------------------------------------------------
--Step 9
SELECT TOP 3 WITH TIES
		[OrderID]
      , [ProductID]
      , [UnitPrice] * [Quantity] AS [Amount]
      , CAST(([Discount] * 100) AS int) AS [Discount percent]
	  , CAST(([UnitPrice] * [Quantity]) * (1.0 - [Discount]) AS float) AS [Net amount]
  FROM [Eastwind].[dbo].[OrderDetails]
  ORDER BY
	[Net amount] DESC

-------------------------------------------------
--Step 10
WITH cteOrderDetails (
	OrderId
	, ProductId
	, Amount
	, [Discount percent]
	, [Net amount]
)
AS
(
SELECT
		[OrderID]
      , [ProductID]
      , [UnitPrice] * [Quantity] AS [Amount]
      , CAST(([Discount] * 100) AS int) AS [Discount percent]
	  , CAST(([UnitPrice] * [Quantity]) * (1.0 - [Discount]) AS float) AS [Net amount]
  FROM [Eastwind].[dbo].[OrderDetails]
  --WHERE
	
 )
SELECT
	*
FROM cteOrderDetails
WHERE [Net amount] >= 8000
ORDER BY
	[Net amount] DESC

-------------------------------------------------
--Step 11
SELECT [TABLE_NAME]
  FROM [Eastwind].[INFORMATION_SCHEMA].[TABLES]

-------------------------------------------------
--Step 12
SELECT [TABLE_NAME]
      ,[COLUMN_NAME]
  FROM [Eastwind].[INFORMATION_SCHEMA].[COLUMNS]
  ORDER BY
	[TABLE_NAME]
	, [COLUMN_NAME]

-------------------------------------------------
--Step 13
SELECT [TABLE_NAME]
      ,[COLUMN_NAME]
  FROM [Eastwind].[INFORMATION_SCHEMA].[COLUMNS]
  WHERE [COLUMN_NAME] = 'UnitPrice'
  ORDER BY
	[TABLE_NAME]
	, [COLUMN_NAME]

-------------------------------------------------
--Step 14
SELECT [TABLE_NAME]
      ,[COLUMN_NAME]
  FROM [Eastwind].[INFORMATION_SCHEMA].[COLUMNS]
  WHERE [COLUMN_NAME] LIKE '%ID'
  ORDER BY
	[TABLE_NAME]
	, [COLUMN_NAME]