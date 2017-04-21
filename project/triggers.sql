-- triggers.sql
-- Ethan Clark
-- CS 342 - Final Project
-- April 20, 2017

-- Create an appropriate trigger for your database that enforces an integrity constraint (or constraints) that can’t easily be
--		implemented with table constraints and checks.

-- numPlayersTeam trigger checks to make sure that a fantasy team does not get too many players
--		Each fantasy team can only have a maximum of 8 players
--		If the INSERT command is going to make the team have more than 8 players, an application error is raised
--		notifying the user of the error.
CREATE OR REPLACE TRIGGER numPlayersTeam BEFORE INSERT ON Athlete_Team FOR EACH ROW
DECLARE
	 counter INTEGER;
	 tooBigTeam EXCEPTION;	 
BEGIN

	SELECT COUNT(*) INTO counter FROM Athlete_Team WHERE teamId = :new.teamId;
	
	-- If the Team is already full, raise an exception
	IF counter >= 8 THEN
		RAISE tooBigTeam;
	END IF;
	
EXCEPTION

	-- When the Team is already full
	WHEN tooBigTeam THEN
		RAISE_APPLICATION_ERROR(-20000, 'Team ' || :new.teamId || ' is already full.');

END;
/
SHOW ERRORS;


-- numTeamsLeague trigger checks to make sure that a fantasy league does not get too many fantasy teams
--		Each fantasy league can only have a maximum of 5 teams
--		If the INSERT command is going to make the league have more than 6 teams, an application error is raised
--		notifying the user of the error.
CREATE OR REPLACE TRIGGER numTeamsLeague BEFORE INSERT ON Team FOR EACH ROW
DECLARE
	 counter INTEGER;
	 tooBigLeague EXCEPTION; 
BEGIN

	SELECT COUNT(*) INTO counter FROM Team WHERE leagueId = :new.leagueId;
	
	-- If the League is already full, raise an exception
	IF counter >= 5 THEN
		RAISE tooBigLeague;
	END IF;
	
EXCEPTION

	-- when the League is already full
	WHEN tooBigLeague THEN
		RAISE_APPLICATION_ERROR(-20000, 'League ' || :new.leagueId || ' is already full.');

END;
/
SHOW ERRORS;