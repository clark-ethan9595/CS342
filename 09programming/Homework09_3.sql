-- Homework09_3.sql
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

-- 3.
-- Get the most popular actors, where actors are designated as popular if their movies have an average rank greater than 8.5 with a movie count of at least 10 movies.

	-- Attempt 1
	SELECT A.id, A.firstName, A.lastName, TRUNC(AVG(M.rank), 1) as Average_Rank, COUNT(1) as Number_of_Movies
	FROM Actor A, Movie M, Role R
	WHERE A.id = R.actorId AND M.id = R.movieId
	HAVING AVG(M.rank) > 8.5 AND COUNT(*) > 9
	GROUP BY A.id, A.firstName, A.lastName
	ORDER BY AVG(M.rank) ASC;
		-- This runtime averaged about 2.92 seconds
		
	-- Attempt 2
	-- I would attempt to create an index on the Role table here, but that did not work in Lab9 so it would not work here either. I would guess that creating an index on the Role table
	--		would help this query run faster, but I am not 100% sure.
	--CREATE INDEX tempIndex ON Role(actorId, movieId);
	
	--SELECT A.id, A.firstName, A.lastName, TRUNC(AVG(M.rank), 1) as Average_Rank, COUNT(1) as Number_of_Movies
	--FROM Actor A, Movie M, Role R
	--WHERE A.id = R.actorId AND M.id = R.movieId
	--HAVING AVG(M.rank) > 8.5 AND COUNT(*) > 9
	--GROUP BY A.id, A.firstName, A.lastName
	--ORDER BY AVG(M.rank) ASC;
	
	--DROP INDEX tempIndex;
	

	-- ******* Answers to Questions *******
	-- For this exercise, I cannot think of any other implementation form to use here. Potentially, attempt 2 would have performed better than attempt 1 had we been able to create the index
	--		on the Role table, but we will not know because of the error "unable to extend temp segement by 128 in tablespace SYSTEM". An index on the Role table combining actorId and movieId should
	--		help Oracle search faster. The only general SQL tuning heuristic I used in this query was using COUNT(1) instead of COUNT(*) because we determined that COUNT(1) was just a hair faster
	--		than COUNT(*) from Lab9.
	