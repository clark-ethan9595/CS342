-- Starter code for lab 3.
--
-- CS 342, Spring, 2017
-- kvlinden
--
-- Extended by: Ethan Clark
-- Lab3 - Exercises 3.1 and 3.2
-- Homework3 - Lab Exercise 3.3

-- drop current database
DROP TABLE Mentorship;
DROP TABLE Person_Team;
DROP TABLE Team;
DROP TABLE Person;
DROP TABLE Homegroup;
DROP TABLE HouseHold;

-- create database tables
CREATE TABLE HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);
	
CREATE TABLE Homegroup (
	ID integer PRIMARY KEY,
	meetLocation varchar(30)
	);

-- If a household is removed, we still want the person to be in the database, so we
--		set the householdID to be null.
-- If a homegroup is removed, we still want the person to be in the database, so we
--		set the homegroupID to be null.
CREATE TABLE Person (
	ID integer PRIMARY KEY,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	householdID integer,
	role varchar(20),
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	homegroupID integer,
	FOREIGN KEY (householdID) REFERENCES HouseHold(ID) ON DELETE SET NULL,
	FOREIGN KEY (homegroupID) REFERENCES Homegroup(ID) ON DELETE SET NULL
	);
	
-- I think that setting the menteeID to be the primary key would not allow a person to
--		have more than one mentor. This schema would allow for a person to be a mentor
--		to more than one person.
-- If a person is removed from the database, we would want to remove the records of them
--		in this table as well.
CREATE TABLE Mentorship (
	mentorID integer,
	menteeID integer PRIMARY KEY,
	FOREIGN KEY (mentorID) REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY (menteeID) REFERENCES Person(ID) ON DELETE CASCADE
	);
	
CREATE TABLE Team (
	ID integer PRIMARY KEY,
	name varchar(30)
	);
	
-- If a Person record is removed, we would want to remove the records of them being on
--		any particular team.
-- If a Team record is removed, we want to remove the records that signify which people
--		were on that team.
CREATE TABLE Person_Team (
	personID integer,
	teamID integer,
	role varchar(15),
	startDate date,
	endDate date,
	FOREIGN KEY (personID) REFERENCES Person(ID) ON DELETE CASCADE,
	FOREIGN KEY (teamID) REFERENCES Team(ID) ON DELETE CASCADE,
	CONSTRAINT PK_D PRIMARY KEY (personID, teamID)
	);

-- Insert sample data
INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');
INSERT INTO Household VALUES (1,'2632 Colton Dr. SE','Grand Rapids','MI','49506','616-888-8888');

INSERT INTO Homegroup VALUES (0, 'coffee shop');

INSERT INTO Person VALUES (0,'mr.','Keith','VanderLinden', 0, 'husband', 'm', 0);
INSERT INTO Person VALUES (1,'ms.','Brenda','VanderLinden', 0, 'wife', 'm', 0);
INSERT INTO Person VALUES (2,'mr.','Ethan','Clark', 1, 'son', 'm', NULL);

INSERT INTO Mentorship VALUES (0, 1);
INSERT INTO Mentorship VALUES (0, 2);

INSERT INTO Team VALUES (0, 'Elders');
INSERT INTO Team VALUES (1, 'Music');

INSERT INTO Person_Team VALUES (2, 0, 'Outreach', '01-Feb-2017', '01-Oct-2017');
INSERT INTO Person_Team VALUES (0, 1, 'Leader', '19-Jan-2017', '19-Jul-2017');

-- Sample queries
SELECT * FROM Homegroup;

SELECT Person.ID FROM Person, Homegroup WHERE Person.homegroupID = Homegroup.ID;

SELECT Person.firstName, Team.name FROM Person, Team, Person_Team
WHERE Person.ID = Person_Team.personID AND Team.ID = Person_Team.teamID;

SELECT Person.firstName, Person_Team.endDate FROM Person, Person_Team
WHERE Person.ID = Person_Team.personID ORDER BY Person_Team.endDate ASC;