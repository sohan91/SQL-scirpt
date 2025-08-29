
SELECT * FROM Sales.Customers;
---STORED PROCEDURE---
SELECT 
COUNT(*) Count,
AVG(Score) Average
FROM Sales.Customers
WHERE Country='Germany'

CREATE PROCEDURE CustomerCountAvgSummary AS
BEGIN
SELECT 
COUNT(*) Count,
AVG(Score) Average
FROM Sales.Customers
WHERE Country='Germany'
END

EXEC CustomerCountAvgSummary
DROP PROCEDURE CustomerCountAvgSummary


---PARAMETER STORED PROCEDURE---
CREATE PROCEDURE VariableCustomerCountAvgSummary @Country VARCHAR(50) AS
BEGIN
DECLARE @Total_Customers INT,@Avg_Score FLOAT
	SELECT 
		@Total_Customers = COUNT(*),
		@Avg_Score = AVG(Score)
	FROM Sales.Customers
	WHERE Country=@Country;

	PRINT 'Total Customers From '+@Country+' is :'+CAST(@Total_Customers AS VARCHAR); 
	PRINT 'Average Sales From '+@Country+' is :'+CAST(@Avg_Score AS VARCHAR);

	SELECT
		COUNT(OrderID) TotalOrders,
		SUM(Sales) TotalSales
	FROM Sales.Orders AS o
	INNER JOIN Sales.Customers AS c
	ON o.CustomerID=c.CustomerID
	WHERE c.Country=@Country;
END


EXEC VariableCustomerCountAvgSummary @Country = 'USA';

----CONTROL FLOW STORED PROCEDURE---
CREATE PROCEDURE ControlFlowSalesSummery @Country VARCHAR(50) AS
 BEGIN
	DECLARE @Total_Customers INT,@Avg_Score FLOAT;
	IF EXISTS(SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country = @Country)
	BEGIN
	   PRINT ('Updating null to Zero');
       UPDATE Sales.Customers 
	   SET Score = 0
	   WHERE Score is NULL AND Country = @Country
	END

	ELSE
	 
	BEGIN
	 PRINT('NO NULl Score')
	END

	SELECT 
		@Total_Customers = COUNT(*),
		@Avg_Score = AVG(Score)
	FROM Sales.Customers
	WHERE Country=@Country;

	PRINT 'Total Customers From '+@Country+' is :'+CAST(@Total_Customers AS VARCHAR); 
	PRINT 'Average Sales From '+@Country+' is :'+CAST(@Avg_Score AS VARCHAR);

	SELECT
		COUNT(OrderID) TotalOrders,
		SUM(Sales) TotalSales
	FROM Sales.Orders AS o
	INNER JOIN Sales.Customers AS c
	ON o.CustomerID=c.CustomerID
	WHERE c.Country=@Country;
 END

 SELECT * FROM Sales.Orders;
 SELECT * FROM Sales.Customers;

 EXEC
 ControlFlowSalesSummery @Country='Germany';

 --Handle Exception--
ALTER PROCEDURE HandleExceptionCustomerCountAvgSummary @Country VARCHAR(50) AS
BEGIN
		BEGIN TRY
		DECLARE @Total_Customers INT,@Avg_Score FLOAT
			SELECT 
				@Total_Customers = COUNT(*),
				@Avg_Score = AVG(Score)
			FROM Sales.Customers
			WHERE Country=@Country;

			PRINT 'Total Customers From '+@Country+' is :'+CAST(@Total_Customers AS VARCHAR); 
			PRINT 'Average Sales From '+@Country+' is :'+CAST(@Avg_Score AS VARCHAR);

			SELECT
				COUNT(OrderID) TotalOrders,
				SUM(Sales) TotalSales
			FROM Sales.Orders AS o
			INNER JOIN Sales.Customers AS c
			ON o.CustomerID=c.CustomerID
			WHERE c.Country=@Country;

			SELECT SUM(Score)/COUNT(CASE WHEN Country=@Country THEN 1 END)
           FROM Sales.Customers;
		END TRY

		BEGIN CATCH
		   PRINT('Exception: '+ERROR_MESSAGE());
		   PRINT('Line number : '+CAST(ERROR_LINE() AS VARCHAR));
		END CATCH
END

EXEC HandleExceptionCustomerCountAvgSummary @Country= 0;