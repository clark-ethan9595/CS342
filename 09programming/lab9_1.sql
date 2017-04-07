-- Lab9_1.sql
-- Ethan Clark
-- CS 342 - Lab9
-- April 7, 2016

-- Build sample queries to test that:

SET AUTOTRACE ON; 
SET SERVEROUTPUT ON;
SET TIMING ON;

-- a.
-- There is a benefit to using either COUNT(1), COUNT(*) or SUM(1) for simple counting queries.

-- **** Using COUNT(*) *****
SELECT COUNT(*) FROM Movie;

DECLARE
temp INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT COUNT(*) INTO temp FROM Movie;
	END LOOP;
END;
/

-- ***** Using COUNT(1) ******
SELECT COUNT(1) FROM Movie;

DECLARE
temp INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT COUNT(1) INTO temp FROM Movie;
	END LOOP;
END;
/

-- ****** Using SUM(1) *******
SELECT SUM(1) FROM Movie;

DECLARE
temp INTEGER;
BEGIN
	FOR i in 1..1000 LOOP
		SELECT SUM(1) INTO temp FROM Movie;
	END LOOP;
END;
/

	-- All three of these queries contained the same exact plan output, but the query with
	--		SUM(1) took 11 seconds to run the loop while COUNT(*) and COUNT(1) only took 5 seconds
	--		to complete their loops. So it looks like SUM(1) is slower than both of the COUNTs.

-- b.
-- The order of the tables listed in the FROM clause affects the way Oracle executes a join query.
EXPLAIN PLAN FOR SELECT * FROM Actor A, Role R WHERE A.id = R.actorId;
SELECT PLAN_TABLE_OUTPUT FROM TABLE (DBMS_XPLAN.DISPLAY());

EXPLAIN PLAN FOR SELECT * FROM Role R, Actor A WHERE A.id = R.actorId;
SELECT PLAN_TABLE_OUTPUT FROM TABLE (DBMS_XPLAN.DISPLAY());

	-- Both of these queries did not differ much in elapsed time it took for them to complete (0.03 seconds each).
	--		For some reason, the plan output for both of these does a TABLE ACCESS FULL with the actor table first and
	--		then the role table, even when the role table is put first in the FROM clause. This makes it seem that Oracle
	--		doesn't care which table comes first, it performs the join query to its optimal liking.

-- c.
-- The use of arithmetic expressions in join conditions (e.g., FROM table1 JOIN table2 ON table1.id+0=table2.id+0)
--		affects a query's efficiency.
EXPLAIN PLAN FOR SELECT * FROM Actor A, Role R WHERE A.id = R.actorId;
SELECT PLAN_TABLE_OUTPUT FROM TABLE (DBMS_XPLAN.DISPLAY());

EXPLAIN PLAN FOR SELECT * FROM Actor A, Role R WHERE A.id+1 = R.actorId+1;
SELECT PLAN_TABLE_OUTPUT FROM TABLE (DBMS_XPLAN.DISPLAY());

	-- These queries perform very roughly the same. The output plan is the same for both of them and the 
	--		query with the arithmetic in the join conditions is only 0.03 seconds slower than the first query.

-- d.
-- Running the same query more than once affects its performance

-- Run this query five times
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;
	-- Time: 0.06
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;
	-- Time: 0.04
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;
	-- Time: 0.06
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;
	-- Time: 0.04
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;
	-- Time: 0.06


	-- Comparing the elapsed times of these queries, it does not seem like running a query multiple times
	--		affects the performance. I would have guessed that maybe Oracle does something to this extent to
	--		make the performance time better (maybe by doing a form of caching results or the query because the
	--		same query could be performed again and again), but maybe not.
-- e.
-- Adding a concatenated index on a join table improves performance (see the create index command described above).
SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;

CREATE INDEX tempIndex ON Role(actorId, movieId);

SELECT COUNT(*) FROM Actor A, Role R WHERE A.id = R.actorId;

	-- I was unable to get the CREATE INDEX command to work because Oracle gave out this error message
	--		'unable to extend temp segment by 128 in tablespace SYSTEM'.