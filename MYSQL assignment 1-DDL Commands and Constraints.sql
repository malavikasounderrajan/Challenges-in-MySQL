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











