-- Homework09_1.sql
-- Ethan Clark
-- CS 342 - Homework09
-- April 13, 2017

-- Implement the following SQL queries on the IMDBLarge, optimize them using physical database and SQL tuning.

-- For each query, include a short (one-paragraph) discussion that includes the following.
--		The alternate implementation forms you could have used and why you choose the one you did.
--		The indexes your queries use (or don't use) and why they help.
--		The general SQL tuning heuristics you've deployed.

-- Demonstrate what you've accomplished by reviewing the execution plans for each query.

-- For testing purposes, it can be helpful to run these queries on the smaller IMDB; this works provided that you relax the requirements a bit 
--		e.g., directors with more than 2 rather than 200 movies, etc.).

-- 1.
-- Get the movies directed by Clint Eastwood.

	-- Attempt 1
	SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
		-- This averaged a runtime of 0.03 seconds.
		
	-- Attempt 2
	CREATE INDEX tempIndex ON MovieDirector(directorId);
	
	SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
	
	DROP INDEX tempIndex;
		-- This averaged a runtime of 0.01 seconds.
		
	-- Attempt 3
	CREATE INDEX tempIndex ON Director(firstName, lastName);
	
	SELECT M.id, M.name, M.year, M.rank FROM Movie M, Director D, MovieDirector MD
	WHERE M.id = MD.movieId AND D.id = MD.directorId AND D.firstName = 'Clint' AND D.lastName = 'Eastwood';
	
	DROP INDEX tempIndex;
		-- This averaged a runtime of 0.03 seconds.
		
		
	-- ****** Answers to Questions ******
	-- I tried three attempts of optimizing this query. The first one I did without any index, the second one I attempted with an index on the MovieDirector table, and the third one I attempted
	--		with an index on the Director table. It seems that creating an index with the MovieDirector table ran with the best average time (over multiple runs). The difference in the execution plan
	--		for each one is that for attempt 2, the database does a "Table Access by Index RowId" operation instead of a "Table Access Full" operation as in attempt one. In the third attempt, the database
	--		does a "Table Access by Index RowId" operation on the Director table instead of a "Table Access Full" operation as in attempt one.
	-- I would choose the second attempt as my optimal solution. This implementation uses an index on the MovieDirector table which should make looking through that table much faster than the other two
	--		implementations because it no longer does a "Table Access Full" operation. This solution uses a MovieDirector index which helps Oracle find directors faster when the join operation is needed. 
