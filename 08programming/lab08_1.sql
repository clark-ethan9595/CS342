-- lab08_1.sql
-- Ethan Clark
-- CS342 - Lab08
-- March 31, 2017

-- Exercise 8.1

-- Procedure to insert an actor/actress into a movie cast.
--		Prelim: Actor/Actress must already be in the database.
CREATE OR REPLACE PROCEDURE castActor (actorId IN INTEGER, movieId IN INTEGER, role IN Role.role%type) AS
foundactorId INTEGER;
foundmovieId INTEGER;
BEGIN

	SELECT ID INTO foundactorId FROM Actor A WHERE A.id = actorId;
	
	IF foundactorId IS NULL THEN
		dbms_output.put_line('Actor not found.');
	ELSE
		dbms_output.put_line('Actor found');
		
		SELECT ID INTO foundmovieId FROM Movie M WHERE M.id = movieId;
		
		IF foundmovieId IS NULL THEN
			dbms_output.put_line('Movie not found.');
		ELSE
			dbms_output.put_line('Movie found.');
			
			INSERT INTO Role VALUES (actorId, movieId, role);
		END IF;
		
	END IF;
	
END;
/
SHOW ERRORS;

-- Trigger to check if the new actor/actress insertion is allowed
--		Actor/Actress cannot already be cast in the movie
--		Cast cannot have more than 230 actors/actresses.
CREATE OR REPLACE TRIGGER insertRole BEFORE INSERT ON Role FOR EACH row
DECLARE
actorCastCount INTEGER;
movieCastCount INTEGER;
BEGIN
		
	SELECT COUNT(*) INTO actorCastCount FROM Role R WHERE R.actorId = :new.actorId AND R.movieId = :new.movieId;
	
	IF actorCastCount > 0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Actor/Actress ' || :new.actorId || ' already has a role in movie '
			|| :new.movieId || '!');
	END IF;
	
	SELECT COUNT(*) INTO movieCastCount FROM Role R WHERE R.movieId = :new.movieId;
	
	IF movieCastCount > 229 THEN
		RAISE_APPLICATION_ERROR(-20000, 'Movie ' || :new.movieId || ' has a full cast!');
	END IF;
	
END;
/
SHOW ERRORS;
	
-- Test the procedue and trigger with these three casting calls
-- George Clooney already cast in this movie
BEGIN castActor(89558, 238072, 'Danny Ocean'); END;
/

-- George Clooney not cast in this movie
BEGIN castActor(89558, 238073, 'Danny Ocean'); END;
/

-- JFK movie already has full (230) casting
BEGIN castActor(89558, 167324, 'Danny Ocean'); END;
/