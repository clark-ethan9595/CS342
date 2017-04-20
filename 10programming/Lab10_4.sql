-- Lab10_4.sql
-- Ethan Clark
-- CS 342 - Lab10
-- April 19, 2017

-- Consider the following stored procedure.

CREATE OR REPLACE PROCEDURE incrementRank
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		SELECT rank INTO x FROM Movie WHERE id=movieIdIn FOR UPDATE;
		UPDATE Movie SET rank=x+deltaIn WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

-- Restart your two SQL*Plus sessions, run the given stored procedure simultaneously in each of them using:

-- EXECUTE incrementRank(movieId, smallIncrementValue);

-- Now, determine if it ran correctly. If it does, explain how. If it doesn’t, identify the problem and modify the code to fix it.


-- ******* ANSWERS TO QUESTIONS ********

-- The first time I ran this procedure simultaneously on my two SQL*Plus sessions, I executed with the statement
--		EXECUTE incrementRank(238075, 0.01);
--		in both sessions to increment the rank of the movie "Ocean's Fourteen" by 0.01 50,000 times each (so the end result of the rank should be 1004.5).
--		Instead, the updated rank was 623.49, which I have no idea how that happened exactly. Something like the lost update problem where some of the updates
--		were being lost by the other session overwriting them.

-- To fix this issue, all I did was add the FOR UPDATE locking tool that Oracle provides to lock just the affected rows in the table each time the procedure
--		needed to update the rank of a movie table record. This allowed the procedure to not loose any update information, and, after running the procedure
--		again in both of my SQL*Plus sessions, I got a final rank result of 1004.5 for "Ocean's Fourteen".