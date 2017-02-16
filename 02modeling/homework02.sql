-- Homework 2 - CS342
-- Ethan Clark

-- 1. Exercise 5.14

-- Drop current database
DROP TABLE Shipment;
DROP TABLE Warehouse;
DROP TABLE Order_Item;
DROP TABLE Orders;
DROP TABLE Item;
DROP TABLE Customer;

-- Create database schema
CREATE TABLE Customer (
	ID integer,
	name varchar(30),
	city varchar(30),
	PRIMARY KEY (ID)
	);

-- I set customerID to ON DELETE SET NULL because even if a customer gets deleted from
--		the database, the order should still exist for financial purposes probably. They
--		would want to see how much that order cost.
CREATE TABLE Orders (
	ID integer,
	orderDate date,
	customerID integer,
	orderAmount float,
	PRIMARY KEY (ID),
	FOREIGN KEY (customerID) REFERENCES Customer(ID) ON DELETE SET NULL
	);

-- Better check that the unitPrice for any given item is more than 0.
CREATE TABLE Item (
	ID integer,
	name varchar(30),
	unitPrice float,
	PRIMARY KEY (ID),
	CHECK (unitPrice > 0)
	);	
	
-- I set orderID to ON DELETE CASCADE because if an order is deleted, there
--		is no need to have an item associated with that specific order. The item won't
--		be deleted from the Item table, just the Order_Item table.
-- I set the itemNumber to ON DELETE CASCADE because if an item is deleted from the database,
--		it cannot be sold as part of an order, so it should be removed from the Order_Item
--		table.
-- Better check that the quantity order is more than 0.
CREATE TABLE Order_Item (
	orderID integer,
	itemNumber integer,
	quantity integer,
	FOREIGN KEY (orderID) REFERENCES Orders(ID) ON DELETE CASCADE,
	FOREIGN KEY (itemNumber) REFERENCES Item(ID) ON DELETE CASCADE,
	CHECK (quantity > 0)
	);

CREATE TABLE Warehouse (
	ID integer,
	city varchar(30),
	PRIMARY KEY (ID)
	);
	
-- I set the orderID to ON DELETE CASCADE because if an order is removed from the database,
--		there is nothing to be shipped out, so the record in the Shipment table can be
--		deleted.
-- I set the warehouseID to ON DELETE SET NULL because even if a warehouse is removed fom the
--		database, I feel like the company would want to know that there is no longer a valid
--		location to send the particular shipment. They would not just want the order/shipment
--		to be forgotten about.
CREATE TABLE Shipment (
	orderID integer,
	warehouseID integer,
	shipDate date,
	FOREIGN KEY (orderID) REFERENCES Orders(ID) ON DELETE CASCADE,
	FOREIGN KEY (warehouseID) REFERENCES Warehouse(ID) ON DELETE CASCADE
	);

-- Insert sample data
INSERT INTO Customer VALUES (1, 'Ethans Company', 'Caledonia');
INSERT INTO Customer VALUES (2, 'Dylans Auto Shop', 'Grand Rapids');
INSERT INTO Customer VALUES (3, 'Nates Steel', 'Chicago');
INSERT INTO Customer VALUES (4, 'Todds Nuts and Bolts', 'San Diego');
INSERT INTO Customer VALUES (5, 'Marks Leather', 'Toronto');

INSERT INTO Orders VALUES (1, '25-Jan-2012', 1, 99.99);
INSERT INTO Orders VALUES (2, '11-Nov-2010', 1, 179.00);
INSERT INTO Orders VALUES (3, '14-Jul-2010', 2, 1199.65);
INSERT INTO Orders VALUES (4, '02-Mar-2009', 4, 35.99);
INSERT INTO Orders VALUES (5, '30-Dec-2015', 3, 101.10);
INSERT INTO Orders VALUES (6, '01-Jan-2000', 1, 90.95);

INSERT INTO Item VALUES (1, 'Steel', 12.99);
INSERT INTO Item VALUES (2, 'Copper', 45.00);
INSERT INTO Item VALUES (3, 'Leather', 10.99);
INSERT INTO Item VALUES (4, 'Iron', 32.95);

INSERT INTO Order_Item VALUES (1, 1, 10);
INSERT INTO Order_Item VALUES (2, 4, 15);
INSERT INTO Order_Item VALUES (2, 3, 8);
INSERT INTO Order_Item VALUES (3, 2, 30);
INSERT INTO Order_Item VALUES (4, 1, 9);

INSERT INTO Warehouse VALUES (1, 'Ada');
INSERT INTO Warehouse VALUES (2, 'Traverse City');
INSERT INTO Warehouse VALUES (3, 'Green Bay');
INSERT INTO Warehouse VALUES (4, 'Miami');

INSERT INTO Shipment VALUES (1, 4, '20-Nov-2010');
INSERT INTO Shipment VALUES (2, 2, '30-Jan-2012');
INSERT INTO Shipment VALUES (3, 3, '27-Jul-2010');
INSERT INTO Shipment VALUES (4, 1, '10-Mar-2009');
INSERT INTO Shipment VALUES (3, 4, '05-Jan-2016');

-- 2. Exercise 5.20 a. and c.

	-- I would argue for CIT to keep surrogate keys for ID numbers for students. Dispite the fact that surrogate keys are numeric
	--		and are sometimes hard to read/interpret for people, I think they make managing databases simpler. Surrogate keys have
	--		no business meaning, i.e. they are not tied into any information from the students. It is more common to need to change
	--		business (or college in this case) information than to need to restructure surrogate primary keys, which if they used a 
	--		natural key, that could get messed up by changing business requirements. Also, a simple surrogate primary key will often
	-- 		reduce the amount of source code needed to create a primary key, so that means more concise, clear code and it reduces
	--		the total cost of ownership.


-- 3. Write the SQL commands to retrieve the following from the customer-order database you built above.

-- a. All the order dates and amounts for orders made by a customer with a particular name (one that exists in your database), ordered chronologically by date
SELECT orderDate, orderAmount
FROM Orders, Customer
WHERE Orders.customerID = Customer.ID
AND Customer.name = 'Ethans Company'
ORDER BY Orders.orderDate ASC;
	
-- b. All the customer ID numbers for customers who have made at least one order in the database
SELECT DISTINCT Customer.ID FROM Customer, Orders
WHERE Orders.customerID IS NOT NULL AND Orders.customerID = Customer.ID;
	
-- c. The customer IDs and names of the people who have ordered an item with a particular name (one that exists in your database)
SELECT Customer.ID, Customer.name FROM Customer, Orders, Order_Item, Item
WHERE Customer.ID = Orders.customerID
AND Orders.ID = Order_Item.orderID
AND Order_Item.itemNumber = Item.ID
AND Item.name = 'Steel';