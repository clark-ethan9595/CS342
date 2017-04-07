-- Homework08_2.sql
-- Ethan Clark
-- CS 342 - Homework08
-- April 4, 2017

-- Exercise 2

-- Bacon Number
-- Implement a tool that loads a table (named BaconTable) with records that specify an actor Id and that actor's Bacon Number.
--		An actor's Bacon Number is the length of the shortest path between the actor and Kevin Bacon (KB) in the "co-acting" graph. That
--		is, KB has a Bacon Number of 0; all actors who acted in the same movie as KB have Bacon Number 1; all actors who have acted in
--		the same movie as some actor with Bacon Number 1 but have not acted with Bacon himself have a Bacon Number of 2, etc. Actors who
--		have never acted with anyone with a Bacon Number should not have a record in the table. Stronger solutions will be configured so
--		that the number can be based on any actor, not just Kevin Bacon.

-- Create the BaconTable
CREATE TABLE BaconTable (
	actorId integer PRIMARY KEY,
	baconNumber integer
);

-- Create procedure to get the baconNumber of all actors given any valid actorId
CREATE OR REPLACE PROCEDURE baconNumber (actorId_Base IN INTEGER, depthLevel IN INTEGER) AS

-- Local integer variables
inBaconTable INTEGER;
currentDepth INTEGER;
foundactorCount INTEGER;

BEGIN

	-- Check to see if the base actor is in the database
	SELECT COUNT(*) INTO foundactorCount FROM Actor WHERE id = actorId_Base;

	-- If base actor is not in the database, raise an application error
	IF foundactorCount = 0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Actor/Actress ' || actorId_Base || ' does not exist in database!');
	END IF;

	-- If first call of baconNumber, insert actorId with baconNumber 0
	IF depthLevel = 1 THEN
		INSERT INTO BaconTable VALUES (actorId_Base, 0);
	END IF;

	-- I don't go any deeper than 4 levels because without this condition, I get the error that says
	--		'maximum open cursors exceeded'. I tried setting the parameter for the total number of
	--		cursors I can have open, but that still didn't help the issue.
	IF depthLevel > 4 THEN
		RETURN;
	END IF;

	-- Iterate through the results from the cursor
	FOR actor IN (SELECT actorId FROM Role WHERE movieId IN (SELECT movieId FROM Role WHERE actorId = actorId_Base)) LOOP

		-- Find out if actor is already in the BaconTable
		SELECT COUNT(*) INTO inBaconTable FROM BaconTable WHERE actorId = actor.actorId;

		-- If actor is not in the BaconTable, insert into table
		IF inBaconTable = 0 THEN

			INSERT INTO BaconTable VALUES (actor.actorId, depthLevel);
			baconNumber(actor.actorId, depthLevel + 1);

		-- Otherwise check if we found a smaller baconNumber for that actor
		ELSE

			SELECT baconNumber INTO currentDepth FROM BaconTable WHERE actorId = actor.actorId;

			IF currentDepth > depthLevel THEN

				UPDATE BaconTable SET baconNumber = depthLevel WHERE actorId = actor.actorId;
				baconNumber(actor.actorId, depthLevel + 1);

			END IF;

		END IF;

	END LOOP;

END;
/
SHOW ERRORS;

-- Test the baconNumber procedure with Kevin Bacon's actorId number
BEGIN baconNumber(22591, 1); END;
/

-- Get all the actors with baconNumber of 1
--		I.e. Actors who acted in a movie with Kevin Bacon
SELECT * FROM BaconTable WHERE baconNumber = 1;

DELETE FROM BaconTable;

-- Test the baconNumber procedure with an actorId that doesn't exist
BEGIN baconNumber(1, 1); END;
/

-- Test the baconNumber procedure with a different actorId
BEGIN baconNumber(837199, 1); END;
/

-- Get all the actors with baconNumber of 1
--		I.e. Actors who acted in a movie with Kate Winslett
SELECT * FROM BaconTable WHERE baconNumber = 1;

-- Drop BaconTable
DROP TABLE BaconTable;