-- Lab Exercise 2.3

-- This command file loads a simple movies database, dropping any existing tables
-- with the same names, rebuilding the schema and loading the data fresh.
--
-- CS 342, Spring, 2015
-- kvlinden
-- Edited by Ethan Clark - CS342 Spring 2017

-- Drop current database
DROP TABLE Casting;
DROP TABLE Movie;
DROP TABLE Status;
DROP TABLE Performer;

-- Create database schema
CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	votes integer,
	PRIMARY KEY (id),
	CHECK (year > 1900)
	);

CREATE TABLE Performer (
	id integer,
	name varchar(35),
	PRIMARY KEY (id)
	);

CREATE TABLE Status (
	name varchar(6),
	PRIMARY KEY (name)
);
	
CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	status varchar(6),
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	FOREIGN KEY (status) REFERENCES Status(name) ON DELETE SET NULL
	);

-- Load sample data using NEXTVAL from the sequence for primary ID key
INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9, 2000);
INSERT INTO Movie VALUES (2,'Blade Runner',1982,8.6, 1500);

INSERT INTO Performer VALUES (1,'Harrison Ford');
INSERT INTO Performer VALUES (2,'Rutger Hauer');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca');
INSERT INTO Performer VALUES (4,'Rachael');

INSERT INTO Status VALUES ('star');
INSERT INTO Status VALUES ('extra');
INSERT INTO Status VALUES ('costar');

INSERT INTO Casting VALUES (1,1,'star');
INSERT INTO Casting VALUES (1,3,'extra');
INSERT INTO Casting VALUES (2,1,'star');
INSERT INTO Casting VALUES (2,2,'costar');
INSERT INTO Casting VALUES (2,4,'costar');


-- In order to support an enumerated status type in Oracle SQL, I needed to create a new relation and use
--		INSERTS to add the three potential casting statuses in as primary keys and updated the Casting status
--		attribute to be a foreign key that points to Status(name). This allowed me to remove the check in the
--		Casting table, but this also allows other statuses to be potentially entered in the Status table and
--		used as a valid Casting status. I personally think that a CHECK constraint would be best in this situation
--		but it is possible to do it this way to not have to do the CHECK.