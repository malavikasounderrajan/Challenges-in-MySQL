-- Data Base CompanyDB
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- 2CREATE TABLES
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    PerformanceRating INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- INSERT SAMPLE DATA
INSERT INTO Departments (DeptName, Location) VALUES
('HR', 'Chennai'),
('Finance', 'Bangalore'),
('IT', 'Hyderabad'),
('Marketing', 'Pune');

INSERT INTO Employees (EmpName, DeptID, Salary, JoinDate, PerformanceRating) VALUES
('Aarav', 3, 75000, '2022-06-15', 5),
('Diya', 2, 60000, '2023-02-01', 4),
('Ravi', 1, 45000, '2024-03-20', 3),
('Meena', 3, 82000, '2021-11-10', 5),
('Karan', 4, 50000, '2022-12-25', 2),
('Sneha', 2, 70000, '2023-07-05', 4),
('Vikram', 3, 65000, '2024-01-12', 3);

/*Create a User-Defined Function (UDF) named GetBonus() that takes salary as input and returns 10% of it.
Then, display each employee’s name, salary, and calculated bonus.*/
DELIMITER $$
CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END $$
DELIMITER ;
USE CompanyDB;
select EmpName,Salary,GetBonus(Salary) Annual_bonus from employees;

/* Use a single-row subquery to compare each employee’s salary with the overall average salary.
List of employees with EmpName | Salary who earn more than the average.*/

SELECT EmpName AS List_of_employees_with_EmpName , Salary AS Salary_who_earn_more_than_the_average FROM employees
WHERE Salary > (SELECT AVG(Salary)FROM employees);

/* Use a multi-row subquery to get the department IDs for those locations,
then display all employees belonging to those departments.*/

SELECT EmpName, DeptID FROM employees
WHERE DeptID IN (SELECT DeptID FROM departments
WHERE Location IN ('Hyderabad', 'Pune'));

/* Create a Stored Procedure called UpdateSalaryByPerformance() that updates employee salaries according to these rules.
Execute the procedure and verify the results.*/

DELIMITER $$
CREATE PROCEDURE UpdateSalaryByPerformance()
BEGIN
    UPDATE employees
    SET Salary = 
        CASE
            WHEN PerformanceRating = 5 THEN Salary * 1.20
            WHEN PerformanceRating = 4 THEN Salary * 1.10
            WHEN PerformanceRating = 3 THEN Salary * 1.05
            ELSE Salary
        END;
END $$
DELIMITER ;
SET SQL_safe_updates = 0;
CALL UpdateSalaryByPerformance();

SELECT EmpName,PerformanceRating,Salary AS Updated_Salary FROM employees;

/* Create a CTE (Common Table Expression) named TopSalaries that ranks employees by salary
and returns only the top 3 records.*/

WITH TopSalaries AS (SELECT EmpName,Salary,RANK() OVER (ORDER BY Salary DESC) AS SalaryRank FROM employees)
SELECT EmpName, Salary, SalaryRank FROM TopSalaries
WHERE SalaryRank <= 3;

/*Create a CTE named DeptAvg that calculates average salary per department
and join it with the Departments table to display department names.*/
 
 WITH DeptAvg AS (SELECT DeptID,round(AVG(Salary)) AS AvgSalary FROM employees GROUP BY DeptID)
SELECT d.DeptName,da.AvgSalary FROM DeptAvg da
JOIN departments d ON da.DeptID = d.DeptID;

/* Use a multi-row subquery with the ANY operator to compare salaries against HR department employees.*/

SELECT EmpName, Salary FROM employees
WHERE Salary > ANY (SELECT Salary FROM employees
WHERE DeptID = (SELECT DeptID FROM departments
WHERE DeptName = 'HR'));

/* First, call the stored procedure UpdateSalaryByPerformance().
Then, use the GetBonus() function in a SELECT statement to display both salary and bonus.*/

CALL UpdateSalaryByPerformance();
SELECT EmpName,Salary AS Updated_Salary,
GetBonus(Salary) AS Annual_Bonus FROM employees;

/* Use a CTE to calculate average salary per department
and filter out departments with AvgSalary > 65000*/

WITH DeptAvg AS (SELECT DeptID,ROUND(AVG(Salary)) AS AvgSalary FROM employees GROUP BY DeptID)
SELECT d.DeptName,da.AvgSalary FROM DeptAvg da
JOIN departments d ON da.DeptID = d.DeptID
WHERE da.AvgSalary > 65000;

/* Use a nested subquery to get the maximum salary per department
and return the employee(s) who match that salary*/

SELECT e.EmpName,d.DeptName,e.Salary FROM employees e
JOIN departments d ON e.DeptID = d.DeptID
WHERE e.Salary = (SELECT MAX(e2.Salary) FROM employees e2
WHERE e2.DeptID = e.DeptID);










