-- Schema for the MIAA Fantasy Basketball database
-- Ethan Clark - CS 342

CREATE TABLE School (
	schoolId integer PRIMARY KEY,
	name varchar(50),
	city varchar(30),
	state varchar(2)
);

CREATE TABLE Athlete (
	athleteId integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(20).
	city varchar(30),
	state varchar(2),
	GPA float,
	class varchar(10),
	position varchar(10),
	schoolId integer,
	FOREIGN KEY schoolId REFERENCES School(schoolId)
);

CREATE TABLE Match (
	matchId integer PRIMARY KEY,
	matchDate date,
	homeSchoolId integer,
	awaySchoolId integer,
	FOREIGN KEY homeSchoolId REFERENCES School(schoolId),
	FOREIGN KEY awaySchoolId REFERENCES School(schoolId)
);

CREATE TABLE League (
	leagueId integer PRIMARY KEY,
	leagueName varchar(30),
	startDate date,
);

CREATE TABLE User (
	userId integer PRIMARY KEY,
	firstName varchar(15),
	lastName varchar(20),
	leagueId integer,
	FOREIGN KEY leagueId REFERENCES League(leagueId)
);

CREATE TABLE Team (
	teamId integer PRIMARY KEY,
	teamName varchar(50),
	wins integer,
	losses integer,
	ties integer,
	userId integer,
	leagueId integer,
	FOREIGN KEY userId REFERENCES User(userId),
	FOREIGN KEY leagueId REFERENCES League(leagueId)
);

CREATE TABLE Athlete_Team (
	athleteId integer,
	teamId integer,
	PRIMARY KEY (studentId, teamId),
	FOREIGN KEY studentId REFERENCES Student_Athlete(studentId),
	FOREIGN KEY teamId REFERENCES Team(teamId)
);

CREATE TABLE Athlete_Match (
	matchId integer,
	athleteId integer,
	points integer,
	rebounds integer,
	assists integer,
	steals integer,
	blocks integer
	turnovers integer,
	PRIMARY KEY (matchId, athleteId),
	FOREIGN KEY matchId REFERENCES Match(matchId),
	FOREIGN KEY athleteId REFERENCES Athlete(athleteId)
);