SELECT * 
FROM DB_Customers

---CLUSTERED INDEX-----------

CREATE CLUSTERED INDEX Index_clust
ON DB_Customers (CustomerID);

SELECT * FROM DB_Customers WHERE CustomerID = 4;

---NON-CLUSTERED INDEX---------

CREATE NONCLUSTERED INDEX Index_First_Name
ON DB_Customers(FirstName)

CREATE INDEX Index_Last_Name
ON DB_Customers(LastName)

SELECT 
*
FROM DB_Customers 
WHERE LastName = 'BROWN' OR FirstName='Mary'

---UNIQUE INDEX----------------

SELECT * FROM Sales.Products;

CREATE UNIQUE NONCLUSTERED INDEX index_unique_productID
ON Sales.Products (ProductID)

INSERT INTO Sales.Products VALUES(10,'bottle','acc',30);

DROP INDEX index_unique_productid ON Sales.Products;
DROP INDEX index_unique_product ON Sales.Products;

---FILTER INDEX---
SELECT 
* 
FROM Sales.Customers
WHERE Country = 'USA';

CREATE NONCLUSTERED INDEX index_Cust_Country
ON Sales.Customers (Country)
WHERE Country = 'USA'


