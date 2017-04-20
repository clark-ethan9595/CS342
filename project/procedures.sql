-- procedures.sql
-- Ethan Clark
-- CS 342 - Final Project
-- April 20, 2017

-- Create an appropriate stored procedure for your database that implements a multi-step transaction.

-- Stored Procedure tradePlayers simulates trading two Athletes between two Fantasy Teams in the same League.
--		It takes in as parameters two Fantasy Team ids and two Athlete ids.
--		We first check to see if all of these Fantasy Teams and Athletes are in the database.
--		Then we check to see if AthleteOne belongs to TeamOne and AthleteTwo belongs to TeamTwo
--		If all of these conditions pass, then we remove the two records from the Athlete_Team table, and insert two records with
--		the Athletes swapped on the teams.
--
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE tradePlayers (teamOneId IN INTEGER, athleteOneId IN INTEGER, teamTwoId IN INTEGER, athleteTwoId IN INTEGER) AS
	athleteOne INTEGER;
	athleteTwo INTEGER;
	teamOne INTEGER;
	teamTwo INTEGER;
	counter INTEGER;
BEGIN

	SELECT COUNT(*) INTO athleteOne FROM Athlete WHERE athleteId = athleteOneId;
	SELECT COUNT(*) INTO athleteTwo FROM Athlete WHERE athleteId = athleteTwoId;
	SELECT COUNT(*) INTO teamOne FROM Team WHERE teamId = teamOneId;
	SELECT COUNT(*) INTO teamTwo FROM Team WHERE teamId = teamTwoId;
	
	IF athleteOne = 0 THEN
		dbms_output.put_line('Athlete ' || athleteOneId || ' not found.');
	
	ELSIF athleteTwo = 0 THEN
		dbms_output.put_line('Athlete ' || athleteTwoId || ' not found.');
	
	ELSIF teamOne = 0 THEN
		dbms_output.put_line('Fantasy Team ' || teamOneId || ' not found.');
	
	ELSIF teamTwo = 0 THEN
		dbms_output.put_line('Fantasy Team ' || teamTwoId || ' not found.');
	
	ELSE

		SELECT COUNT(*) INTO counter FROM Athlete_Team WHERE teamId = teamOneId AND athleteId = athleteOneId;
	
		IF counter = 0 THEN	
			RAISE_APPLICATION_ERROR(-20000, 'Athlete ' || athleteOneId || ' is not on Fantasy Team ' || teamOneId);
		END IF;
	
		SELECT COUNT(*) INTO counter FROM Athlete_Team WHERE teamId = teamTwoId AND athleteId = athleteTwoId;
	
		IF counter = 0 THEN
			RAISE_APPLICATION_ERROR(-20000, 'Athlete ' || athleteTwoId || ' is not on Fantasy Team ' || teamTwoId);
		END IF;
		
		DELETE FROM Athlete_Team WHERE teamId = teamOneId AND athleteId = athleteOneId;
		
		DELETE FROM Athlete_Team WHERE teamId = teamTwoId AND athleteId = athleteTwoId;
		
		INSERT INTO Athlete_Team VALUES (teamOneId, athleteTwoId);
		
		INSERT INTO Athlete_Team VALUES (teamTwoId, athleteOneId);
		
	END IF;

END;
/
SHOW ERRORS;