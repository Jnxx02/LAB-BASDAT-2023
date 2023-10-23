USE classicmodels;

# NO 1
SELECT o.addressline1, 
		o.addressLine2, 
		o.city, 
		o.country 
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o
USING(officeCode)
WHERE c.customerNumber = (
		SELECT customerNumber FROM payments
		GROUP BY customerNumber
		ORDER BY COUNT(*)
		LIMIT 1);

# No 2
SELECT CONCAT(e.firstName, ' ', e.lastName) 'nama employee', 
		p.amount 'pendapatan'
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING (customernumber)
WHERE p.amount = 
		(SELECT MAX(amount) FROM payments) 
OR p.amount = 
		(SELECT MIN(amount) FROM payments);

# No 3
USE  world;

SELECT
    c.`Name` 'Negara',
    c.Population 'Pengguna Bahasa'
FROM country c
JOIN countrylanguage cl
ON c.`Code` = cl.CountryCode
WHERE cl.`language` = 
		(SELECT countrylanguage.`language`
		FROM countrylanguage
		JOIN country
		ON country.`Code` = countrylanguage.CountryCode
		WHERE country.Continent = 'Asia'
		GROUP BY countrylanguage.`language`
		ORDER BY COUNT(countrylanguage.`language`) DESC
		LIMIT 1);

# No 4
USE classicmodels;

SELECT c.customerName, 
		SUM(p.amount) AS 'Total pembayaran', 
		(SELECT SUM(quantityOrdered) FROM orderdetails
		JOIN orders
		USING (orderNumber)
		JOIN customers c2
		USING (customerNumber)
		WHERE c2.customerNumber = c.customerNumber
		GROUP BY c.customerNumber) 'banyak barang', 
		(SELECT GROUP_CONCAT(productName SEPARATOR '; ')
		FROM products
		JOIN orderdetails
		USING (productCode)
		JOIN orders
		USING (orderNumber)
		JOIN customers c2
		USING (customerNumber)
		WHERE c2.customerNumber = c.customerNumber
		GROUP BY c.customerNumber) 'produk yang dibeli'
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY customerNumber
HAVING SUM(p.amount) > 
		(SELECT AVG(payments.amount) FROM payments);



