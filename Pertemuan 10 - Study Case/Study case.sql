-- USE classicmodels;
DROP DATABASE db_studycase;
-- No 1
CREATE DATABASE db_studycase;

CREATE TABLE productss (
	product_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(100),
	price DECIMAL(10,2) NOT NULL,
	category VARCHAR(50) NOT NULL, 
	stock_quantity INT(11) NOT NULL );
	
CREATE TABLE orderss (
	order_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	order_date DATE NOT NULL,
	total_amount DECIMAL(10,2) NOT NULL);
	
CREATE TABLE order_items (
	order_item_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	order_id INT(11) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES 
		orderss (order_id),
	product_id INT(11) NOT NULL,
	FOREIGN KEY (product_id) REFERENCES 
		productss (products_id),
	quantity INT(11) NOT NULL,
	unit_price DECIMAL(10,2) NOT NULL
	);
		
INSERT INTO productss
	(product_name, price, category, stock_quantity) 
	VALUES 
	('Laptop', 800, 'Electronics', 10),
	('T-shirt', 20, 'Apparel', 50),
	('Coffee Maker', 50, 'Kitchen', 30);
	
INSERT INTO orderss
	(order_date, total_amount) 
	VALUES 
	('2023-09-01', 820),
	('2023-09-02', 40),
	('2023-09-03', 100);
	
INSERT INTO order_items
	(quantity, unit_price) 
	VALUES 
	(10, 800),
	(200, 20),
	(11, 50);
	
SELECT * FROM productss;
SELECT * FROM orderss;

-- 1
USE classicmodels;

SELECT c.customerName, GROUP_CONCAT(p.productName)
FROM customers c
JOIN orders o
USING (customernumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
WHERE c.addressLine2 IS NOT NULL AND c.state IS NOT NULL AND c.postalCode IS NOT null
GROUP BY c.customerNumber

-- 3
SELECT c.customerName, pa.paymentDate, 
		MONTHNAME(pa.paymentDate) AS 'bulan_pembayaran', 
		COUNT(od.productCode) AS 'jumlah_produk'
FROM customers c
JOIN payments pa
USING (customernumber)
JOIN orders o
USING (customernumber)
JOIN orderdetails od
USING (orderdetails)
WHERE MONTHNAME(pa.paymentDate) = 'April' AND COUNT(pa.customerNumber) % 2 = 1
GROUP BY c.customerNumber;