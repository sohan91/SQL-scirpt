SELECT * FROM Sales.Orders;

--WINDOW AGGREGATE  FUNCTIONS
--COUNT--
SELECT 
OrderID,
ProductID,
CASE
 WHEN Sales is NULL THEN 0
 ELSE Sales
END Sales,
COUNT(*) OVER() AS total_orders,
COUNT(*) OVER(PARTITION BY ProductID) AS counting ,
COUNT(OrderID) OVER() AS total_Orders
FROM Sales.Orders;

--SUM--
SELECT 
OrderID,
ProductID,
CASE
 WHEN Sales is NULL THEN 0
 ELSE Sales
END Sales,
SUM(Sales) OVER(PARTITION BY ProductID) AS total_sales_ID,
SUM(Sales) OVER() AS total_sales_ID
FROM Sales.Orders;

--AVERAGE--
SELECT 
OrderID,
ProductID,
CASE
 WHEN Sales is NULL THEN 0
 ELSE Sales
END Sales,
SUM(Sales) OVER(PARTITION BY ProductID) AS total_sales_ID,
AVG(CASE WHEN Sales IS NULL THEN 0 ELSE Sales END)  OVER(PARTITION BY ProductID) AS average_sales,
CAST((Sales * 100.0 / SUM(Sales) OVER (PARTITION BY ProductID)) AS DECIMAL(10,2)) AS SalesPercentage
FROM Sales.Orders;

--MIN & MAX--
SELECT 
OrderID,
ProductID,
CASE
 WHEN Sales is NULL THEN 0
 ELSE Sales
END Sales,
MIN(Sales) OVER() AS min_sales,
MAX(Sales) OVER() AS max_sales,
MIN(Sales) OVER(PARTITION BY ProductID) AS min_sales_product,
MAX(Sales) OVER(PARTITION BY ProductID) AS max_sales_product
FROM Sales.Orders;
