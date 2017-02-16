-- Lab Exercise 2.4

-- This command file loads a simple movies database, dropping any existing tables
-- with the same names, rebuilding the schema and loading the data fresh.
--
-- CS 342, Spring, 2015
-- kvlinden
-- Edited by Ethan Clark - CS342 Spring 2017

-- Drop current database
DROP TABLE Casting;
DROP TABLE Movie;
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

CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	status varchar(6),
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	CHECK (status in ('star', 'costar', 'extra'))
	);

-- Create sequence for Movie primary key
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1;

-- Load sample data using NEXTVAL from the sequence for primary ID key
INSERT INTO Movie VALUES (movie_seq.NEXTVAL,'Star Wars',1977,8.9, 2000);
INSERT INTO Movie VALUES (movie_seq.NEXTVAL,'Blade Runner',1982,8.6, 1500);

INSERT INTO Performer VALUES (1,'Harrison Ford');
INSERT INTO Performer VALUES (2,'Rutger Hauer');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca');
INSERT INTO Performer VALUES (4,'Rachael');

INSERT INTO Casting VALUES (1,1,'star');
INSERT INTO Casting VALUES (1,3,'extra');
INSERT INTO Casting VALUES (2,1,'star');
INSERT INTO Casting VALUES (2,2,'costar');
INSERT INTO Casting VALUES (2,4,'costar');

-- Questions
-- a.
	-- While it may be nice and convenient for the primary keys of both the movie and performer relations to start at 1,
	--		it is not necessary to create a new sequence for the perfomer relation. We can use the same sequence for both
	--		relations because it does not matter what the primary keys are for each one, as long as they are unique within
	--		their respective relations, i.e. there cannot be two movies with ID 2 nor can there can two performers with ID 6.
	--		Having the same sequence for both will not allow a repeated primary key within the relations and, for no additional
	--		advantage, there will be no repeated ID number between the movie relation and the performer relation.

-- b.
	-- 