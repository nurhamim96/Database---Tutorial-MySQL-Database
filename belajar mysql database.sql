
## Chek engine in Database Mysql.
SHOW ENGINES; 

## Create Database
CREATE SCHEMA belajar_mysql;

## Use Database
USE belajar_mysql;

## Create Table
CREATE Table barang (
id INT,
nama VARCHAR(100),
harga INT,
jumlah INT
)ENGINE = InnoDB; 

## Show Table
SHOW TABLES;

## Describe Table 'barang'
DESC barang;

## Show structure how to create Table 'barang'
SHOW CREATE TABLE barang;

##### CHANGE TABLE #####

## Add Column in Table
ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
ADD COLUMN salah TEXT;

## Remove Column in Table
ALTER TABLE barang 
DROP COLUMN salah;

## Modify Column type in Table
ALTER TABLE barang 
MODIFY nama VARCHAR(200);

## Move after 'column'
ALTER TABLE barang 
MODIFY nama VARCHAR(200) AFTER deskripsi;

## Move first
ALTER TABLE barang 
MODIFY nama VARCHAR(200) FIRST;

##### NULL VALUE #####
CREATE Table barang_not_null (
id INT NOT NULL,
nama VARCHAR(100) NOT NULL,
harga INT NOT NULL,
jumlah INT 
)ENGINE = InnoDB; 

ALTER TABLE barang_not_null
MODIFY jumlah INT NOT NULL;

DESC barang_not_null;

##### DEFAULT VALUE #####
CREATE Table barang_default_value (
id INT NOT NULL,
nama VARCHAR(100) NOT NULL,
harga INT NOT NULL DEFAULT 0,
jumlah INT 
)ENGINE = InnoDB; 

ALTER TABLE barang_default_value
MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang_default_value
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

DESC barang_default_value;

INSERT INTO barang_default_value(id, nama) VALUES(1, 'apel');

SELECT * FROM barang_default_value;

##### TRUNCATE TABLE #####
CREATE Table barang_truncate (
id INT NOT NULL,
nama VARCHAR(100) NOT NULL,
harga INT NOT NULL DEFAULT 0,
jumlah INT NOT NULL DEFAULT 0,
waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE = InnoDB; 

INSERT INTO barang_truncate(id, nama) 
VALUES
(1, 'apel'),
(2, 'mangga'),
(3, 'jeruk');

SELECT * FROM barang_truncate;

TRUNCATE barang_truncate;

SELECT * FROM barang_truncate;

##### REMOVE TABLE #####
DROP TABLE barang_truncate;

SHOW TABLES;

##### INSERT DATA IN TABLE #####
CREATE TABLE products
(
 id VARCHAR(10) NOT NULL,
 name VARCHAR(100) NOT NULL,
 description TEXT,
 price INT UNSIGNED NOT NULL,
 quantity INT UNSIGNED NOT NULL DEFAULT 0,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

DESC products;

INSERT INTO products(id, name, price, quantity)
VALUES
('P0001', 'Mie Ayam Original', 15000, 30);

INSERT INTO products(id, name, description, price, quantity)
VALUES
('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 30);

INSERT INTO products(id, name, price, quantity)
VALUES
('P0003', 'Mie Ayam Ceker', 20000, 30),
('P0004', 'Mie Ayam Spesial', 25000, 30),
('P0005', 'Mie Ayam Yamin', 15000, 30);

##### SELECT DATA #####
SELECT * FROM products; ## Select all

SELECT id, name, price, quantity FROM products; ## Select specific column 

##### PRIMARY KEY #####
ALTER TABLE products
ADD PRIMARY KEY(id);

DESC products;

SHOW CREATE TABLE products;

## INSERT INTO products(id, name, price, quantity) VALUES ('P0001', 'Mie Ayam Original', 15000, 30); ERROR, Because Duplicate entry

##### WHERE CLAUSE #####
SELECT * FROM products WHERE price = 15000;

SELECT * FROM products WHERE id = 'P0001';

SELECT * FROM products WHERE name = 'Mie Ayam Spesial';

##### UPDATE DATA #####
ALTER TABLE products
ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-Lain')
AFTER name;

DESC products;

SELECT * FROM products WHERE id = 'P0001';

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

UPDATE products
SET price = price + 5000
WHERE id = 'P0005';

SELECT * FROM products;

##### DELETE DATA #####
INSERT INTO products(id, name, price, quantity)
VALUES
('P0009', 'Mie Ayam Original', 15000, 30);

SELECT * FROM products;

DELETE FROM products
WHERE id = 'P0009';

SELECT * FROM products;

##### ALIASES FOR COLUMN #####
SELECT id AS Kode, 
	   name AS Nama, 
       category AS Kategori, 
       price AS Harga, 
       quantity AS Jumlah 
FROM products;

##### ALIASES FOR TABLE #####
SELECT p.id AS Kode, 
	   p.name AS Nama, 
       p.category AS Kategori, 
       p.price AS Harga, 
       p.quantity AS Jumlah 
FROM products AS p;

##### WHERE OPERATOR #####
INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
	   ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Kripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);
       
SELECT * FROM products WHERE quantity > 30;

SELECT * FROM products WHERE quantity >= 30;

SELECT * FROM products WHERE category != 'Makanan';

SELECT * FROM products WHERE category <> 'Minuman';
	
##### AND | OR OPERATOR #####
SELECT * FROM products WHERE quantity > 30 AND price > 20000;

SELECT * FROM products WHERE category = 'Makanan' AND price < 20000;

SELECT * FROM products WHERE quantity > 30 OR price > 20000;

##### PRIORITY WITH () #####	
SELECT * FROM products WHERE (category = 'Makanan' OR quantity > 500) AND price > 20000;

##### LIKE OPERATOR #####
SELECT * FROM products WHERE name LIKE '%mie%';

SELECT * FROM products WHERE name LIKE '%bakso%';

SELECT * FROM products WHERE name LIKE '%usu%';

SELECT * FROM products WHERE name LIKE 'mie%';

SELECT * FROM products WHERE name LIKE '%spesial';

##### NULL OPERATOR #####
SELECT * FROM products WHERE description IS NULL;

SELECT * FROM products WHERE description IS NOT NULL;

##### BETWEEN OPERATOR #####
SELECT * FROM products WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM products WHERE price NOT BETWEEN 10000 AND 20000;

##### IN OPERATOR #####
SELECT * FROM products WHERE category IN ('Makanan', 'Minuman');

SELECT * FROM products WHERE category NOT IN ('Makanan', 'Minuman');

## Before Use insert
SELECT * FROM products WHERE category = 'Makanan' OR category = 'Minuman';

##### ORDER BY CLAUSE #####
SELECT id, category, name FROM products ORDER BY category;

SELECT id, category, price, name FROM products ORDER BY category ASC, price DESC;

##### LIMIT CLAUSE #####
SELECT * FROM products ORDER BY id LIMIT 5;

SELECT * FROM products ORDER BY id LIMIT 0, 5; ## 0(Skip/Offset data), 5(Limit data)

SELECT * FROM products ORDER BY id LIMIT 5, 5; ## 5(Skip/Offset data), 5(Limit data) 

SELECT * FROM products ORDER BY id LIMIT 10, 5; ## 10(Skip/Offset data), 5(Limit data)

##### SELECT DISTINCT DATA #####
SELECT DISTINCT category FROM products;

SELECT DISTINCT category, id FROM products; ## it doesn't matter, because id not selected column distinct

##### NUMERIC FUNCTION #####
SELECT 10, 10, 10 * 10 AS Hasil;

SELECT id, name, price DIV 1000 AS 'Price in K' FROM products;

##### MATHEMATICAL FUNCTION #####
SELECT id, COS(price), TAN(price), SIN(price) FROM products;

SELECT id, name, price FROM products
WHERE price DIV 1000 > 15;

##### AUTO INCREMENT #####
CREATE TABLE admin(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
)ENGINE = InnoDB;

DESC admin;

INSERT INTO admin(first_name, last_name)
VALUES ('Ibad', 'Nurhamim'),
	   ('Ibad', 'Aja'),
       ('Ibad', 'Lagi'),
       ('Ibad', 'Terus');
       
SELECT * FROM admin ORDER BY id;

DELETE FROM admin WHERE id = 3;

INSERT INTO admin(first_name, last_name)
VALUES ('Bambang', 'Nugraha');

SELECT * FROM admin ORDER BY id;

SELECT LAST_INSERT_ID(); ## function for see last id

##### STRING FUNCTION #####
SELECT id, 
	LOWER(name) AS 'Name Lower',
    UPPER(name) AS 'Name Upper',
    LENGTH(name) AS 'Name Length'
FROM products;

##### DATE AND TIME FUNCTION #####
SELECT id, created_at,
		EXTRACT(YEAR FROM created_at) AS Year,
        EXTRACT(MONTH FROM created_at)AS Month
FROM products;

SELECT id, created_at, YEAR(created_at) AS Year, MONTH(created_at) AS Month FROM products;

##### FLOW CONTROL FUNCTION #####
SELECT id, 
	   category, 
	   CASE category
		  WHEN 'Makanan' THEN 'Enak'
          WHEN 'Minuman' THEN 'Segar'
          ELSE 'Apa Itu?'
	   END As 'Category'
FROM products; ## Control Flow Case

SELECT id,
	   price,
       IF (price <= 15000, 'Murah', 'Mahal') AS 'Worthed Kah?'
FROM products; ## Control Flow If

SELECT id,
	   price,
       IF (price <= 15000, 'Murah', IF(price <= 20000, 'Mahal gak pake Banget', 'Mahal Bangettt')) AS 'Worthed Kah?'
FROM products; ## Control Flow If Nested

SELECT id, name, IFNULL(description, 'Kosong') FROM products; ## Control Flow IFNULL

##### AGGREGATE FUNCTION #####
SELECT COUNT(id) AS 'Total Product' FROM products;

SELECT MAX(price) AS 'Product Termahal' FROM products;

SELECT MIN(price) AS 'Product Termurah' FROM products;

SELECT AVG(price) AS 'Rata-Rata Harga' FROM products;

SELECT SUM(quantity) AS 'Total Stock' FROM products;	

##### GROUPING #####
SELECT COUNT(id) AS 'Total Product', category FROM products GROUP BY category;

SELECT MAX(price) AS 'Product Termahal', category FROM products GROUP BY category;

SELECT MIN(price) AS 'Product Termurah', category FROM products GROUP BY category;

SELECT AVG(price) AS 'Rata-Rata Harga', category FROM products GROUP BY category;

SELECT SUM(quantity) AS 'Total Stock', category FROM products GROUP BY category;	

##### HAVING CLAUSE #####
SELECT COUNT(id) AS total, 
	   category 
FROM products 
GROUP BY category
HAVING total > 5;

##### CONSTRAINT #####
CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
PRIMARY KEY (id),
UNIQUE KEY email_unique (email) ## Unique Constraint
) ENGINE = InnoDB;

DESCRIBE customers;

-- ALTER TABLE customers
-- ADD CONSTRAINT email_unique UNIQUE(email); ## Add Constraint

INSERT INTO customers(email, first_name, last_name)
VALUES ('ibad@gmail.com', 'Ibad', 'Nurhamim');

SELECT * FROM customers;

    ## duplicate entry, email must be unique ##
## INSERT INTO customers(email, first_name, last_name)
## VALUES ('ibad@gmail.com', 'Ibad', 'Nurhamim');   

INSERT INTO customers(email, first_name, last_name)
VALUES ('ibadaja@gmail.com', 'Ibad', 'Aja');

SELECT * FROM customers;