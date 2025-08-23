--STRING FUNCTION--
SELECT * from Sales.Customers;

--CONCATINATION OF NAMES--
SELECT 
 CONCAT(c.FirstName,' ',c.LastName) AS FullName,
 c.Country
 FROM Sales.Customers AS c;

 --UPPER CASE AND LOWER CASE--
 SELECT 
   c.FirstName,c.LastName,
  CONCAT(c.FirstName,' ',c.LastName) AS FullName,
  LOWER(c.FirstName) AS low_name,
  UPPER(c.FirstName) AS upp_name,
  c.Country
 FROM Sales.Customers AS c;

 --TRIM--
 SELECT
  c.FirstName,
  LEN(c.FirstName) AS len_name,
  LEN(TRIM(c.FirstName)) AS len_name_after_trim,
  LEN(c.FirstName) - LEN(TRIM(FirstName)) AS Flag_String
  FROM Sales.Customers AS c;

  --REPLACE--
  SELECT 
  'name.txt' AS file_name,
  REPLACE('name.txt','txt','java') AS modified_file_extension;

  --LEN--
SELECT 
   c.FirstName,
   LEN(c.FirstName) AS Len_name
FROM Sales.Customers AS c;

 --LEFT & RIGHT--
 SELECT
  c.FirstName,
  LEFT(TRIM(c.FirstName),2) AS first_2_char,
  RIGHT(TRIM(c.FirstName),2) AS last_2_char
 FROM Sales.Customers AS c;

 --SUBSTRING--
SELECT 
  c.FirstName,
  SUBSTRING(TRIM(c.FirstName),2,LEN(c.FirstName)) AS sub_name
FROM Sales.Customers AS c;