-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

-- ORDER BY & LIMIT
-- Write a SQL query to display the top 3 most expensive products.

SELECT * FROM product
ORDER BY PRICE DESC 
LIMIT 3;

-- Aggregated results showing total sales, average sale amount, highest and lowest sale amounts.

select count(*) count_of_sales_records from sales;
select sum(sale_amount) Total_sales from sales;
select round(avg(sale_amount)) Average_sales from sales;
select max(sale_amount) Highest_sales from sales;
select min(sale_amount) Lowest_sales from sales;

select count(*) count_of_sales_records ,sum(sale_amount) Total_sales,round(avg(sale_amount)) Average_sales, max(sale_amount) Highest_sales,min(sale_amount) Lowest_sales from sales;

-- Management wants to know which products have total sales amount greater than ₹100.

SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING SUM(s.sale_amount) > 100;

-- Management wants a ranking of products based on their prices.
SELECT product_id,product_name,price,
rank() over (order by price desc) Ranking
from product;



