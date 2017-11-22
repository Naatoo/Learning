DROP DATABASE IF EXISTS buildings;
CREATE DATABASE buildings;
USE buildings;

CREATE TABLE house(
	number INT UNSIGNED,
	name char(30),
	surface FLOAT);

INSERT INTO house
VALUES  (1, 'apartment', 70),
	(2, 'of', 150),
	(3, 'df', 270),
	(4, 'block', 3000);

ALTER TABLE house 
	ADD PRIMARY KEY AUTO_INCREMENT(number),
	ADD CONSTRAINT uq_house UNIQUE(name);

CREATE TABLE street(
	number INT UNSIGNED,
	name char(20));

ALTER TABLE street
	ADD PRIMARY KEY AUTO_INCREMENT(number), 
	ADD CONSTRAINT uq_house UNIQUE(name),
	ADD FOREIGN KEY(number) REFERENCES buildings.house(number);
