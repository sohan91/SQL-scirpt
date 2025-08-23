SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;
--UNION--
SELECT 
   FirstName As fName,
   LastName AS lName
FROM Sales.Customers
UNION
SELECT  
  FirstName,
  LastName
FROM Sales.Employees;

--UNION ALL--
SELECT 
   FirstName As fName,
   LastName AS lName
FROM Sales.Customers
UNION ALL
SELECT 
  FirstName,
  LastName
FROM Sales.Employees;

--EXCEPT/MINUS On Customer--
SELECT
   FirstName AS fName,
   LastName AS lName
FROM Sales.Customers
EXCEPT
SELECT 
    FirstName,
    LastName
FROM Sales.Employees;
    --On Employee--
SELECT
   FirstName AS fName,
   LastName AS lName
FROM Sales.Employees
EXCEPT
SELECT 
    FirstName,
    LastName
FROM Sales.Customers;


--INTERSECT--
SELECT
    FirstName AS fName,
    LastName AS lName
FROM Sales.Customers
INTERSECT
SELECT 
    FirstName,
    LastName
FROM Sales.Employees;