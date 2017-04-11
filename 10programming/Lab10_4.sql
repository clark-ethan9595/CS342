-- Lab10_4.sql
-- Ethan Clark
-- CS 342 - Lab10
-- April 14, 2017

-- Consider the following stored procedure.

CREATE OR REPLACE PROCEDURE incrementRank
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		SELECT rank INTO x FROM Movie WHERE id=movieIdIn;
		UPDATE Movie SET rank=x+deltaIn WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

-- Restart your two SQL*Plus sessions, run the given stored procedure simultaneously in each of them using:

-- EXECUTE incrementRank(movieId, smallIncrementValue);

-- Now, determine if it ran correctly. If it does, explain how. If it doesn’t, identify the problem and modify the code to fix it.

-- Lab10_4.sql