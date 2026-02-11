-- List all products sorted by price descending.
USE ecommercedb;
 SELECT product_id,product_name,price FROM product
ORDER BY price DESC;

-- Show the top 3 most expensive products.
SELECT product_id,product_name,price FROM product
ORDER BY price DESC
LIMIT 3;

-- Find the total sales amount across all sales.

SELECT SUM(sale_amount) Total_sales FROM sales;

-- Find the average sale amount from the Sales table.

select round(avg(sale_amount)) Average_sales from sales;

-- Aggregate Functions – Count & Max/Min
select count(*) Count_of_sales from sales;
select max(sale_amount) Highest_sales from sales;
select min(sale_amount) Lowest_sales from sales;

-- GROUP BY – Total Sales per Product
SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id;

-- List products whose total sales exceed ₹50,000.
SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING total_sales>50000;

-- Show total sales per product, sorted descending by total sales.
SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
ORDER BY total_sales desc;

-- Find the top 3 products by total sales amount.
SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
ORDER BY total_sales desc
LIMIT 3;

-- Show products with total sales > ₹30,000 AND average sale amount > ₹10,000.
SELECT s.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales,
    round(AVG(s.sale_amount),2) AS average_sales
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING SUM(s.sale_amount) >30000 AND average_sales>10000;


