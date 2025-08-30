CREATE PROCEDURE ReverseNumber @Value INT 
AS
	BEGIN
	 DECLARE  @Temp INT=0,
			  @Rem INT,
			  @Dupl INT = @Value
		IF @Value<0
		    BEGIN
			   SET @Value = -(@Dupl)
		    END
		WHILE @Value>0
		   BEGIN
		     SET @Rem = @Value%10
			 SET @Value = @Value/10
			 SET @Temp = 10*@Temp+@Rem
		   END
   PRINT ('Reverse of a Number for '+CAST(@Dupl AS VARCHAR)+'is :'+CAST(@Temp AS VARCHAR))
	END

	EXEC ReverseNumber @Value = 1234;