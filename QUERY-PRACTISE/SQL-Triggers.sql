
CREATE TABLE auto_add_increment_salary
(id INT PRIMARY KEY,
 name VARCHAR(30),
 salary INT,
 total_Salary INT
 );

CREATE TRIGGER trigger_increment 
ON Sales.Employees
AFTER INSERT 
AS
BEGIN
 INSERT INTO auto_add_increment_salary(id,name,salary,total_salary)
 SELECT EmployeeID,
        FirstName,
        Salary,
        Salary+100
        FROM inserted;
END
 INSERT INTO auto_add_increment_salary VALUES(111,'raju',2000,392);

 SELECT * FROM auto_add_increment_salary;
 SELECT * FROM Sales.Employees;

INSERT INTO Sales.Employees (EmployeeID, FirstName, Salary)
VALUES (6, 'Raju', 2000);

INSERT INTO Sales.Employees(EmployeeID,FirstName,Gender,Salary)
VALUES(7,'Kiran','M',3000);