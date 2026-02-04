/*Table Creation (CREATE): Write the SQL statements to create a database named employee and the following tables based on the provided schema:
. Departments
. Location
. Employees
*/

CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;

CREATE TABLE DEPARTMENTS
(Department_id INT,
Department_Name VARCHAR(100));

CREATE TABLE LOCATION
(Location_id INT,
Location VARCHAR(30));

CREATE TABLE EMPLOYEES
(Employee_id INT,
Employee_name VARCHAR(50),
Gender ENUM('M','F'),
Age INT,
Hire_Date DATE,
Designation VARCHAR(100),
Department_id INT,
Location_id INT,
Salary DECIMAL(10,2));

/*Table Alteration (ALTER): Consider the following scenarios and write the SQL statements to alter the structure of the tables accordingly:
⦿ Add a new column named "email" to the Employees table to store employee email addresses.
⦿ Modify the data type of the "designation" column in the Employees table to support a wider range of values.
⦿ Drop the “age” column from the Employees table.
⦿ Rename the “hire_date” column to “date_of_joining”.*/

ALTER TABLE employees
ADD COLUMN Email VARCHAR(30);

ALTER TABLE employees
MODIFY COLUMN Designation VARCHAR(1000),
DROP COLUMN Age,
RENAME COLUMN Hire_Date TO Date_of_Joining;

ALTER TABLE EMPLOYEES
MODIFY COLUMN Email VARCHAR(100);

/*Table Renaming (RENAME): Rewrite the SQL statements to rename the following tables:
. Rename the "Departments" table to "Departments_Info".
. Rename the "Location" table to "Locations".*/

RENAME TABLE DEPARTMENTS TO DEPARTMENTS_INFO;
RENAME TABLE LOCATION TO LOCATIONS;

/*Table Truncation (TRUNCATE): Write an SQL statement to truncate the Employees table.*/

TRUNCATE TABLE EMPLOYEES;

/*Write the SQL statements to drop the Employees table and then the “employee” database.*/

DROP TABLE EMPLOYEES;
DROP DATABASE EMPLOYEE;

/*Database Recreation:
. Drop the 'employee' database if it exists and recreate it using the provided schema, ensuring that all tables are created with the appropriate constraints as instructed.*/

CREATE DATABASE EMPLOYEE;

/*Departments Table:
. Ensure that the "department_id" uniquely identifies each department.
. Set up constraints on the "department_name" to avoid duplicate and null entries.*/

USE EMPLOYEE;
CREATE TABLE DEPARTMENTS
(DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(100) UNIQUE NOT NULL);

/*Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
. Implement constraints to prevent the insertion of null and duplicate locations.*/

USE EMPLOYEE;
CREATE TABLE LOCATION
(LOCATION_ID INT AUTO_INCREMENT PRIMARY KEY,
LOCATION VARCHAR(30) NOT NULL UNIQUE);

/*Employees Table:
. Guarantee that each employee has a distinct identifier.
. Create a restriction to ensure that the employee's name is always provided.
. Limit the acceptable values for the "gender" field to only 'M' or 'F'.
. Enforce a condition to ensure that the employee's age is 18 or above.
. Automatically assign the current date to the "hire_date" field if not specified.
. Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables.*/

USE EMPLOYEE;
CREATE TABLE EMPLOYEES
(EMPLOYEE_ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(50) NOT NULL,
GENDER CHAR(1) CHECK (GENDER IN ('M','F')),
AGE INT CHECK (AGE>=18),
HIRE_DATE DATE DEFAULT(CURRENT_DATE()),
DEPARTMENT_ID INT,
LOCATION_ID INT,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS (DEPARTMENT_ID),
FOREIGN KEY (LOCATION_ID) REFERENCES LOCATION (LOCATION_ID)
);

USE employee;

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

USE employee;
INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

USE EMPLOYEE;
ALTER TABLE EMPLOYEES
ADD COLUMN Designation VARCHAR (50);

USE EMPLOYEE;
ALTER TABLE EMPLOYEES
ADD COLUMN SALARY DECIMAL (10,2);

USE EMPLOYEE;

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

/*Distinct Values:
. a query to retrieve distinct salaries from the Employees table.*/

SELECT DISTINCT SALARY
FROM EMPLOYEES;

/*Alias (AS):
Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.*/

SELECT AGE AS EMPLOYEE_AGE, SALARY AS EMPLOYEE_SALARY
FROM EMPLOYEES;

/*Where Clause & Operators:
 Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
 Find the employee whose designation is missing and fill it with "Data Scientist".*/

SELECT * FROM EMPLOYEES 
WHERE SALARY>50000 AND HIRE_DATE<2016-01-01;

SELECT * FROM  EMPLOYEES;
SET SQL_SAFE_UPDATES = 0;
UPDATE EMPLOYEES
SET DESIGNATION = 'Data Scientist'
WHERE DESIGNATION IS NULL;

/*ORDER BY:
⦿ Find employees sorted by department ID in ascending order and salary in descending order.*/

SELECT * FROM EMPLOYEES ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

/*LIMIT:
. Display the first 5 employees hired in the year 2018.*/

SELECT * FROM EMPLOYEES WHERE YEAR(HIRE_DATE) = 2018
ORDER BY HIRE_DATE
LIMIT 5 ;

/*Aggregate Functions:
⦿ Calculate the sum of all salaries in the Finance department.
⦿ Find the minimum age among all employees.*/

SELECT d.DEPARTMENT_NAME, 
SUM(e.SALARY) AS TOTAL_FINANCE_SALARY 
FROM EMPLOYEES e
JOIN departments d
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE DEPARTMENT_NAME ='FINANCE';
SELECT MIN(AGE) AS MINIMUM_AGE_AMONG_ALL_EMPLOYEES FROM EMPLOYEES;

/*GROUP BY:
. List the maximum salary for each location.
. Calculate the average salary for each designation containing the word 'Analyst'.*/
SELECT l.LOCATION,
MAX(e.SALARY) AS Max_Salary
FROM Employees e
JOIN Location l
ON e.LOCATION_ID = l.LOCATION_ID
GROUP BY l.LOCATION;

SELECT Designation,AVG(SALARY) AS Average_salary
FROM EMPLOYEES
WHERE Designation like '%Analyst%'
GROUP BY Designation;

/*. Find departments with less than 3 employees.
. Find locations with female employees whose average age is below 30.*/

SELECT DEPARTMENT_ID,
COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) < 3;

SELECT l.location,e.GENDER,
AVG(e.age) AS Avg_Age
FROM Employees e
JOIN Location l
ON e.LOCATION_ID = l.LOCATION_ID
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;

/*Inner Join:
⦿ List employee names, their designations, and department names where employees are assigned to a department.*/

SELECT e.employee_name,e.designation,d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

/*Left Join:
⦿ List all departments along with the total number of employees in each department, including departments with no employees.*/

SELECT d.DEPARTMENT_NAME,COUNT(e.EMPLOYEE_ID) AS TOTAL_EMPLOYEES
FROM DEPARTMENTS d 
LEFT JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;

/*Right Join:
⦿ Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name*/

SELECT l.location,e.employee_name
FROM Employees e
RIGHT JOIN Location l
ON e.location_id = l.location_id;

