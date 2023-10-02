USE classicmodels;

# Insert
INSERT INTO employees (employeeNumber, lastName, firstName,
extension, email, officeCode, reportsTo, jobTitle)
VALUES (1945, 'Ahsan', 'Fuad', 'x264', 'fuadahsan123@gmail.com', 3, 1102, 'Data
Analyst');

-- Memasukkan data tanpa nama kolom
INSERT INTO employees
VALUES (1950, 'Cena', 'John', 'x891', 'johncena123@yahoo.com',
3, 1102, 'Security');

-- Memasukkan data pada kolom tertentu
INSERT INTO employees (employeeNumber, firstname, email, officeCode, jobTitle)
VALUES (1956, 'Naruto', 'narutooo@konoha.com', 3, 'Ninja');

-- Memasukkan data dengan nilai NULL
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email,
officeCode, reportsTo, jobTitle)
VALUES (1974, NULL, 'Luffy', 'x3D2Y', 'luffy@kaizoku.com', 5, NULL, 'Pirate'),
		 (1975, NULL, 'Luffy', 'x3D2Y', 'luffy@kaizoku.com', 5, NULL, 'Pirate');

# Update
-- Update satu data
UPDATE employees
SET reportsTo = 1002, jobTitle = 'Pirate King'
WHERE employeeNumber = 1973;

-- Update lebih dari satu data
UPDATE employees
SET officeCode = 5, jobTitle = 'Pirate Crew'
WHERE jobTitle = 'Sales Rep';

-- Update semua data
UPDATE employees
SET lastName = 'Just Monkey';

# Delete
-- Menghapus satu data
DELETE FROM employees
WHERE employeeNumber = 1975;

-- Menghapus lebih dari satu data
DELETE FROM employees
WHERE officeCode = 3;

-- Menghapus semua data
DELETE FROM orderdetails;

classicmodels
DESC employees;

UPDATE offices
SET officeCode = 10
WHERE officeCode = 1;

ALTER TABLE employees DROP FOREIGN KEY employees_ibfk_2;     
ALTER TABLE employees ADD FOREIGN KEY (officeCode) REFERENCES offices (officeCode) ON UPDATE CASCADE;

DROP DATABASE classicmodels;
USE classicmodels;

# Latihan
-- 1
SELECT * FROM customers;
DESCRIBE customers;
INSERT INTO customers
VALUE (500, 'a','a','a','a','a','a','a','a','a','a', 1370, 26.178),
		(501, 'a','a','a','a','a','a','a','a','a','a', 1166, 2.678);

SELECT * FROM offices;
INSERT INTO offices (officeCode, city)
VALUE(20, 'USA');

-- 2
DELETE FROM customers
WHERE customernumber >= 500;

-- 3
SELECT * FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC
LIMIT 5;

UPDATE employees
SET officecode = 20
WHERE jobtitle = 'Sales Rep' AND employeenumber >= 1612;
