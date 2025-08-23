SELECT * FROM customers;
SELECT * FROM orders;

--ANTI LEFT JOIN--
--Get all customers who haven't places any orders--

SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name
FROM customers
LEFT JOIN orders
on customers.id = orders.customer_id
WHERE orders.customer_id is NULL;

--ANTI RIGHT JOIN--
--Get all orders without matching customers--

SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	 orders.customer_id,
	 orders.order_id,
	 orders.sales
FROM customers
RIGHT JOIN orders
on customers.id = orders.customer_id
WHERE customers.id is NULL;


--ANTI FULL JOIN--
--Find customers without orders and orders without customers--

SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
FULL JOIN orders
on customers.id = orders.customer_id
WHERE orders.customer_id is NULL OR customers.id is NULL;

--ANTI INNER JOINS--
/*
 Get all customers along with their orders,
 but only for customers who have placed an order
 without using INNER JOIN(WITH-OUT USING INNER JOIN)
*/
SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name
FROM customers
LEFT JOIN orders
on customers.id = orders.customer_id
WHERE orders.customer_id is NOT NULL;


--CROSS JOIN--
--Generate all possible combination of orders and customers--

SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	*
FROM customers
CROSS JOIN orders;