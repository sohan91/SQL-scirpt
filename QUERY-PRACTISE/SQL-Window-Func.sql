SELECT * FROM Sales.Orders;

SELECT
SalesPersonID,
Sales,
SUM(Sales) OVER() AS total_Sales 
FROM Sales.Orders AS o
ORDER BY SalesPersonID ASC;

--PARTION BY---
SELECT 
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER() AS total_sales,
SUM(Sales) OVER(PARTITION BY ProductID) AS otalSalesbyProduct
FROM Sales.Orders AS o;

--ORDER BY---
SELECT 
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER() AS total_sales,
SUM(Sales) OVER(PARTITION BY ProductID ORDER BY OrderID DESC) AS totalSalesbyProduct
FROM Sales.Orders AS o;

--WINDOW FRAME--
SELECT 
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER(PARTITION BY ProductID ORDER BY OrderID DESC ROWS UNBOUNDED PRECEDING) AS totalSalesbyProduct,
SUM(Sales) OVER() AS total_sales
FROM Sales.Orders AS o;

--RANK--
SELECT 
ProductID,
SUM(o.Sales) AS Total_Sales,
RANK() OVER( Order By SUM(Sales) DESC) AS ds 
FROM Sales.Orders AS o
GROUP BY ProductID;
