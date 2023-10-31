USE classicmodels;

# Union
SELECT customerNumber 'customerNumber/employeeNumber',
		customerName 'customerName/employeeName' FROM customers
UNION
SELECT employeeNumber, CONCAT(firstName, " ", lastName) FROM employees;

SELECT contactlastname, contactfirstname, 'Dari Rusia' AS 'asal'
FROM customers
WHERE country = 'Germany'
UNION
SELECT contactlastname, contactfirstname, 'Dari Jerman' AS 'asal'
FROM customers
WHERE country = 'Russia';

SELECT 'customer' AS 'status', COUNT(*) AS 'jumlah' 
FROM customers
UNION
SELECT 'employee', COUNT(*) 
FROM employees;

-- Union dengan klausa order by
SELECT customerNumber AS 'customerNumber/employeeNumber', 
customerName AS 'customerName/employeeName' FROM customers
WHERE LEFT(customerName, 1) IN ('a', 'i', 'u', 'e', 'o')
UNION
SELECT employeeNumber, CONCAT(firstName, " ", lastName)
FROM employees
WHERE LEFT(firstName, 1) IN ('a', 'i', 'u', 'e', 'o')
ORDER BY `customerName/employeeName`;

# Intersect
SELECT salesrepemployeenumber FROM customers
INTERSECT
SELECT employeenumber FROM employees;

# Except
SELECT customernumber FROM customers
EXCEPT
SELECT customernumber FROM orders;

SELECT customernumber FROM customers
WHERE customernumber IN (SELECT customernumber FROM orders);

-- Latihan
# 1.
SELECT contactfirstname, contactlastname, 'Customer' AS 'Type'
FROM customers
WHERE country = 'USA'
UNION
SELECT firstname, lastname, 'Employee' AS 'Type'
FROM employees
JOIN offices o
USING (officecode)
WHERE o.country = 'USA';

# 2.
SELECT productcode, productname, productline, quantityinstock
FROM products
WHERE productline = 'Classic Cars' AND quantityinstock > 
	(SELECT AVG(quantityinstock) FROM products
	WHERE productline = 'Classic Cars'
	GROUP BY productline)
UNION
SELECT productcode, productname, productline, quantityinstock
FROM products
WHERE productline = 'Vintage Cars' AND quantityinstock > 
	(SELECT AVG(quantityinstock) FROM products
	WHERE productline = 'Vintage Cars'
	GROUP BY productline)

	
# 3.
SELECT DISTINCT e.employeeNumber AS 'emp/cust Number', e.firstName, e.lastName, 'Employee' AS 'Type' 
FROM employees e
JOIN customers c 
ON (c.salesRepEmployeeNumber = e.employeeNumber)
UNION 
SELECT customerNumber, contactFirstName, contactLastName, 'customers' AS 'Type' 
FROM customers
WHERE customerNumber IN (SELECT customerNumber FROM payments);
