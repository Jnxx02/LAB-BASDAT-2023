classicmodels

# Operator Aritmatika
SELECT employeenumber, reportsto + 2
FROM employees;

# Operator Bitwise
SELECT * FROM payments
WHERE amount & 3 = 3;

SELECT priceeach & quantityordered
FROM orderdetails;

# Operator Pembanding
SELECT * FROM products
WHERE quantityinstock >= 4000;

# Operator Logika
-- IN
SELECT customername, country FROM customers
WHERE country NOT IN ('USA', 'spain');

-- LIKE
SELECT customername, phone FROM customers
WHERE phone LIKE '(%)%';

SELECT * FROM orderdetails 
WHERE productCode 
LIKE 'S18%9' 
AND (priceEach NOT BETWEEN 70 AND 100);

-- Predicate
SELECT * FROM customers 
WHERE state IS NOT NULL AND addressLine2 IS NOT NULL;

SELECT * FROM employees
WHERE reportsto IS NOT NULL;

# Latihan
use classicmodels

-- 1
SELECT CONCAT (e.firstname, ' ', e.lastname) AS 'name', e.email, e.officecode, o.city, o.country
FROM employees AS e
JOIN offices AS o
ON e.officecode = o.officeCode
WHERE e.officecode % 2 = 0;

-- 2
SELECT DISTINCT p.productName, 
p.MSRP * 0.8 AS '80% MSRP' , od.priceEach,
od.priceEach - (p.MSRP * 0.8) as keuntungan
FROM products p
INNER JOIN orderdetails od
USING (productcode)
WHERE od.priceEach > (0.8*p.MSRP);

-- 3
SELECT c.customername, c.country, p.amount
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE country != 'japan' AND country != 'spain'
ORDER BY country ASC;

-- 4
SELECT p.productCode, p.productName, p.productLine
FROM products p
WHERE p.productLine LIKE '%cars' 

-- 5
SELECT c.customername, o.orderDate, o.status
FROM customers c
JOIN orders o
USING (customernumber)
WHERE o.orderdate LIKE '%-01-%';

SELECT country / city FROM customers
