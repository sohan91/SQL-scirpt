select * from Sales.Customers;

SELECT *,
CASE
  WHEN c.Score<1000 AND c.Score >= 500 THEN 'HIGH'
   WHEN c.Score>=300 AND c.Score<500 THEN 'MEDIUM'
  ELSE 'LOW' 
END category
FROM Sales.Customers AS c

SELECT category,
SUM(Score)
FROM(
SELECT *,
CASE
  WHEN c.Score<1000 AND c.Score >= 500 THEN 'HIGH'
   WHEN c.Score>=300 AND c.Score<500 THEN 'MEDIUM'
  ELSE 'LOW' 
END category
FROM Sales.Customers AS c
)t
GROUP BY category
ORDER BY SUM(Score) DESC;


SELECT 
e.EmployeeID,
e.FirstName,
e.Gender,
CASE 
    WHEN e.Gender='M' THEN 'MALE' 
    WHEN e.Gender='F' THEN 'FEMALE'
    ELSE 'NOT-AVAILABLE'
END gender_full_text
FROM Sales.Employees AS e;

SELECT * FROM Sales.Orders;

SELECT 
 o.CustomerID,
 SUM(
 CASE
    WHEN ISNULL(o.Sales,0)>=30 THEN 1
    ELSE 0
 END) sales_flag,
 Sum(o.Sales) total_sales
FROM Sales.Orders AS o
GROUP BY o.CustomerID
ORDER BY o.CustomerID ASC;