-- Create a simple view named EmployeeBasicView that displays:EmpName, DeptID, and Salary from the Employees table.Then, query the view to verify results.
USE companydb;
CREATE VIEW EmployeeBasicView AS 
SELECT EmpName, DeptID,Salary from Employees;
SELECT * FROM EmployeeBasicView;

-- Create a complex view named EmployeeDepartmentView that joins Employees and Departments to show: EmpName, DeptName, Location, and Salary
CREATE VIEW EmployeeDepartmentView AS
SELECT e.EmpName,d.DeptName,d.Location,e.Salary FROM employees as e
JOIN departments as d ON e.DeptID = d.DeptID;
SELECT * FROM EmployeeDepartmentView ;

-- Create a complex view named DeptSalaryStats that shows each department’s name, average salary, and number of employees
CREATE VIEW DeptSalaryStats AS
SELECT d.DeptName,ROUND(AVG(e.SALARY)) AS AVGSALARY,COUNT(e.EmpID) AS NoOfEmployees FROM employees AS e  
join departments as d ON e.DeptID = d.DeptID
group by DeptName;

SELECT * FROM DeptSalaryStats;

-- Use the EmployeeBasicView to update each employee’s salary by ₹5,000. Ensure the change reflects in the main Employees table.
USE EmployeeBasicView;
SET SQL_SAFE_UPDATES = 0;
UPDATE EmployeeBasicView
SET Salary = (Salary + 5000); 
SELECT EmpName,Salary UPDATE_SALARY FROM employees;

-- Drop the DeptSalaryStats view from the database.
DROP VIEW DeptSalaryStats;
 
 -- Create a BEFORE INSERT trigger named check_min_salary on the Employees table to block any insert with Salary < 30000.
 DELIMITER //
CREATE TRIGGER check_min_salary
BEFORE INSERT ON Employees FOR EACH ROW
BEGIN
    IF NEW.Salary < 30000 THEN SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Salary must be atleast 30000';
    END IF;
END //
DELIMITER ;
INSERT INTO Employees (EmpName, DeptID, Salary)
VALUES ('Rahul', 2, 25000);

/*Create a new table EmployeeAudit(EmpID, EmpName, Action, ActionDate).
Then create an AFTER INSERT trigger named log_employee_insert to insert a record into EmployeeAudit whenever a new employee is added.*/
CREATE TABLE EmployeeAudit(
EmpID INT, 
EmpName VARCHAR(50), 
Action VARCHAR(50), 
ActionDate DATETIME);
DELIMITER //
CREATE TRIGGER log_employee_insert
AFTER INSERT ON employees FOR EACH ROW
BEGIN
	INSERT INTO EmployeeAudit (EmpID, EmpName, Action, ActionDate)
    VALUES (NEW.EmpID, NEW.EmpName, 'INSERT', NOW());
END //
DELIMITER ;
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary)
VALUES (8, 'Kiran', 1, 45000);
SELECT * FROM EmployeeAudit;

/*Create a table SalaryLog(EmpID, OldSalary, NewSalary, ChangeDate).
Then create an AFTER UPDATE trigger named log_salary_change that logs every time an employee’s salary is updated.*/
CREATE TABLE SalaryLog(EmpID INT, 
OldSalary DECIMAL(10,2), 
NewSalary DECIMAL (10,2),
ChangeDate datetime); 
DELIMITER // 
CREATE TRIGGER log_salary_change
AFTER UPDATE ON employees FOR EACH ROW
BEGIN
	IF Old.Salary <> New.Salary THEN
    INSERT INTO SalaryLog(EmpID, OldSalary, NewSalary, ChangeDate)
    VALUES(New.EmpID, Old.Salary, New.Salary, NOW());
    END IF;
END //
DELIMITER ;
UPDATE employees
SET Salary = 50000
WHERE EmpID = 101;
SELECT * FROM SalaryLog;

/* Create a BEFORE DELETE trigger named prevent_it_delete
that prevents deletion of employees where DeptID corresponds to the IT department*/
DELIMITER //
CREATE TRIGGER prevent_it_delete
BEFORE DELETE ON employees FOR EACH ROW
BEGIN
	IF OLD.DeptID =(SELECT DeptID FROM Departments 
		WHERE DeptName = 'IT')  THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete employees from IT department';
    END IF;
END //
DELIMITER ;
DELETE FROM Employees
WHERE EmpID =1 ;

/* Create a new table EmployeeArchive(EmpID, EmpName, DeptID, Salary, ExitDate). Then create an AFTER DELETE trigger named archive_deleted_employee
that automatically inserts the deleted record into EmployeeArchive.*/
CREATE TABLE EmployeeArchive(EmpID INT, 
EmpName VARCHAR(100), 
DeptID INT, 
Salary DECIMAL (10,2), 
ExitDate DATETIME);
DELIMITER //
CREATE TRIGGER archive_deleted_employee
AFTER DELETE ON employees FOR EACH ROW
BEGIN
	INSERT INTO EmployeeArchive(EmpID, EmpName, DeptID, Salary, ExitDate)
    VALUES (Old.EmpID, Old.EmpName, Old.DeptID, Old.Salary, NOW());
END//
DELIMITER ;
DELETE FROM Employees
WHERE EmpID =2 ;
SELECT * FROM EmployeeArchive;









 