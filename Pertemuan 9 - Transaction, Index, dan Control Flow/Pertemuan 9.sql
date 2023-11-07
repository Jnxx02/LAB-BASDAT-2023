USE classicmodels;

-- Transaction
SELECT * FROM payments;

SET autocommit = OFF;

UPDATE payments
SET amount = 700
WHERE customernumber = 103;

ROLLBACK;
COMMIT;

#1.Mulai transaction baru
START TRANSACTION;

#2. Mendapatkan order number terbaru
SELECT @orderNumber :=max(orderNumber)+1 from orders;

# 3. Menambahkan order baru untuk customer 145
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate,
status, customerNumber)
VALUES(@orderNumber,
'2005-05-31',
'2005-06-10',
'2005-06-11',
'In Process',
145);

# 4.Commit Perubahan
COMMIT;

# 5. Mengembalikan data - Rollback (tidak bisa setelah commit)
ROLLBACK;

-- Index
SELECT * FROM customers;

CREATE INDEX idx_customer_order_date ON orders(customername, order_date);

-- Control Flow
SELECT ordernumber, `STATUS`,
(CASE `status`
		WHEN 'shipped' THEN 'Terkirim'
		WHEN 'cancelled' THEN 'Batal'
ELSE 'Unknown'
END) 'Pesan'
FROM orders;

SELECT checkNumber, amount,
case
		when amount > 50000 then 'Banyak'
ELSE 'Sedikit'
END 'Status'
FROM payments;

# Latihan
-- No 2
START TRANSACTION;

SELECT * FROM payments
WHERE amount < 50000;

DELETE from payments
WHERE amount < 50000;

ROLLBACK;

-- No 3
SELECT p.productName, sum(od.quantityOrdered) 'Total',
case 
when `Total` > 800 then 'Laku'
ELSE 'Kurang Laku'
END 'Status'
FROM products p
JOIN orderdetails od
USING (productcode)
GROUP BY od.productCode