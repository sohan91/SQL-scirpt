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
INTO Complete_Order_Details
FROM Sales.Orders AS o
LEFT JOIN Sales.Products AS p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers AS c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees AS e
ON e.EmployeeID = o.SalesPersonID

SELECT * FROM Complete_Order_Details;

DELETE FROM Complete_Order_Details
WHERE OrderID = 3;

UPDATE Complete_Order_Details
SET cust_email='unknown'
WHERE cust_email is NULL;

INSERT INTO Complete_Order_Details
VALUES(2,103,1,'2025-03-02','Bag','Product','Harish kumar',344,'Frank Lee','Marketing',3,40,'hari@gmaill.com');


SELECT
*
FROM
(
  SELECT 
  emp_name,
  SUM(Sales) AS total_sales
  FROM Complete_Order_Details
  GROUP BY emp_name)t
  ORDER BY t.total_sales DESC;
