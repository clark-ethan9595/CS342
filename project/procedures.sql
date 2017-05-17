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

-- Set serveroutput on so that the dbms_output.put_line actually shows up to user
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE tradePlayers (teamOneId IN INTEGER, athleteOneId IN INTEGER, teamTwoId IN INTEGER, athleteTwoId IN INTEGER) AS
	athleteOne INTEGER;
	athleteTwo INTEGER;
	teamOne INTEGER;
	teamTwo INTEGER;
	counter INTEGER;
	wrongTeamOneException EXCEPTION;
	wrongTeamTwoException EXCEPTION;
	
BEGIN

	-- Create a savepoint to jump back to if needed and lock the Atlete_Team table
	SAVEPOINT temp;
	LOCK TABLE Athlete_Team IN EXCLUSIVE MODE NOWAIT;
	
	-- Just in case a user tries to modify/delete an athlete or a team during this transaction
	LOCK TABLE Athlete IN EXCLUSIVE MODE NOWAIT;
	LOCK TABLE Team IN EXCLUSIVE MODE NOWAIT;

	-- Get the counts to check if both athletes and both teams actually exist in the database
	SELECT COUNT(*) INTO athleteOne FROM Athlete WHERE athleteId = athleteOneId;
	SELECT COUNT(*) INTO athleteTwo FROM Athlete WHERE athleteId = athleteTwoId;
	SELECT COUNT(*) INTO teamOne FROM Team WHERE teamId = teamOneId;
	SELECT COUNT(*) INTO teamTwo FROM Team WHERE teamId = teamTwoId;
	
	-- If athleteOneId does not exist in the database, inform the user
	IF athleteOne = 0 THEN
		dbms_output.put_line('Athlete ' || athleteOneId || ' not found.');
	
	-- If athleteTwoId does not exist in the database, inform the user
	ELSIF athleteTwo = 0 THEN
		dbms_output.put_line('Athlete ' || athleteTwoId || ' not found.');
	
	-- If teamOneId does not exist in the database, inform the user
	ELSIF teamOne = 0 THEN
		dbms_output.put_line('Fantasy Team ' || teamOneId || ' not found.');
	
	-- If teamTwoId does not exist in the database, inform the user
	ELSIF teamTwo = 0 THEN
		dbms_output.put_line('Fantasy Team ' || teamTwoId || ' not found.');
	
	-- Otherwise...
	ELSE

		-- See if athleteOneId is on teamOneId
		SELECT COUNT(*) INTO counter FROM Athlete_Team WHERE teamId = teamOneId AND athleteId = athleteOneId;
	
		-- If athleteOneId is not actually on teamOneId, raise error
		IF counter = 0 THEN	
			RAISE wrongTeamOneException;
		END IF;
	
		-- See if athleteTwoId is on teamTwoId
		SELECT COUNT(*) INTO counter FROM Athlete_Team WHERE teamId = teamTwoId AND athleteId = athleteTwoId;
	
		-- If athleteTwoId is not actually on teamTwoId, raise error
		IF counter = 0 THEN
			RAISE wrongTeamTwoException;
		END IF;
		
		-- Remove both players from their original teams
		DELETE FROM Athlete_Team WHERE teamId = teamOneId AND athleteId = athleteOneId;
		DELETE FROM Athlete_Team WHERE teamId = teamTwoId AND athleteId = athleteTwoId;
		
		-- Add both players onto their new teams
		INSERT INTO Athlete_Team VALUES (teamOneId, athleteTwoId);
		INSERT INTO Athlete_Team VALUES (teamTwoId, athleteOneId);
		
	END IF;
	
	-- Commit the transaction
	COMMIT;
	
	EXCEPTION
	
		-- When athleteOneId is not actually on teamTwoId
		WHEN wrongTeamOneException THEN
			RAISE_APPLICATION_ERROR(-20000, 'Athlete ' || athleteOneId || ' is not on Fantasy Team ' || teamOneId);
			-- Rollback to the savepoint from the beginning of the procedure
			ROLLBACK TO temp;
			
		-- When athleteTwoId is not actually on teamTwoId
		WHEN wrongTeamTwoException THEN
			RAISE_APPLICATION_ERROR(-20000, 'Athlete ' || athleteTwoId || ' is not on Fantasy Team ' || teamTwoId);
			-- Rollback to the savepoint at the beginning of the procedure
			ROLLBACK TO temp;
			
		-- In the case of some unforeseen exception
		WHEN OTHERS THEN
			dbms_output.put_line("Unknown error as occurred... Rolling back to savepoint");
			ROLLBACK TO temp;

END;
/
SHOW ERRORS;