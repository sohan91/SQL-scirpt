SELECT * FROM customers;
SELECT * FROM orders;

INSERT INTO customers VALUES(5,'swetha','INDIA',330);

SELECT *
FROM customers
ORDER BY id DESC;

INSERT INTO orders VALUES(1005,8,'2021-02-04',33);

SELECT *
FROM orders
ORDER BY order_date ASC;

SELECT * FROM customers;

SELECT TOP 2
country,SUM(score) AS total_score 
FROM customers
GROUP BY country
HAVING SUM(score)>500
ORDER BY country DESC;

ALTER TABLE customers
ADD email VARCHAR(40);

ALTER TABLE customers
DROP COLUMN email;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT first_name,score
FROM customers
WHERE country='INDIA' AND score>200;

SELECT * FROM customers;
SELECT * FROM orders;

--INNER JOIN--
SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
INNER JOIN orders
on customers.id = orders.customer_id;


--LEFT JOIN---
SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
LEFT JOIN orders
on customers.id = orders.customer_id;

--RIGHT JOIN--
SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
RIGHT JOIN orders
on customers.id = orders.customer_id;

--FULL JOIN--
SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers
FULL JOIN orders
on customers.id = orders.customer_id;