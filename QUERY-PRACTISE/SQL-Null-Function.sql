
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Products;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;


--ISNULL()--
SELECT *,
ISNULL(o.BillAddress,o.ShipAddress) AS ISNull
FROM Sales.Orders AS o;

--COALESCE()--
SELECT *,
COALESCE(o.ShipAddress,o.BillAddress,'unknown') AS clsc
FROM Sales.Orders AS o;


--NULL HANDLING--
SELECT 
  c.CustomerID,
  c.FirstName,
  c.LastName,
  COALESCE(c.FirstName,'')+' '+COALESCE(c.LastName,'') AS full_name,
  o.Sales,
  COALESCE(o.Sales,0)+10 AS bonus_sales
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON o.CustomerID = c.CustomerID ;

--HANDLING NULL WHILE JOINS--
SELECT 
 o.OrderID AS orderID,
 COALESCE(o.Sales,1000) AS order_sales, 
 o.ShipDate, 
 oa.ShipDate AS oa_ship_date
FROM Sales.Orders AS o
LEFT JOIN Sales.OrdersArchive AS oa
ON o.OrderID=oa.OrderID
AND ISNULL(o.Sales,1) = ISNULL(oa.Sales,1);

--NULL-IF--
SELECT
 OrderID,
 Sales,
 NULLIF(Sales,60) AS Null_if
FROM Sales.Orders;

--NULL-IF DIVIDE BY ZERO
SELECT
 OrderID,
 Quantity,
 Sales,
 Sales/NULLIF(Quantity,0) AS price
FROM Sales.Orders;

