USE classicmodels;

# 1. Aggregate Function
-- COUNT - Menghitung semua baris tanpa mengabaikan nilai null
SELECT COUNT(*) FROM customers;

-- Menghitung semua baris tanpa mengabaikan nilai null
SELECT COUNT(addressLine2) FROM offices;

SELECT COUNT('comments') FROM orders;

-- SUM - Menghitung jumlah nilai dalama sebuah kolom
SELECT SUM(creditlimit) FROM customers;
SELECT SUM(addressLine2) FROM customers;

-- AVG - Menghitung rata-rata nilai dalam sebuah kolom (Mengabaikan nilai null)
SELECT AVG(MSRP) FROM products;
SELECT AVG(salesRepEmployeeNumber) FROM customers;

-- MIN & MAX - Mengambil nilai terendah/tertinggi pada sebuah kolom
SELECT MIN(amount) FROM payments;
SELECT MIN(customerName) FROM customers;
SELECT MAX(amount) FROM payments;
SELECT MAX(customerName) FROM customers;

-- GROUP_CONCAT - Menggabungkan nilai-nilai pada kolom dalam baris yang sama menjadi satu string tunggal
SELECT GROUP_CONCAT(firstName SEPARATOR ", ") FROM employees
WHERE officecode = 6;

# 2. Comparison Function
-- COALESCE - Mengembalikan nilai non-null pertama dalam sebuah daftar
SELECT COALESCE(ADDRESSLINE2, state,country) FROM offices;
SELECT COALESCE(ADDRESSLINE2, state, "NDA ADA") FROM offices;

-- GREATEST - Menampilkan nilai tertinggi dalam sebuah daftar
SELECT GREATEST(1,2,3,4,5);
SELECT productname,
		 msrp,
		 buyprice,
		 GREATEST(buyPrice,MSRP) FROM products;

-- lEAST - Menampilkan nilai tertinggi dalam sebuah daftar
SELECT LEAST(1,2,3,4,5);
SELECT LEAST(buyPrice,MSRP) FROM products;

# Date Function
-- DAY - Mengembalikan hari berdasarkan tanggalnya
SELECT DAYNAME(CURRENT_TIMESTAMP),
		 DAY(CURRENT_TIMESTAMP),
		 MONTHNAME(CURRENT_TIMESTAMP),
		 MONTH(CURRENT_TIMESTAMP),
		 YEAR(CURRENT_TIMESTAMP),
		 HOUR(CURRENT_TIMESTAMP),
		 MINUTE(CURRENT_TIMESTAMP),
		 SECOND(CURRENT_TIMESTAMP),
		 CURRENT_TIMESTAMP, NOW(); -- bersinonim

SELECT DATEDIFF("2021-8-30", "2021-8-1");
SELECT requireddate, 
		 shippeddate, 
		 DATEDIFF(requireddate, shippeddate)
FROM orders;

# 4. String Function
-- UPPER & LOWER - Huruf besar & kecil
SELECT UPPER(customerName) FROM customers;
SELECT LOWER(customerName) FROM customers;

-- LEFT & RIGHT - Mengambil karakter string dari kiri atau kanan
SELECT LEFT(productCode,3) FROM products;
SELECT RIGHT(productCode,3) FROM products;

SELECT LEFT("jones",1);
SELECT RIGHT("jones",1);

-- CONCAT - Menggabungkan dua atau lebih string menjadi 1
SELECT CONCAT(firstName,lastName) FROM employees;

-- jones -> Jones
SELECT CONCAT(LEFT(UPPER("jones"), 1), RIGHT("jones", 4));

SELECT customername 
FROM customers
WHERE LEFT(customername, 3) = LEFT(UPPER(customername), 3);

# Grouping
-- GROUP BY - Mengelompokkan baris dalam tabel berdasarkan nilai dalam satu atau beberapa kolom
SELECT customernumber, SUM(amount)
FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 8000;

-- HAVING CLAUSE - Menggunakan filter pada hasil agresi data dari GROUP BY

USE classicmodels;

# Latihan
-- 1
SELECT c.customerName, group_concat(count(p.productname))
FROM customers c
JOIN orders o
USING (customernumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
GROUP BY c.customerName

-- 2
SELECT GROUP_CONCAT(p.productName), pl.productLine
FROM products p
JOIN productlines pl
USING (productline)
GROUP BY pl.productline

-- 3
SELECT CONCAT
		 (LEFT(UPPER("fakultas"), 1), RIGHT("fakultas", 7), 
		 LEFT(UPPER(" mipa"), 2), RIGHT("mipa", 3));