-- Exercise 9.11 — Generate the model by hand for this exercise. No automatic schema generation is required.
--		Store your implementation in homework03_3.sql.

-- Ethan Clark - CS 342
-- February 22, 2017

-- drop current database tables
DROP TABLE Part_Orders;
DROP TABLE Handles;
DROP TABLE Orders;
DROP TABLE Part;
DROP TABLE Customer;
DROP TABLE Employee;

-- Create database tables
CREATE TABLE Employee (
	empNumber integer PRIMARY KEY,
	zipCode integer,
	firstName varchar(20),
	lastName varchar(20)
);

CREATE TABLE Customer (
	custNumber integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	zipCode integer
);

CREATE TABLE Part (
	partNumber integer PRIMARY KEY,
	name varchar(30),
	price float,
	stockQty integer
);

CREATE TABLE Orders (
	orderNumber integer PRIMARY KEY,
	datePlaced date,
	expectedShipDate date,
	actualShipDate date
);

CREATE TABLE Handles (
	empNumber integer,
	custNumber integer,
	orderNumber integer,
	FOREIGN KEY (empNumber) REFERENCES Employee(empNumber),
	FOREIGN KEY (custNumber) REFERENCES Customer(custNumber),
	FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber),
	PRIMARY KEY (empNumber, custNumber, orderNumber)
);

CREATE TABLE Part_Orders (
	partNumber integer,
	orderNumber integer,
	quantity integer,
	FOREIGN KEY (partNumber) REFERENCES Part(partNumber),
	FOREIGN KEY (orderNumber) REFERENCES Order(orderNumber),
	PRIMARY KEY (partNumber, orderNumber)
);