CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');

-- Show students with their enrolled course names.
SELECT * FROM students;
SELECT * FROM enrollments;
SELECT * FROM courses;

SELECT s.StudentName,e.EnrollmentID,c.CourseName,c.Duration FROM students s
JOIN enrollments e ON s.StudentID = e.StudentID
JOIN courses c ON e.CourseID = c.CourseID;

-- List all students and their courses, including those without matches

SELECT 
    S.STUDENTID,
    S.StudentName,
    E.courseid
FROM Students S
LEFT JOIN Enrollments E
ON S.studentid = E.studentid

UNION

SELECT 
    S.studentid,
    S.studentname,
    E.courseid
FROM Students S
RIGHT JOIN Enrollments E
ON S.studentid = E.studentid;

-- Round the value 123.4567 to two decimal places using the ROUND() function.

 SELECT round((123.4567),2) AS ROUNDED_VALUE;
 
 -- Use ABS() to convert negative numbers to positive and MOD() to find the remainder when 25 is divided by 4.
 
 SELECT ABS(-21) AS POSITIVE_NUM;
 SELECT MOD(25 , 4) AS REMAINDER;
 
 -- Use CONCAT() to merge StudentName and City into one column like “Aarav from Chennai.”

select concat(StudentName,' ' 'from' ' ' ,City) AS ADDRESS FROM students ;

-- Use LENGTH() to display each student’s name along with its character count.

select StudentName, length(StudentName) AS CHARACTER_COUNT FROM STUDENTS;

-- Use REPLACE() to modify course names in the Courses table.

SELECT CourseID,CourseName,replace(CourseName,'SQL Basics','Database Basics') AS Updated_course_name from courses;

-- Use SUBSTRING() to extract the first 3 characters from StudentName.

SELECT StudentID,StudentName,substring(StudentName,1,3) AS Code_Prefix FROM Students;

-- Use UPPER() and LOWER() to show each name in uppercase and lowercase.

SELECT StudentName,UPPER(StudentName) AS UPPER_NAME, LOWER(StudentName) AS LOWER_NAME FROM STUDENTS;

-- The enrollment team needs to calculate report time, duration, and follow-up dates.

SELECT s.StudentName,e.EnrollmentDate,date_add(EnrollmentDate,interval 10 day) as follow_up_date,
datediff('2025-06-01' ,'2025-05-10' ) as days_differences,
now() as current_date_time from students s
join enrollments e ON s.StudentID = e.StudentID;


