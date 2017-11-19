DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

CREATE TABLE products(
id int NOT NULL AUTO_INCREMENT,
name CHAR(20),
price INT,
PRIMARY KEY (id)
);

SHOW TABLES;
INSERT INTO products (name, price) VALUES
("milk", 5),
("juice", 4),
("butter", 12);

SELECT * FROM products;