 USE classicmodels

-- 1
SELECT c.customerName, pr.productName, p.paymentDate, o.`status`
FROM customers c
	JOIN orders o
	USING (customernumber)
	JOIN orderdetails od
	USING (ordernumber)
	JOIN products pr
	USING (productcode)
	JOIN payments p
	USING (customernumber)
WHERE o.`status` = 'Shipped' && pr.productName LIKE '%Ferrari%'
ORDER BY pr.productName;

-- 2
# a.
SELECT c.customerName 'Nama Customer',
		 p.paymentDate 'Tanggal Pembayaran', 
		 e.firstName 'Nama Depan',
		 e.lastName 'Nama Belakang'
FROM customers c
	JOIN payments p
	USING (customernumber)
	JOIN employees e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY c.customerName;

# b.
SELECT c.customerName 'Nama Customer',
		 p.paymentDate 'Tanggal Pembayaran', 
		 e.firstName 'Nama Depan',
		 e.lastName 'Nama Belakang'
FROM customers c
	JOIN payments p
	USING (customernumber)
	JOIN employees e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY p.amount DESC
LIMIT 1;

# c.
SELECT c.customerName, pr.productName
FROM customers c
	JOIN orders o
	USING (customernumber)
	JOIN orderdetails od
	USING (ordernumber)
	JOIN products pr
	USING (productcode)
	JOIN payments p
	USING (customernumber)
WHERE c.customerName = 'Corporate Gift Ideas Co.';

# d.
SELECT GROUP_CONCAT(c.customerName), GROUP_CONCAT(pr.productName)
FROM customers c
	JOIN orders o
	USING (customernumber)
	JOIN orderdetails od
	USING (ordernumber)
	JOIN products pr
	USING (productcode)
	JOIN payments p
	USING (customernumber)
WHERE c.customerName = 'Corporate Gift Ideas Co.'

-- 3
SELECT c.customerName, 
		 o.orderDate,
		 o.shippedDate, 
		 (o.shippedDate - o.orderDate) 'Waktu Pengiriman'
FROM customers c
	JOIN orders o
	USING (customernumber)
WHERE c.customerName = 'GiftsForHim.com'
ORDER BY o.orderDate DESC;
# Berdasarkan data yang didapatkan, customer dengan nama
# ‘GiftsForHim.com’ hanya menunggu selama 1 hari pada orderan terakhirnya.

-- 4
USE world

SELECT c.`Name`
FROM country c
WHERE c.`Code`LIKE 'C_K' && c.LifeExpectancy != 0;