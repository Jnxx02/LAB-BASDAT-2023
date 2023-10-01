USE classicmodels;

# 1. Inner Join
SELECT c.customerNumber, c.contactFirstName, p.amount
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE p.amount < 5000
ORDER BY p.amount DESC
LIMIT 1;

-- Inner Join dengan 3 tabel
SELECT C.customerNumber, C.contactFirstName, P.amount, O.status
FROM customers AS C 
INNER JOIN payments AS P
ON C.customerNumber = P.customerNumber
INNER JOIN orders AS O
ON C.customerNumber = O.customerNumber;

# 2. Outer Join
-- Left Join
SELECT c.customerNumber, c.contactFirstName, o.orderNumber, od.quantityOrdered
FROM customers AS c
LEFT JOIN orders AS o	
ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
WHERE o.orderNumber is NULL

-- Right Join
SELECT c.customerNumber, c.contactFirstName, o.orderNumber
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.customerNumber = o.customerNumber;

# Latihan
-- 1
SELECT distinct c.customername,  p.productname
FROM customers c
JOIN orders o
ON c.customerNumber = o.customernumber
JOIN orderdetails od
ON o.ordernumber = od.ordernumber
JOIN products p
ON od.productcode = p.productcode
WHERE p.productname = '1982 Camaro Z28';

--2
SELECT c.customername, p.paymentdate
FROM customers c
JOIN payments p
ON c.customernumber = p.customernumber
WHERE p.paymentdate >= '2005-01-01';

-- 3
SELECT c.customername, e.firstname
FROM customers c
LEFT JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber;

-- 4
SELECT c.customername, p.paymentdate, p.amount
FROM customers c
JOIN payments p
ON c.customernumber = p.customernumber
ORDER BY p.amount DESC
LIMIT 1;

-- 5
SELECT c.customername, o.status
FROM customers c
JOIN orders o
ON c.customernumber = o.customerNumber
WHERE o.status = 'Cancelled';