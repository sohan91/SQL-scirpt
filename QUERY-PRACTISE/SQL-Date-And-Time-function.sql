SELECT * FROM Sales.Orders;
SELECT * FROM Sales.Products;

--GET	DATE()--
SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
 GETDATE() AS Todays_Date
FROM Sales.Orders AS o;

--DAY(),MONTH(),YEAR()--
SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
 DAY(o.CreationTime) AS Day,
 MONTH(o.CreationTime) AS Month,
 YEAR(o.CreationTime) AS Year
FROM Sales.Orders AS o;
 
 --DATEPART()--
 SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
  DATEPART(YEAR,o.CreationTime) AS dp_year,
  DATEPART(MONTH,o.CreationTime) AS dp_month,
  DATEPART(DAY,o.CreationTime) AS dp_day,
  DATEPART(WEEK,o.CreationTime) AS dp_week,
  DATEPART(QUARTER,o.CreationTime) AS dp_quarter,
  DATEPART(HOUR,o.CreationTime) AS dp_hour
 FROM Sales.Orders AS o;

--DATENAME()--
 SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
  DATENAME(YEAR,o.CreationTime) AS dp_year,
  DATENAME(MONTH,o.CreationTime) AS dp_month,
  DATENAME(WEEKDAY,o.CreationTime) AS dp_day,
  DATENAME(WEEK,o.CreationTime) AS dp_week
 FROM Sales.Orders AS o;

--DATETRUNC()--
 SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
 DATETRUNC(MONTH,o.CreationTime) AS reset_Day,
 DATETRUNC(DAY,o.CreationTime)  AS reset_hour,
 DATETRUNC(HOUR,o.CreationTime) AS reset_minute,
 DATETRUNC(MINUTE,o.CreationTime) AS reset_seconds
 FROM Sales.Orders AS o;

 --EOMONTH()--
  SELECT 
 o.OrderID,
 o.OrderDate,
 o.ShipDate,
 o.CreationTime,
 EOMONTH(o.CreationTime) AS em_month
 FROM Sales.Orders AS o;


  

