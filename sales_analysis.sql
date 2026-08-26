-- E-Commerce Sales Analysis Project

-- 1. Create Table

CREATE TABLE ecommerce_sales (
    order_id VARCHAR2(10),
    order_date DATE,
    customer_name VARCHAR2(50),
    product VARCHAR2(50),
    category VARCHAR2(30),
    quantity NUMBER,
    unit_price NUMBER,
    payment_mode VARCHAR2(30),
    city VARCHAR2(30),
    total_sales NUMBER
);


-- 2. Insert Data

INSERT INTO ecommerce_sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, payment_mode, city, total_sales)
VALUES
('ORD001', TO_DATE('01-08-2026','DD-MM-YYYY'), 'Ravi', 'Laptop', 'Electronics', 2, 55000, 'UPI', 'Hyderabad', 110000);

INSERT INTO ecommerce_sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, payment_mode, city, total_sales)
VALUES
('ORD002', TO_DATE('02-08-2026','DD-MM-YYYY'), 'Priya', 'Headphones', 'Electronics', 3, 3000, 'CARD', 'Bangalore', 9000);

INSERT INTO ecommerce_sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, payment_mode, city, total_sales)
VALUES
('ORD003', TO_DATE('03-08-2026','DD-MM-YYYY'), 'Anil', 'T-shirt', 'Fashion', 4, 2400, 'UPI', 'Chennai', 9600);

INSERT INTO ecommerce_sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, payment_mode, city, total_sales)
VALUES
('ORD004', TO_DATE('04-08-2026','DD-MM-YYYY'), 'Sita', 'Shoes', 'Fashion', 5, 2500, 'CASH', 'Hyderabad', 12500);

INSERT INTO ecommerce_sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, payment_mode, city, total_sales)
VALUES
('ORD005', TO_DATE('05-08-2026','DD-MM-YYYY'), 'Kiran', 'Mobile', 'Electronics', 6, 22000, 'UPI', 'Bangalore', 132000);


-- 3. Display Formatting

SET LINESIZE 200

COLUMN ORDER_ID FORMAT A10
COLUMN CUSTOMER_NAME FORMAT A15
COLUMN PRODUCT FORMAT A15
COLUMN CATEGORY FORMAT A15
COLUMN PAYMENT_MODE FORMAT A12
COLUMN CITY FORMAT A12
COLUMN QUANTITY FORMAT 999
COLUMN UNIT_PRICE FORMAT 999999
COLUMN TOTAL_SALES FORMAT 999999


-- 4. Display All Orders

SELECT order_id,
       customer_name,
       product,
       category,
       quantity,
       unit_price,
       payment_mode,
       city,
       total_sales
FROM ecommerce_sales
ORDER BY order_id;


-- 5. Total Sales

SELECT SUM(total_sales) AS total_sales
FROM ecommerce_sales;


-- 6. Category-wise Sales

SELECT category,
       SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY category;


-- 7. City-wise Sales

SELECT city,
       SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY city
ORDER BY total_sales DESC;


-- 8. Payment Mode-wise Sales

SELECT payment_mode,
       SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY payment_mode
ORDER BY total_sales DESC;


-- 9. Product-wise Sales

SELECT product,
       SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY product
ORDER BY total_sales DESC;


-- 10. Total Quantity Sold

SELECT SUM(quantity) AS total_quantity
FROM ecommerce_sales;


-- 11. Top-selling Product

SELECT product,
       SUM(total_sales) AS total_sales
FROM ecommerce_sales
GROUP BY product
ORDER BY total_sales DESC
FETCH FIRST 1 ROW ONLY;


-- 12. Product with Maximum Sales

SELECT product,
       total_sales
FROM ecommerce_sales
WHERE total_sales = (
    SELECT MAX(total_sales)
    FROM ecommerce_sales
);


-- 13. Average Order Value

SELECT AVG(total_sales) AS average_order_value
FROM ecommerce_sales;
