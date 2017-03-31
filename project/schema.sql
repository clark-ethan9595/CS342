-- Schema for the MIAA Fantasy Basketball database
-- Ethan Clark - CS 342

CREATE TABLE School (
	schoolId integer PRIMARY KEY,
	name varchar(50),
	city varchar(30),
	state_char varchar(2)
);

-- If a School gets deleted from the database, then it makes sense for the Athletes to
--		be removed as well.
CREATE TABLE Athlete (
	athleteId integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(20),
	city varchar(30),
	state_char varchar(2),
	GPA float,
	grade varchar(10),
	position varchar(10),
	schoolId integer,
	FOREIGN KEY (schoolId) REFERENCES School(schoolId) ON DELETE CASCADE
);

-- If a School gets deleted from the database, then I think a Game should be set to NULL because
--		then the School remaining could still find another School to potentially play.
CREATE TABLE Game (
	gameId integer PRIMARY KEY,
	matchDate date,
	homeSchoolId integer,
	awaySchoolId integer,
	FOREIGN KEY (homeSchoolId) REFERENCES School(schoolId) ON DELETE SET NULL,
	FOREIGN KEY (awaySchoolId) REFERENCES School(schoolId) ON DELETE SET NULL
);

CREATE TABLE League (
	leagueId integer PRIMARY KEY,
	leagueName varchar(30),
	startDate date
);

CREATE TABLE Users (
	userId integer PRIMARY KEY,
	userName varchar(30),
	firstName varchar(15),
	lastName varchar(20)
);

-- If a User gets deleted from the database, then the Team that belonged to them should also get deleted.
--
-- If a League gets deleted from the database, then the Teams in that league should NOT get deleted, but we
--		can set their leagueId to be NULL because we can have Teams not in a League.
CREATE TABLE Team (
	teamId integer PRIMARY KEY,
	teamName varchar(50),
	wins integer,
	losses integer,
	ties integer,
	userId integer,
	leagueId integer,
	FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE,
	FOREIGN KEY (leagueId) REFERENCES League(leagueId) ON DELETE SET NULL
);

-- If an Athlete is deleted from the database, then the record of the Athlete being on a given Team
--		should also be deleted.
-- If a Team is deleted from the database, then the record of the Athletes being on that Team should
--		also be deleted. This does not remove the Athletes from the Athlete table, just the Athlete_Team table.
CREATE TABLE Athlete_Team (
	teamId integer,
	athleteId integer,
	PRIMARY KEY (teamId, athleteId),
	FOREIGN KEY (athleteId) REFERENCES Athlete(athleteId) ON DELETE CASCADE,
	FOREIGN KEY (teamId) REFERENCES Team(teamId) ON DELETE CASCADE
);-

-- If an Athlete is deleted from the database, then the records of the Games that athlete played in
--		should also be deleted as well as they are no longer part of an MIAA school. Again, this does
--		not remove Athletes from the Athlete table, just the Athlete_Game table.
-- If a Game is deleted from the database, then the records of that Game should also be deleted in
--		the Athlete_Game table as well.
CREATE TABLE Athlete_Game (
	gameId integer,
	athleteId integer,
	points integer,
	rebounds integer,
	assists integer,
	steals integer,
	blocks integer,
	turnovers integer,
	PRIMARY KEY (gameId, athleteId),
	FOREIGN KEY (gameId) REFERENCES Game(gameId) ON DELETE CASCADE,
	FOREIGN KEY (athleteId) REFERENCES Athlete(athleteId) ON DELETE CASCADE
);