USE classicmodels;

-- Subquery dalam select
SELECT customernumber, customername,
	(SELECT COUNT(*) FROM payments
	WHERE customers.customerNumber = payments.customerNumber) 'How Much Order'
FROM customers;

# Jumlah pelanggan yang dilayani oleh setiap karyawan
SELECT employeenumber,
	(SELECT COUNT(*) FROM customers
	WHERE employees.employeeNumber = customers.salesRepEmployeeNumber) 'Jumlah'
FROM employees
WHERE (SELECT COUNT(*) FROM customers
	WHERE employees.employeeNumber = customers.salesRepEmployeeNumber) != 0;
	
-- Subquery dalam where
SELECT p.customerNumber, c.customerName,
p.checknumber, p.amount
FROM payments p
JOIN customers c 
USING(customernumber)
WHERE amount =
	(SELECT MIN(amount) FROM payments);
	
	
SELECT customername, customernumber, 
	(SELECT SUM(amount)
	FROM payments
	GROUP BY customernumber
	ORDER BY amount LIMIT 1)
FROM customers
WHERE customernumber = 
	(SELECT customernumber
	FROM payments
	GROUP BY customernumber
	ORDER BY amount LIMIT 1);

-- Subquery dalam from
SELECT COUNT(ordernumber)
FROM orders
GROUP BY customernumber
ORDER BY COUNT(ordernumber);

SELECT MAX(jumlah) 'Max Order', MIN(jumlah) 'Min Order'
FROM (
	SELECT customerNumber, COUNT(customerNumber) 'Jumlah' 
	FROM orders GROUP BY customerNumber) AS Ordered;

# Rata-rata pemesanan yang dilakukan customers
SELECT AVG(jumlah)
FROM (
	SELECT COUNT(*) 'Jumlah'
	FROM orders
	GROUP BY customernumber) AS a;

-- IN/NOT IN dalam subquery
SELECT employeenumber, CONCAT(firstname, ' ', lastname)
FROM employees
WHERE officecode NOT IN
	(SELECT employeenumber
	FROM employees
	WHERE officecode = 1);
	
SELECT customernumber
FROM customers
WHERE customernumber IN
	(SELECT customernumber FROM payments
	ORDER BY customernumber);
	
SELECT DISTINCT customernumber FROM payments
ORDER BY customernumber

-- Exist/Not Exist dalam subquery
SELECT customerNumber, customerName
FROM customers c
WHERE EXISTS (
	SELECT customers.customerNumber, customers.customerName,
	COUNT(payments.checkNumber) AS orderNumber
	FROM customers
	LEFT JOIN payments 
	USING (customernumber)
	WHERE customers.customerNumber = c.customerNumber
	GROUP BY customers.customerNumber HAVING orderNumber > 8);
	
-- Correlated subquery
SELECT productName, buyPrice
FROM products p
WHERE buyPrice >
	(SELECT AVG(buyPrice)
	FROM products
	WHERE productline = p.productline)

-- Latihan Soal
# 5
SELECT employeenumber
FROM employees
WHERE officecode IN 
	(SELECT officecode FROM offices
	WHERE officecode % 2 = 0);