SELECT * FROM Sales.Orders;
--SUB QUERY IN FROM CALUSE--
/*
 Find the products that have a price higher
  than the average products of all products
*/
	select * from Sales.Products;

	SELECT 
	*
	FROM
		(SELECT 
		ProductID,
		Product,
		Price,
		AVG(Price) OVER() AS avg_sales
		FROM Sales.Products)t 
	WHERE Price>avg_sales;

/* Rank Customers based on their total amount of sales*/

SELECT 
*,
RANK() OVER(ORDER BY Total_Sales DESC) AS ranking
FROM(
SELECT 
 CustomerID,
 SUM(Sales) as Total_Sales
FROM Sales.Orders
GROUP BY CustomerID )t;


--SUB QUERY IN SELECT CLAUSE--
/* Show the prodct IDs,names,prices and total number of orders*/
SELECT 
 ProductID,
 Product,
 Price,
 (SELECT
  COUNT(*)
  FROM Sales.Orders
  )total_orders
 FROM Sales.Products;


 --SubQuery in JOIN clause--
 /*Show all customers details and find the total
   orders for each customers*/
   SELECT * FROM Sales.Orders;
   SELECT * FROM Sales.Customers;


   SELECT 
   c.*,
   o.TotalOrder
   FROM Sales.Customers c
   LEFT JOIN(
   SELECT CustomerID,
   COUNT(*) TotalOrder
   FROM Sales.Orders
   GROUP BY CustomerID)o
ON o.CustomerID = c.CustomerID;
   
--SubQuery in WHERE Clause--
/* Find the products that have proce higher then the average
   price of all products*/
   SELECT 
   ProductID,
   Product,
   Price,
   AVG(Price) OVER() avg_price 
   FROM Sales.Products
          WHERE (SELECT 
          AVG(Price) 
		  FROM Sales.Products)<Price;
   
   