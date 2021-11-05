SELECT 
  [Date], 
  [Year], 
  [Customer ID], 
  [Customer Age], 
  [Customer Gender], 
  [Country], 
  [State], 
  [Product Category], 
  [Sub Category], 
  [Product], 
  [Order Quantity], 
  [Unit Cost], 
  [Unit Price], 
  [COST] AS [Cost], 
  [REVENUE] AS [Revenue], 
  [REVENUE] - [COST] AS [Profit] 
FROM 
  [buybuy].[dbo].[newbuybuy];
--1. TIME-PROFIT ANALYSIS
--1a: The total profit made by BuyBuy from 1Q11 to 4Q16 (all quarters of every year)
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit] 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  YEAR >= '2011';
--1b:The total profit made by BuyBuy in Q2 of every year from 2011 to 2016.
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2011-04-01' 
  AND '2011-06-01' 
GROUP BY 
  YEAR 
UNION 
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2012-04-01' 
  AND '2012-06-01' 
GROUP BY 
  YEAR 
UNION 
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2013-04-01' 
  AND '2013-06-01' 
GROUP BY 
  YEAR 
UNION 
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2014-04-01' 
  AND '2014-06-01' 
GROUP BY 
  YEAR 
UNION 
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2015-04-01' 
  AND '2015-06-01' 
GROUP BY 
  YEAR 
UNION 
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  Year 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  DATE BETWEEN '2016-04-01' 
  AND '2016-06-01' 
GROUP BY 
  YEAR;
--1c:The annual profit made by BuyBuy from the year 2011 to 2016.
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  [Year] 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  YEAR >= '2011' 
GROUP BY 
  YEAR 
ORDER BY 
  YEAR;
--2. REGION PROFIT ANALYSIS
--2a. The countries where BuyBuy has made the most profit and also the least profit of all-time.
SELECT 
  SUM([REVENUE] - [COST]) AS [Total Profit], 
  [Country] 
FROM 
  [dbo].[newbuybuy] 
GROUP BY 
  Country 
ORDER BY 
  SUM([REVENUE] - [COST]) DESC;
--2b. the Top-10 most profitable countries for BuyBuy sales operations from 2011 to 2016
SELECT 
  TOP 10 SUM([REVENUE]) AS [Sales], 
  [Country] 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  YEAR BETWEEN '2011' 
  AND '2016' 
GROUP BY 
  Country 
ORDER BY 
  SUM([REVENUE] - [COST]) DESC;
--2c. The all-time Top-10 least profitable countries for BuyBuy sales operations.
SELECT 
  TOP 10 SUM([REVENUE]) AS [Sales], 
  [Country] 
FROM 
  [dbo].[newbuybuy] 
WHERE 
  YEAR BETWEEN '2011' 
  AND '2016' 
GROUP BY 
  Country 
ORDER BY 
  SUM([REVENUE] - [COST]) ASC;
--3. PRODUCT REVENUE ANALYSIS
--3a. Ranking all product categories sold by Buybuy, from least amount to the most amount of all-time revenue generated.
SELECT 
  SUM([REVENUE]) AS Sales, 
  [Product Category] 
FROM 
  [dbo].[newbuybuy] 
GROUP BY 
  [Product Category] 
ORDER BY 
  SUM([REVENUE]) ASC;
--3b. Top-2 product categories offered by Buybuy with an all-time high number of units sold.
SELECT 
  TOP 2 SUM([Order Quantity]) AS [Unit Sold], 
  [Product Category] 
FROM 
  [dbo].[newbuybuy] 
GROUP BY 
  [Product Category] 
ORDER BY 
  SUM([Order Quantity]) DESC;
--3c. Top 10 highest-grossing products sold by BuyBuy based on all-time profits.
SELECT 
  TOP 10 SUM([Order Quantity]) AS [Unit Sold], 
  [Product] 
FROM 
  [dbo].[newbuybuy] 
GROUP BY 
  [Product] 
ORDER BY 
  SUM([Order Quantity]) DESC;

