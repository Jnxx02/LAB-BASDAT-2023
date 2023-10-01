USE classicmodels; 
 
# 1. SELECT => menampilkan value/ record dari database                       
## a. menampilkan kolom tertentu                                             
### Menampilkan 1 kolom
SELECT customername
FROM customers;
SELECT lastname
FROM employees;
SELECT country
FROM offices; 
 
### Beberapa kolom
SELECT customernumber, customername, city
FROM customers; 
--
SELECT productcode, productname, productvendor, productdescription
FROM products; 
 
## b. Penggunaan alias
SELECT customernumber AS 'id pelanggan', customername AS 'nama pelanggan', city AS 'city'
FROM customers; 
-- Tanpa AS
SELECT firstname 'nama_depan', lastname 'nama_belakang'
FROM employees; 
-- Tanpa Kutip (- tidak bisa spasi)
SELECT city AS kota
FROM customers; 
 
## c. Menampilkan semua kolom
SELECT *
FROM orders; 
--
SELECT *
FROM payments; 
 
# 2. WHERE => IF TRUE TAMPILKAN, ELSE JANGANMI
## a. Operator =
SELECT customername 'nama', country 'negara'
FROM customers
WHERE country = 'USA';
--
SELECT customername 'nama', city 'kota'
FROM customers
WHERE city = 'MADRID';

## b. Operator !=
SELECT customername 'nama', country 'negara'
FROM customers
WHERE country != 'USA';
--
SELECT customername 'nama', city 'kota'
FROM customers
WHERE city <> 'MADRID';

## c. Operator >, <, >=, <=
SELECT *
FROM payments
WHERE amount > 2000;
--
SELECT *
FROM orderdetails
WHERE quantityordered < 20;

# 3. ORDER BY => mengurutkan secara ASC (A-Z) atau DESC (Z-A), DEFAULT = ASC
SELECT customername 'nama'
FROM customers
ORDER BY customername DESC;
--
SELECT amount
FROM payments
ORDER BY amount DESC;
--
SELECT quantityordered
FROM orderdetails
WHERE quantityordered < 30
ORDER BY quantityordered DESC;

#  4. LIMIT => membatasi baris yang mau ditampilkan
SELECT customernumber, customername
FROM customers;

## LIMIT
SELECT customernumber, customername
FROM customers
LIMIT 10;

## OFFSET => (m,n) m= start dari index ke berapa (Batas atas), n = jumlah baris
SELECT customernumber, customername
FROM customers
LIMIT 3 OFFSET 10;
LIMIT 3, 10;
-- 
SELECT customernumber, customername, country
FROM customers
WHERE country = 'usa'
ORDER BY customername desc
LIMIT 10;

# 5. DISTINCT => unique artinya jika ada value yang sama maka hanya diwakili 1
SELECT city
FROM customers
ORDER BY city;
--
SELECT DISTINCT city
FROM customers
ORDER BY city;

-- Latihan
-- 1

SELECT customername AS 'Nama Pelanggan', customernumber AS 'No.hp', city AS 'kota', country AS 'negara'
FROM customers
WHERE country ='netherlands'
-- 2

SELECT productName AS 'nama produk', productLine AS 'Kategori produk', productDescription AS 'Deskripsi produk'
FROM products
WHERE productLine = 'Planes'
ORDER BY productName DESC;
-- 3

SELECT customernumber AS 'id pelanggan', customername AS 'nama pelanggan', country AS 'negara', creditlimit AS 'limit credit'
FROM customers
WHERE country != 'usa'
ORDER BY creditlimit DESC
LIMIT 5
