-- Homework09_2.sql
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

-- 2.
-- Get the number of movies directed by each director who's directed more than 200 movies.

	-- Attempt 1
	SELECT D.id, D.firstName, D.lastName, COUNT(1) AS Number_Movies
	FROM Director D, MovieDirector MD
	WHERE D.id = MD.directorId
	HAVING COUNT(*) > 200
	GROUP BY D.id, D.firstName, D.lastName
	ORDER BY COUNT(*) ASC;
		-- This runtime averaged around 0.14 seconds.
		
	-- Attempt 2
	CREATE INDEX tempIndex ON MovieDirector(directorId);
	
	SELECT D.id, D.firstName, D.lastName, COUNT(1) AS Number_Movies
	FROM Director D, MovieDirector MD
	WHERE D.id = MD.directorId
	HAVING COUNT(*) > 200
	GROUP BY D.id, D.firstName, D.lastName
	ORDER BY COUNT(*) ASC;
	
	DROP INDEX tempIndex;
		-- This runtime averaged around 0.14 seconds also.
		
	
	-- ******* Answers to Questions *******
	-- I attempted two different ways to run this query. First, I ran a query that joined the Director and MovieDirector tables on the directorId and selected the id, firstname, and lastname of the director along
	--		with the number of movies they have directed. For the second attempt, I added an index on the MovieDirector table using the directorId, which I thought would potentially making searching through the
	--		MovieDirector table much faster. But in fact, the second attempt runtime was about the same as the first attempt. There ended up being no differences at all in the execution plans of these two
	-- 		attempts. Both of them require a "Table Access Full" operation on both the director and MovieDirector tables, which is not what I would have thought would have happened in the second attempt with the
	--		index.
	-- In this case, it does not matter which attempt I would choose. I guess I would stick with the first attempt to avoid the time required to create the tempIndex. The index did not end up doing anything useful
	--		for us. I used COUNT(1) instead of COUNT(*) because we determined that COUNT(1) is just a little bit faster than COUNT(*) in Lab9.