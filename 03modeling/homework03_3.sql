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

-- If an employee gets removed from the database, the customer would still want the order
--		to be handled, so the empNumber should be set to NULL until a new employee fills
--		the role.
-- If a customer gets removed from the database, that particular order does not need to be
--		filled any longer because it has no where to go, so the record in this table should be deleted.
-- If an order gets removed from the database, there is no order to handle anymore, so the
--		record in this table should get deleted as well.
CREATE TABLE Handles (
	empNumber integer,
	custNumber integer,
	orderNumber integer,
	FOREIGN KEY (empNumber) REFERENCES Employee(empNumber) ON DELETE SET NULL,
	FOREIGN KEY (custNumber) REFERENCES Customer(custNumber) ON DELETE CASCADE,
	FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber) ON DELETE CASCADE,
	PRIMARY KEY (empNumber, custNumber, orderNumber)
	);

-- If a part number gets removed from the database, the record of that part being on
--		a particular order should get deleted as well because it can no longer be a part
--		of that order.
-- If an order is deleted from the database, there is no longer any need for parts for that
--		order, so the record in Part_Orders should be deleted as well.
CREATE TABLE Part_Orders (
	partNumber integer,
	orderNumber integer,
	quantity integer,
	FOREIGN KEY (partNumber) REFERENCES Part(partNumber) ON DELETE CASCADE,
	FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber) ON DELETE CASCADE,
	PRIMARY KEY (partNumber, orderNumber)
	);
	
-- Insert data
INSERT INTO Employee VALUES (1, 49316, 'Ethan', 'Clark');
INSERT INTO Employee VALUES (2, 49316, 'Mark', 'Davis');
INSERT INTO Employee VALUES (3, 50000, 'Mitch', 'Stark');

INSERT INTO Customer VALUES (1, 'Russ', 'Clousing', 30000);
INSERT INTO Customer VALUES (2, 'Matt', 'Kotva', 30550);
INSERT INTO Customer VALUES (3, 'Kyle', 'Reitsma', 49316);

INSERT INTO Part VALUES (1, 'Steel', 55.99, 1000);
INSERT INTO Part VALUES (2, 'Iron', 20.95, 980);
INSERT INTO Part VALUES (3, 'Bolts', 4.99, 24500);

INSERT INTO Orders VALUES (1, '16-Feb-2016', '18-Feb-2016', '19-Feb-2016');
INSERT INTO Orders VALUES (2, '10-Feb-2016', '12-Feb-2016', '12-Feb-2016');
INSERT INTO Orders VALUES (3, '01-Jun-2015', '03-June-2015', '10-June-2015');
INSERT INTO Orders VALUES (4, '30-Jan-2015', '02-Feb-2015', '04-Feb-2015');

INSERT INTO Handles VALUES (1, 3, 1);
INSERT INTO Handles VALUES (1, 2, 2);
INSERT INTO Handles VALUES (3, 1, 4);
INSERT INTO Handles VALUES (2, 1, 3);

INSERT INTO Part_Orders VALUES (1, 1, 100);
INSERT INTO Part_Orders VALUES (2, 1, 15);
INSERT INTO Part_Orders VALUES (1, 3, 45);
INSERT INTO Part_Orders VALUES (3, 2, 4500);
INSERT INTO Part_Orders VALUES (3, 4, 3290);

-- Sample queries
SELECT * FROM Employee;

SELECT Employee.lastName, Orders.orderNumber FROM Orders, Handles, Employee
WHERE Employee.empNumber = Handles.empNumber AND Handles.orderNumber = Orders.orderNumber
AND Employee.firstName = 'Ethan' ORDER BY Orders.orderNumber DESC;

SELECT * FROM Orders, Customer, Handles WHERE Customer.custNumber = Handles.custNumber
AND Handles.orderNumber = Orders.orderNumber AND Customer.custNumber = 1;