SELECT * FROM Sales.Orders;

CREATE VIEW Sales.super_query AS
(
SELECT 
DATETRUNC(MONTH,OrderDate) AS date,
SUM(Sales) AS total_sales,
COUNT(OrderID) AS total_orders,
COUNT(Quantity) AS total_quantity
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH,OrderDate)
)

SELECT 
s.date,
s.total_sales,
s. total_orders,
s.total_quantity,
SUM(total_sales) OVER(ORDER BY s.total_sales) AS running_sales
FROM super_query AS s; 

SELECT * FROM super_query;

/*
Task:Provide view that combines details from orders,
products,customer,and employees
*/

CREATE VIEW Sales.V_Order_Details AS(
SELECT
o.OrderID,
o.ProductID,
o.CustomerID,
o.OrderDate,
p.Product,
p.Category,
CONCAT(c.FirstName,' ',c.LastName) AS cust_name,
c.Score,
CONCAT(e.FirstName,' ',e.LastName) AS emp_name,
e.Department,
o.Quantity,
o.Sales
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers AS c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees AS e
ON e.EmployeeID = o.SalesPersonID
)

SELECT * FROM Sales.V_Order_Details;


--SECURITY BY VIEWS--
/*
--Provide a view for EU Sales Team
--that combines details from all tables
--And excludes Data related to USA
*/
CREATE VIEW Sales.V_Order_Details_EU AS(
SELECT
o.OrderID,
o.ProductID,
o.CustomerID,
o.OrderDate,
p.Product,
p.Category,
CONCAT(c.FirstName,' ',c.LastName) AS cust_name,
c.Score,
CONCAT(e.FirstName,' ',e.LastName) AS emp_name,
e.Department,
o.Quantity,
o.Sales
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers AS c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees AS e
ON e.EmployeeID = o.SalesPersonID
WHERE c.Country = 'USA'
)

SELECT * FROM Sales.V_Order_Details_EU;