SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.Products;
SELECT * FROM Sales.Employees;

/*Using SalesDB,Rertrive a list of all orders, along with the realted customer,product,
 ans employee details.For each order,disaply:
 OrderId,Customer'name, Product name,Sales,Price,Sales person's name*/

 SELECT 
  o.OrderID,
  c.FirstName AS Cust_FirstName,
  c.LastName AS Cust_LastName,
   e.FirstName As SalesMan_FirstName,
  e.LastName AS SalesMan_LastName,
  p.Product AS ProductName,
  o.sales,
  p.Price
 FROM Sales.Orders AS o
 LEFT JOIN Sales.Customers AS c
 ON o.CustomerID = c.CustomerID
 LEFT JOIN Sales.Products AS p
 ON o.ProductID = p.ProductID
 LEFT JOIN Sales.Employees AS e
 ON o.SalesPersonID=e.EmployeeID; 

