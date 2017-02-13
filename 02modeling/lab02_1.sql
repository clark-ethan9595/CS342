-- Lab2 CS342 - lab02_1.sql
-- Ethan Clark

-- Exercise 2.1
-- a.
-- i.
	-- Repeating a PRIMARY KEY value gives an ERROR saying that the 'unique constraint
	-- 		was violated'
	INSERT INTO Movie VALUES(1, 'The Hunger Games', 2010, 10.0);

-- ii.
	-- Trying to insert a NULL primary key value gave ERROR saying 'cannot insert NULL
	--		into ("ELC3"."MOVIE"."TITLE")'
	INSERT INTO Movie Values(3, NULL, 2010, 10.0);
	
-- iii.
	-- Trying to insert a value that fails a CHECK constraint gives ERROR saying 'check
	-- 		constraint violated'
	INSERT INTO Movie VALUES(3, 'THE HUNGER GAMES', 1800, 10.0);
	
-- iv.
	-- Trying to insert a value that violates the datatype constraint gave an ERROR
	--		saying 'invalid number'
	INSERT INTO Movie VALUES('a', 'THE HUNGER GAMES', 2010, 10.0);
	
-- v.
	-- Trying to insert a negative number for the score value actually worked. There
	--		is no CHECK constraint to check that it is positive nor is the datatype
	--		one that makes it positive.
	INSERT INTO Movie VALUES(3, 'THE HUNGER GAMES', 2010, -10.0);
	
-- b.
-- i.
	-- Adding a record with a NULL value for a foreign key value worked and performed the
	-- 		insertion and a row was created.
	INSERT INTO Casting VALUES(NULL, 1, 'star');
	
-- ii.
	-- Adding a record with a foreign key value that doesn't have any key value in the
	--		referenced table does not work and gives ERROR saying 'integrity constraint
	--		violated - parent key not found'
	INSERT INTO Casting VALUES(10, 1, 'star');

-- iii.
	-- Adding a record with a key value in a referenced table with no related records in
	-- 		the referencing table still works. The referencing table foreign key needs to
	--		reference something, but not vice-versa.
	INSERT INTO Movie VALUES(5, 'INTERSTELLAR', 2013, 9.9);
	
-- c.
-- i. 
	-- Deleting a referenced record that is referenced by a referencing record worked
	--		because of the ON DELETE CASCADE constraint found in the Casting table for
	--		the movieID foreign key. When I deleted the movie with id of 1, the records in Casting
	-- 		with movieID of 1 were also deleted.
	DELETE FROM Movie WHERE id = 1;
	
-- ii.
	-- DELETING a referencing record that references a referenced record works just
	-- 		normally. It deletes those records and all other records are good.
	DELETE FROM Casting WHERE movieId = 1;
	
-- iii.
	-- Modifying the ID of a movie record that is referenced by a casting record gave an ERROR
	--		saying 'integrity constraint violated - child record.' There is a child record referencing
	--		the record that I tried to update.
	UPDATE Movie SET id=10 WHERE title='Star Wars';