-- Homework 2 - CS342
-- Ethan Clark

-- 1. Exercise 5.14

	-- Drop current database
	DROP TABLE Customer;
	DROP TABLE Order;
	DROP TABLE Order_Item;
	DROP TABLE Item;
	DROP TABLE Shipment;
	DROP TABLE Warehouse;

	-- Create database schema
	CREATE TABLE Customer (
		ID integer,
		name varchar(30),
		city varchar(30),
		PRIMARY KEY (ID)
		);

	CREATE TABLE Order (
		ID integer,
		orderDate date,
		customerID integer,
		orderAmount float,
		PRIMARY KEY (ID),
		FOREIGN KEY (customerID) REFERENCES Customer(ID) ON DELETE SET NULL
		);

	CREATE TABLE Order_Item (
		orderID integer,
		itemNumber integer,
		quantity integer,
		FOREIGN KEY (orderID) REFERENCES Order(ID) ON DELETE CASCADE,
		FOREIGN KEY (itemNumber) REFERENCES Item(number) ON DELETE CASCADE
		);

	CREATE TABLE Item (
		number integer,
		name varchar(30),
		unitPrice float,
		PRIMARY KEY (number)
		);

	CREATE TABLE Shipment (
		orderID integer,
		warehouseID integer,
		shipDate date,
		FOREIGN KEY (orderID) REFERENCES Order(ID) ON DELETE SET NULL,
		FOREIGN KEY (warehouseID) REFERENCES Warehouse(ID) ON DELETE SET NULL
		);

	CREATE TABLE Warehouse (
		ID integer,
		city varhchar(30),
		PRIMARY KEY (ID)
		);

	-- Insert sample data
	INSERT INTO Customer VALUES (1, "Ethan's Company", "Caledonia");
	INSERT INTO Customer VALUES (2, "Dylan's Auto Shop", "Grand Rapids");
	INSERT INTO Customer VALUES (3, "Nate's Steel", "Chicago");
	INSERT INTO Customer VALUES (4, "Todd's Nuts and Bolts", "San Diego");

	INSERT INTO Order VALUES (1, '11-Nov-2010', 1, 99.99);
	INSERT INTO Order VALUES (2, '25-Jan-2012', 1, 179.00);
	INSERT INTO Order VALUES (3, '14-Jul-2010', 2, 1199.65);
	INSERT INTO Order VALUES (4, '02-Mar-2009', 4, 35.99);
	INSERT INTO Order VALUES (5, '30-Dec-2015', 3, 101.10);

	INSERT INTO Order_Item VALUES (1, 1, 10);
	INSERT INTO Order_Item VALUES (2, 4, 15);
	INSERT INTO Order_Item VALUES (2, 3, 8);
	INSERT INTO Order_Item VALUES (3, 2, 30);
	INSERT INTO Order_Item VALUES (4, 1, 9);

	INSERT INTO Item VALUES (1, 'Steel', 12.99);
	INSERT INTO Item VALUES (2, 'Copper', 45.00);
	INSERT INTO Item VALUES (3, 'Leather', 10.99);
	INSERT INTO Item VALUES (4, 'Iron', 32.95);

	INSERT INTO Shipment VALUES (1, 4, '20-Nov-2010');
	INSERT INTO Shipment VALUES (2, 2, '30-Jan-2012');
	INSERT INTO Shipment VALUES (3, 3, '27-Jul-2010');
	INSERT INTO Shipment VALUES (4, 1, '10-Mar-2009');
	INSERT INTO Shipment VALUES (3, 4, '05-Jan-2016');

	INSERT INTO Warehouse VALUES (1, "Ada");
	INSERT INTO Warehouse VALUES (2, "Traverse City");
	INSERT INTO Warehouse VALUES (3, "Green Bay");
	INSERT INTO Warehouse VALUES (4, "Miami");

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
	FROM Order, Customer
	WHERE Order.customerID = Customer.ID
	AND Customer.name = "Ethan's Company"
	ORDER BY Order.orderDate ASC;
	
	-- b. All the customer ID numbers for customers who have made at least one order in the database
	SELECT ID FROM Customer, Order
	WHERE Order.customerID IS NOT NULL AND Order.customerID = Customer.ID;
	
	-- c. The customer IDs and names of the people who have ordered an item with a particular name (one that exists in your database)
	SELECT ID, name FROM Customer, Order, Order_Item, Item
	WHERE Customer.ID = Order.customerID
	AND Order.ID = Order_Item.orderID
	AND Order_Item.itemNumber = Item.number
	AND Item.name = "Steel";