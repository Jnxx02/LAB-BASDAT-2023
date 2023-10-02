USE classicmodels;

# 1.
SELECT c.customername AS "Nama Customer", c.country AS "Negara", p.paymentdate AS "Tanggal"
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE p.paymentdate > "2004-12-31";

# 2.
SELECT DISTINCT c.customername AS "Nama Customer", p.productname, pl.textdescription
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON o.ordernumber = od.ordernumber
JOIN products p
ON od.productCode = p.productCode
JOIN productlines pl
ON p.productLine = pl.productLine
WHERE p.productName = "The Titanic";

# 3.
ALTER TABLE products
ADD `status` VARCHAR(20);

SELECT * FROM orderdetails
ORDER BY quantityordered DESC;

UPDATE products
SET `status` = "Best Selling"
WHERE productcode = "S12_4675";

SELECT p.productCode, p.productName, od.quantityordered, p.status
FROM products p
JOIN orderdetails od
ON p.productCode = od.productCode
ORDER BY od.quantityOrdered DESC
LIMIT 1;

# 4.
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1;
ALTER TABLE payments ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE orders ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_1;
ALTER TABLE orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE;

DELETE c
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE `status` = "Cancelled";

SELECT * FROM orders
WHERE `status` = "Cancelled";