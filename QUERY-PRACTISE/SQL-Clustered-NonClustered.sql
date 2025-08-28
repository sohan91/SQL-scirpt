SELECT * 
FROM DB_Customers

CREATE CLUSTERED INDEX Index_clust
ON DB_Customers (CustomerID);

SELECT * FROM DB_Customers WHERE CustomerID = 4;

CREATE NONCLUSTERED INDEX Index_First_Name
ON DB_Customers(FirstName)

CREATE INDEX Index_Last_Name
ON DB_Customers(LastName)

SELECT 
*
FROM DB_Customers 
WHERE LastName = 'BROWN' OR FirstName='Mary'