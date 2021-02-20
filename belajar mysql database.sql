
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

##### CHECK CONSTRAINT #####
INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-Lain', 500, 1000);

SELECT * FROM products;

UPDATE products
SET price = 1000
WHERE id = 'P0016';

ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);

SHOW CREATE TABLE products;

	## rejected, because the price is less than 1000 ##
-- INSERT INTO products(id, name, category, price, quantity)
-- VALUES ('P0017', 'Permen Lagi', 'Lain-Lain', 500, 1000); 


##### INDEX #####
CREATE TABLE sellers(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
name2 VARCHAR(100),
name3 VARCHAR(100),
email VARCHAR(100) NOT NULL,
PRIMARY KEY(id),
UNIQUE KEY email_unique(email),
INDEX name_index(name),
INDEX name2_index(name2),
INDEX name3_index(name3),
INDEX name_name_2_name3_index(name, name2, name3) ## combine 3 column
)ENGINE = InnoDB;

DESC sellers;

SHOW CREATE TABLE sellers;

	## Example ## 
# SELECT * FROM selerrs WHERE name = 'X';

# SELECT * FROM selerrs WHERE name = 'X' AND name2 = 'X';

# SELECT * FROM selerrs WHERE name = 'X' AND name2 = 'X' AND name3 = 'X';

ALTER TABLE sellers
DROP INDEX name_index;

##### FULL-TEXT SEARCH #####
# because the product table already exists, then we just need to add it.
ALTER TABLE products
ADD FULLTEXT product_fulltext(name, description); 

# Delete FullText Search;
-- ALTER TABLE products
-- DROP INDEX product_fulltext;

SHOW CREATE TABLE products;

SELECT * FROM products WHERE name LIKE '%ayam%' OR description LIKE '%ayam%';

# Search with natural language mode
SELECT * FROM products 
WHERE MATCH(name, description)
AGAINST('ayam' IN NATURAL LANGUAGE MODE);

# Search with boolean mode
SELECT * FROM products 
WHERE MATCH(name, description)
AGAINST('+ayam -bakso' IN BOOLEAN MODE); # -> note : +ayam = contain 'ayam', -bakso = not contain 'bakso'.

# Search with query expansion mode
SELECT * FROM products 
WHERE MATCH(name, description)
AGAINST('bakso' WITH QUERY EXPANSION);

##### TABLE RELATIONSHIP #####
##### FOREIGN KEY #####
CREATE TABLE wishlist(
	id INT NOT NULL AUTO_INCREMENT,
	id_product VARCHAR(10) NOT NULL,
	description TEXT,
	PRIMARY KEY(id),
	CONSTRAINT fk_wishlist_product
	FOREIGN KEY(id_product) REFERENCES products(id)
)ENGINE = InnoDB;

DESC wishlist;

SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY(id_product) REFERENCES products(id)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist(id_product, description) 
VALUES ('P0001', 'Makanan Kesukaan');

SELECT * FROM wishlist;

SELECT * FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES
('Pxyz', 'Contoh', 'Lain-Lain', 1000, 1000);

INSERT INTO wishlist(id_product, description) 
VALUES ('Pxyz', 'Makanan Kesukaan');

DELETE FROM products WHERE id = 'Pxyz';

##### JOIN #####
SELECT * FROM wishlist JOIN products ON (wishlist.id_product = products.id);

# Selection Column
SELECT wishlist.id, products.id, products.name, wishlist.description 
FROM wishlist JOIN products ON (wishlist.id_product = products.id);

# Aliases
SELECT w.id   		 AS id_wishlist, 
	   p.id   		 AS id_product, 
       p.name 		 AS product_name, 
       w.description AS wishlist_description
FROM wishlist AS w JOIN products AS p ON (w.id_product = p.id);

# Relation to customers table
DESC customers;

ALTER TABLE wishlist
ADD COLUMN id_customer INT;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customers(id);

SELECT * FROM customers;

UPDATE wishlist
SET id_customer = 1
WHERE id = 1;

SELECT * FROM wishlist;

SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_customer);

##### ONE TO ONE RELATIONSHIP #####
CREATE TABLE wallet(
id INT NOT NULL AUTO_INCREMENT,
id_customer INT NOT NULL,
balance INT NOT NULL DEFAULT 0,
PRIMARY KEY (id),
UNIQUE KEY id_customer_unique (id_customer),
FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customers(id)
) ENGINE = InnoDB;

DESC wallet;

INSERT INTO wallet(id_customer) values (1), (3);

SELECT * FROM wallet;

SELECT customers.email, wallet.balance 
FROM wallet JOIN customers ON (wallet.id_customer = customers.id);

##### ONE TO MANY RELATIONSHIP #####
CREATE TABLE categories(
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB;

DESC categories;

SELECT * FROM categories;

SELECT * FROM products;

ALTER TABLE products
DROP COLUMN category;

DESC products; 

ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (id_category) REFERENCES categories(id);

SHOW CREATE TABLE products;

INSERT INTO categories(id, name) 
VALUES('C0001', 'Makanan'),
	  ('C0002', 'Minuman'),
      ('C0003', 'Lain-Lain');

UPDATE products
SET id_category = 'C0001'
WHERE id IN ('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006', 'P0013', 'P0014', 'P0015');

UPDATE products
SET id_category = 'C0002'
WHERE id IN ('P0007', 'P0008', 'P0009');

UPDATE products
SET id_category = 'C0003'
WHERE id IN ('P0010', 'P0011', 'P0012', 'P0016');

SELECT products.id, products.name, categories.name
FROM products
JOIN categories ON (categories.id = products.id_category);

##### MANY TO MANY RELATIONSHIP #####
CREATE TABLE orders(
id INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id)
)ENGINE = InnoDB;

DESCRIBE orders;

CREATE TABLE orders_detail(
id_product VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY(id_product, id_order)
)ENGINE = InnoDB; 

DESCRIBE orders_detail;

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_product
FOREIGN KEY(id_product) REFERENCES products(id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_orders
FOREIGN KEY(id_order) REFERENCES orders(id);

SHOW CREATE TABLE orders_detail;

SELECT * FROM orders;

INSERT INTO orders(total) VALUES (50000);

INSERT INTO orders_detail(id_product, id_order, price, quantity) 
VALUES ('P0001', 1, 25000, 1),
	   ('P0002', 1, 25000, 1);

INSERT INTO orders_detail(id_product, id_order, price, quantity) 
VALUES ('P0003', 2, 25000, 1),
	   ('P0004', 2, 25000, 1);
       
INSERT INTO orders_detail(id_product, id_order, price, quantity) 
VALUES ('P0002', 3, 25000, 1),
	   ('P0004', 3, 25000, 1);
       
SELECT * FROM orders_detail;

SELECT orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (orders_detail.id_product = products.id);

##### DIFFERENT TYPES OF SQL JOINs #####
SELECT * FROM products;

INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
	   ('X0002', 'X Dua', 10000, 300),
       ('X0003', 'X Tiga', 15000, 500);

SELECT * FROM categories;

INSERT INTO categories(id, name)
VALUES ('C0004', 'Oleh-Oleh'),
	   ('C0005', 'Gadget');
       
# INNER JOIN
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);       
       
# LEFT JOIN       
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);        
       
# RIGHT JOIN        
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);       
       
# CROSS JOIN        
SELECT * FROM categories       
CROSS JOIN products;
       
CREATE TABLE numbers(
id INT NOT NULL,
PRIMARY KEY(id)
)ENGINE = InnoDB;

INSERT INTO numbers(id) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

SELECT numbers1.id, numbers2.id, (numbers1.id * numbers2.id) FROM numbers AS numbers1 
CROSS JOIN numbers AS numbers2 ORDER BY numbers1.id, numbers2.id;

##### SUBQUERY #####

# Subquery in WHERE
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

# Subquery in FROM
SELECT MAX(price) FROM products;

SELECT MAX(cp.price) FROM (SELECT price FROM categories
JOIN products ON (products.id_category = categories.id)) AS cp;

UPDATE products
SET price = 1000000
WHERE id = 'X0003';

##### SET OPERATOR #####
CREATE TABLE guestbooks(
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100),
title VARCHAR(200),
content TEXT,
PRIMARY KEY(id)
)ENGINE = InnoDB;

SELECT * FROM customers;

INSERT INTO guestbooks(email, title, content)
VALUES ('guest@gmail.com', 'Hello', 'Hello'),
	   ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('ibad@gmail.com', 'Hello', 'Hello'),
       ('ibad@gmail.com', 'Hello', 'Hello'),
       ('ibad@gmail.com', 'Hello', 'Hello');
       
SELECT * FROM guestbooks;
    
## UNION
SELECT DISTINCT email FROM customers
UNION
SELECT DISTINCT email FROM guestbooks;

## UNION ALL
SELECT DISTINCT email FROM customers
UNION ALL
SELECT DISTINCT email FROM guestbooks;

# Without DISTINCT
SELECT email FROM customers
UNION
SELECT email FROM guestbooks;

SELECT email FROM customers
UNION ALL
SELECT email FROM guestbooks;

# With Subquery
SELECT emails.email, COUNT(emails.email) FROM (
SELECT email FROM customers
UNION ALL
SELECT email FROM guestbooks
) AS emails
GROUP BY emails.email;

##### INTERSECT #####
## mysql doesn't have an intersect operator, we have to do it manually using JOIN or SUBQUERY

# With Subquery
SELECT DISTINCT email FROM customers
WHERE email IN(SELECT DISTINCT email FROM guestbooks);

# With Join
SELECT DISTINCT customers.email FROM customers
INNER JOIN guestbooks ON (guestbooks.email = customers.email);

##### MINUS #####
## an operation where the first query will be omitted by the second query
## in mysql there is no MINUS operation, but we can use it with JOIN
SELECT DISTINCT customers.email, guestbooks.email FROM customers
LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;

##### DATABASE TRANSACTION #####
## DDL command cannot be executed on DATABASE TRANSACTION
START TRANSACTION;
INSERT INTO guestbooks(email, title, content) 
VALUES ('contoh@gmail.com', 'Contoh', 'Contoh'),
	   ('contoh2@gmail.com', 'Contoh', 'Contoh'),
       ('contoh3@gmail.com', 'Contoh', 'Contoh');
SELECT * FROM guestbooks;
COMMIT;

START TRANSACTION;
DELETE FROM guestbooks
WHERE id = 9;
SELECT * FROM guestbooks;
ROLLBACK;



## LOCKING RECORD

# USER 1
START TRANSACTION;## LOCKING RECORD

SELECT * FROM products;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;

# USER 2
# USER 2 will wait for USER 1 to COMMIT / ROLLBACK
START TRANSACTION;

SELECT * FROM products;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;

# Example Deadlock #
# USER 1
START TRANSACTION;
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

# USER 2
START TRANSACTION;
SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

## LOCKING TABLE
# READ -> USER 1 READ Only and USER 2 READ Only.
# WRITE -> USER 1 WRITE, READ and USER 2 can't READ, WRITE.  

# LOCK TABLE READ #
# USER 1
LOCK TABLES products READ;

# can't update because READ
UPDATE products
SET quantity = 100
WHERE id = 'P0001';

UNLOCK TABLES;

# USER 2
# cannot be executed, until user 1 UNLOCK TABLE
SELECT * FROM products;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

# LOCK TABLE WRITE #
# USER 1
LOCK TABLES products WRITE;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

SELECT * FROM products;

UNLOCK TABLES;

# USER 2
# cannot be executed, until user 1 UNLOCK TABLE
SELECT * FROM products;

## LOCKING INSTANCE
# LOCKING INSTANCE ->locking command which will create a DDL command. Usually used when backing up data, so that there is no change in the table structure
# USER 1
LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE;

# USER 2
# cannot be executed, until user 1 UNLOCK INSTANCE
ALTER TABLE products
ADD COLUMN sample VARCHAR(100);

##### USER MANAGEMENT #####
## CREATE/DELETE USER
CREATE USER 'ibad'@'localhost';# replace 'localhost' with the desired host, you can also use the IP address
CREATE USER 'nurhamim'@'%'; # can be accessed from anywhere

DROP USER 'ibad'@'localhost';
DROP USER 'nurhamim'@'%';

## ADD/DELETE USER PRIVILEGE
GRANT SELECT ON belajar_mysql.* TO 'ibad'@'localhost';
GRANT SELECT ON belajar_mysql.* TO 'nurhamim'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'nurhamim'@'%';

SHOW GRANTS FOR 'ibad'@'localhost';
SHOW GRANTS FOR 'nurhamim'@'%';

SET PASSWORD FOR 'ibad'@'localhost' = 'secret';
SET PASSWORD FOR 'nurhamim'@'%' = 'rahasia';

##### BACKUP DATABASE #####
# Note: remove the quotes #

# Command : mysqldump "Database name" --user "Username" --password --result-file= "Direktory/File Name" 
# Example : mysqldump belajar_mysql --user root --password --result-file=/home/ibad/Desktop/belajar_mysql.sql

##### RESTORE DATABASE #####
## IMPORT WITH MYSQL CLIENT
CREATE SCHEMA belajar_mysql_import;

SHOW DATABASES;
# Command : mysql --user="Username" --password "the name of the database that will import the file" < "the location of the database file that will be imported"
# Example : mysql --user=root --password belajar_mysql_import < /home/ibad/Desktop/belajar_mysql.sql

USE belajar_mysql_import;

SHOW TABLES;

SELECT * FROM customers;

## IMPORT WITH SQL SCRIPT
CREATE SCHEMA belajar_mysql_import_source;

SHOW DATABASES;

USE belajar_mysql_import_source;

SHOW TABLES; # before import

# Command : SOURCE "location of the database file that will be imported"
# Example : SOURCE /home/ibad/Desktop/belajar_mysql.sql;

SHOW TABLES; # after import

SELECT * FROM customers;