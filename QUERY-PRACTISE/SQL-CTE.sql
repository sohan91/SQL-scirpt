SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Orders;

---------------------STANDALONE CTE-------------------------------
--ALL ABOUT CTE(Common Table Expression)--
/* 1-> Find total sales per customer
   2-> Find last order date per each customer
   3->Rank Customers Based on thier total sales per customer*/

WITH TotalSalesPerCustomer AS(
  SELECT
  CustomerID,
  SUM(Sales) AS total_sales
 FROM Sales.Orders 
 GROUP BY CustomerID
),
 RankingCustomer AS(
  SELECT 
  CustomerID,
  RANK() OVER(ORDER BY tsp.total_sales DESC) AS ranking
  FROM TotalSalesPerCustomer tsp
 )
,LastOrderDate AS
(
	SELECT
	CustomerID,
	Max(OrderDate) AS lastDateOrderSales
	From Sales.Orders AS o
	GROUP BY CustomerID
)

SELECT  
c.CustomerID ,
c.FirstName,
c.LastName,
tsp.total_sales,
lod.lastDateOrderSales,
rc.ranking
FROM Sales.Customers AS c
LEFT JOIN TotalSalesPerCustomer AS tsp
ON c.CustomerID = tsp.CustomerID AND c.CustomerID IS NOT NULL
LEFT JOIN LastOrderDate AS lod
ON c.CustomerID = lod.CustomerID AND c.CustomerID IS NOT NULL
LEFT JOIN RankingCustomer rc
ON c.CustomerID = rc.CustomerID AND c.CustomerID IS NOT NULL
ORDER BY rc.ranking DESC;


---------------------RECUSRSIVE CTE-------------------------------

WITH series AS(
 SELECT 
 1 AS MyNumber
  
  UNION ALL

  SELECT 
  MyNumber+1
  FROM series
  WHERE MyNumber<50
)
SELECT * FROM series;

/*Show the employee hirerarchy by displaying each
  employee's level with the order*/
  SELECT * FROM Sales.Employees;

  WITH Manager_for_Employee AS
  (
    SELECT 
	EmployeeID,
	FirstName
	,LastName,
	 ManagerID,
	1 AS level
	FROM Sales.Employees
	WHERE ManagerID is NULL

	 UNION ALL

	 SELECT
	  e.EmployeeID,
	  e.FirstName,
	  e.LastName,
	  e.ManagerID,
	mfe.level+1
	FROM Manager_for_Employee AS mfe
	INNER JOIN Sales.Employees AS e
	ON e.ManagerID = mfe.EmployeeID 
  )
  SELECT 
  *
  FROM
  Manager_for_Employee;