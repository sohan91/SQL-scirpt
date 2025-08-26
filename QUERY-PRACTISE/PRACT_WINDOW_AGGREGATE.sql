--SELECT * FROM Sales.Orders;

SELECT 
OrderID,
CustomerID,
Sales,
SUM(Sales) OVER(PARTITION BY CustomerID ORDER BY OrderID DESC) AS total_sales,
COUNT(CASE
	  WHEN Sales is NULL THEN 0
	  ELSE Sales
	END) OVER(PARTITION BY CustomerID) AS count_sales,
AVG(
	CASE
	  WHEN Sales is NULL THEN 0
	  ELSE Sales
	END
	) OVER(PARTITION BY CustomerID) AS avg_sales,
MIN(Sales) OVER(PARTITION BY CustomerID) AS min_sales,
MAX(Sales)  OVER(PARTITION BY CustomerID) AS max_sales,

CASE
      WHEN CAST(CAST
	             ((Sales*100.0/(SUM(Sales) OVER(PARTITION BY CustomerID)))
				 AS DECIMAL(10,2)
				 ) AS VARCHAR(20)) +'%' IS NULL THEN '0%'
	  ELSE 
	         CONCAT(CAST(CAST
	             ((Sales*100.0/(SUM(Sales) OVER(PARTITION BY CustomerID)))
				 AS DECIMAL(10,2)
				 ) AS VARCHAR(10)),'%') 
END 
sales_perc_customer

FROM Sales.Orders;