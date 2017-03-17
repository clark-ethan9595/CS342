-- Lab07_1.sql
-- Ethan Clark
-- Lab 7 - CS342
-- March 17, 2017

-- Exercise 7.1

CREATE VIEW Birthday AS
	SELECT P.firstName || ' ' || P.lastName AS Fullname,
		TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) AS Age, P.birthdate
	FROM Person P;

-- a.
	-- The EXTRACT() function extracts just the year component of a date attribute, which
	--		allows me to compare the years as integers using <= and >= operators.
	
	SELECT Fullname FROM Birthday
	WHERE EXTRACT(year FROM birthdate) >= 1961 AND EXTRACT(year FROM birthdate) <= 1975;

-- b.
	UPDATE Person SET birthdate = '05-DEC-1969' WHERE id = 8;

	-- I used the above query to update the Person base table to include a GenX birthdate
	-- from someone who previously had a NULL birthdate before and found that the query from part a
	-- now returns 4 people (including the person I just updated) instead of only three.
	-- This is because the view I created is using query modification, which runs the CREATE
	-- VIEW query each time it needs to access that view, so it accessed the updated Person
	-- table.

-- c.
	INSERT INTO Birthday VALUES ('Ethan Clark', 21, '05-SEP-1995');

	-- Inserting into this view is not allowed. First off, it gives an error that says
	-- "virtual column not allowed here" which according to the internet is because I
	-- am trying to insert into a calculated attribute (i.e. the age column). I think
	-- we would have to get rid of the calculated age column, as well as add updates to
	-- the CREATE VIEW query to make it a materialized view with the syntax:
	--		CREATE MATERIALIZED VIEW ... FOR UPDATE AS ...
	-- The fields in the base table that are not in the view will be filled with NULL 
	-- values when an entry is inserted into the materialized view. We would also have
	-- to do something probably with the concatenated fullname because there is no full 
	-- name attribute in the Person table, it would somehow need to get broken into a
	-- first and last name or we would just have to store the names separately.

-- d.
	DROP VIEW Birthday;
	
	-- Dropping a view does not affect the Person base table in any way.