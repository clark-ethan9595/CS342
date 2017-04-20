-- Homework10.sql
-- Ethan Clark
-- CS 342 - Homework 10
-- April 19, 2017

-- Write a PL/SQL procedure that receives two movie IDs and an integer amount and “transfers” a given amount of rank value from a source
--		movie to a destination movie. Note that this doesn’t make much sense in the context of the movie database, but it’s similar to
--		money transfers in a banking database.

-- Your procedure should be designed in such a way that it can be run simultaneously by the following sample script to separate threads
--		and still give a consistent result.

-- Your procedure should check the values it receives, raising exceptions as appropriate.
-- Don’t allow the rank value to drop below 0.
-- To make your transaction logic explicit, please use declared exceptions as follows.

CREATE OR REPLACE PROCEDURE transferRank (movieOutOf IN INTEGER, movieInto IN INTEGER, amount IN FLOAT) AS

tooSmallRank EXCEPTION;
movieOutNotExist EXCEPTION;
movieInNotExist EXCEPTION;
foundMovieId INTEGER;
movieOutRank FLOAT;
movieIntoRank FLOAT;

BEGIN

	SELECT COUNT(*) INTO foundMovieId FROM Movie WHERE id = movieOutOf;

	IF foundMovieId = 0 THEN
		RAISE movieOutNotExist;
	END IF;

	SELECT COUNT(*) INTO foundMovieId FROM Movie WHERE id = movieInto;

	IF foundMovieId = 0 THEN
		RAISE movieInNotExist;
	END IF;

	SELECT rank INTO movieOutRank FROM Movie WHERE id = movieOutOf FOR UPDATE;

	IF movieOutRank - amount < 0 THEN
		RAISE tooSmallRank;
	END IF;

	UPDATE Movie SET rank = movieOutRank - amount WHERE id = movieOutOf;

	SELECT rank INTO movieIntoRank FROM Movie WHERE id = movieInto FOR UPDATE;
	UPDATE Movie SET rank = movieIntoRank + amount WHERE id = movieInto;

	COMMIT;

EXCEPTION

	WHEN movieOutNotExist THEN
		RAISE_APPLICATION_ERROR(-20000, 'Movie id ' || movieOutOf || ' does not exist in the database!');

	WHEN movieInNotExist THEN
		RAISE_APPLICATION_ERROR(-20000, 'Movie id ' || movieInto || ' does not exist in the database!');

	WHEN tooSmallRank THEN
		RAISE_APPLICATION_ERROR(-20000, 'Movie id ' || movieOutOf || ' will have rank less than 0!');

END;
/
SHOW ERRORS;


BEGIN
	FOR i IN 1..10000 LOOP
		transferRank(176712, 176711, 0.1);
		COMMIT;
		transferRank(176711, 176712, 0.1);
		COMMIT;
	END LOOP;
END;
/