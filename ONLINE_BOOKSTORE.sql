/* CREATE TABLE with PRIMARY & FOREIGN KEY*/

CREATE DATABASE Online_Bookstore;
USE Online_Bookstore;

CREATE TABLE Books(
BookID   INT PRIMARY KEY,
Title    VARCHAR(100) NOT NULL,
Author   VARCHAR(50) NOT NULL,
ISBN     VARCHAR(20) UNIQUE,
Price    DECIMAL(8,2) CHECK(Price > 0)
);

CREATE TABLE Orders(
OrderID  INT PRIMARY KEY,
BookID   INT, 
OrderDate  DATE NOT NULL,
Quantity  INT CHECK(Quantity > 0),
FOREIGN KEY(BookID)  REFERENCES Books(BookID)
);

-- ALTER TABLE – Add Default Constraint

ALTER TABLE Books
MODIFY ISBN  VARCHAR(20) DEFAULT 'NOT ASSIGNED';

-- INSERT, RETRIEVE & UPDATE with Constraints

SELECT * FROM Books;
INSERT INTO Books (BookID, Title, Author, ISBN, Price) VALUES 
(1, 'Data Analytics Basics', 'John Smith', 'ISBN1001', 599.50),
(2, 'SQL Mastery', 'Alice Brown','ISBN1002', 799.00),
(3, 'Python for Data Science', 'David Lee', 'ISBN1003', 999.00),
(4, 'Power BI Guide', 'Robert King', 'ISBN1004', 899.00),
(5, 'Advanced SQL', 'Emma Watson', 'ISBN1005', 1099.00);
SELECT * FROM Books;

UPDATE Books
SET Price = 0
WHERE Bookid = 3;

-- DELETE vs TRUNCATE

DELETE FROM Books
WHERE Bookid = 3;

SELECT * FROM Books;

TRUNCATE TABLE Orders;

SELECT * FROM Orders;






