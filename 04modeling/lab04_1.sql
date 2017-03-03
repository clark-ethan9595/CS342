-- This command file loads an experimental person relation.
-- The data conforms to the following assumptions:
--     * Person IDs and team names are unique for people and teams respectively.
--     * People can have at most one mentor.
--     * People can be on many teams, but only have one role per team.
--     * Teams meet at only one time.
--
-- CS 342
-- Spring, 2017
-- kvlinden

DROP TABLE AltPerson;

CREATE TABLE AltPerson (
	personId integer,
	name varchar(10),
	status char(1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
    teamName varchar(10),
    teamRole varchar(10),
    teamTime varchar(10)
	);

INSERT INTO AltPerson VALUES (0, 'Ramez', 'v', 1, 'Shamkant', 'm', 'elders', 'trainee', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'elders', 'chair', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'executive', 'protem', 'Wednesday');
INSERT INTO AltPerson VALUES (2, 'Jennifer', 'v', 3, 'Jeff', 'm', 'deacons', 'treasurer', 'Tuesday');
INSERT INTO AltPerson VALUES (3, 'Jeff', 'm', NULL, NULL, NULL, 'deacons', 'chair', 'Tuesday');


-- Exercise 4.1
-- a.
-- Informally, this relation is not well-designed because there are numerous NULL values
--		that are found in the data. This wastes space at the storage level and may also lead
--		to problems with understanding the meaning of those attributes. Also, there is a large
--		amount of redundant information. With team name, every time someone new gets added
--		to that team, the team name will need to be repeated, wasting space. We also have to
--		repeat the personId, name, and status for every time someone joins a new team.
-- To prove this formally, let us take a look at whether this relation is in BCNF. For BCNF
--		all left hand sides of functional dependencies must be a superkey of the relation.
--
--		Functional Dependencies:
--			personId -> name, status
--			mentorId -> mentorName, mentorStatus
--			teamName -> teamRole, teamTime
--
--		However, the Left Hand Side of these functional dependencies are NOT superkeys. The 
-- 		superkey for this relation is personId, teamName together. Just personId alone is not a superkey,
--		just teamName alone is not a superkey, and just mentorId alone is not a superkey.

-- b.
-- A more properly normalized schema for this database would be:
--		Person(personId, name, status, mentorId)
--		Team(teamId, teamName)
--		Person_Team(personId, teamId, role, time)
--
-- In this schema, we reduce the number of NULL values by having the mentorId as a foreign key
--		to Person(personId), so there is no need to store mentorName and mentorStatus along
--		with the mentorship information. We also reduce redundant values by creating a Team
--		relation that stores information for each team only once, not many times for each Person
--		on that team. We only enter in information when someone actually belongs to a team in the
--		Person_Team relation.
--
-- This schema is also in BCNF because, for each functional dependency in each table, the left hand side
--		of that functional dependency is a superkey for  that relation.
--		Examples:
--			personId -> name, status, mentorId
--			teamId -> teamName
--			personId, teamId -> role, time
--		personId is a superkey for the Person relation, teamId is a superkey for the Team relation,
--		and personId, teamId is a superkey for the Person_Team relation.

-- c.
-- Creating new normalized sub-relations

DROP TABLE Person_Team;
DROP TABLE Team;
DROP TABLE Person;

CREATE TABLE Person (
	personId integer PRIMARY KEY,
	name varchar(10),
	status char(1),
	mentorId integer,
	FOREIGN KEY (mentorId) REFERENCES Person(personId)
);

CREATE TABLE Team (
	teamName varchar(10)
);

CREATE TABLE Person_Team (
	teamName varchar(10),
	personId varchar(10),
	teamRole varchar(10),
    teamTime varchar(10)
	FOREIGN KEY (teanName) REFERENCES Team(teamName),
	FOREIGN KEY (personId) REFERENCES Person(personId)
);

INSERT INTO Person SELECT DISTINCT personId, name, status, mentorId FROM AltPerson;
INSERT INTO Team SELECT DISTINCT teamName FROM AltPerson;
INSERT INTO Person_Team SELECT DISTINCT teamName, personId, teamRole, teamTime FROM AltPerson;

SELECT * FROM Person;
SELECT * FROM Team;
SELECT * FROM Person_Team;