-- Lab07_2.sql
-- Ethan Clark
-- CS 342 - Lab07
-- March 17, 2017

-- Exercise 7.2

CREATE MATERIALIZED VIEW Birthday AS
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
	-- still returns only three people, just like it did when it ran before the update query.
	-- This is because I created a regular materialized view, not with the syntax FOR UPDATE after
	-- the view name (I tried doing a FOR UPDATE materialized view but it gave me an error saying
	-- 'updatable materialized views must be simple enough to do fast refresh'. I think I get this error
	-- because I store a derived value age and I concatenate two attributes together.). The regular materailized
	-- view creates a virtual table and runs the query once and stores the results in the virtual table.

-- c.
	INSERT INTO Birthday VALUES ('Ethan Clark', 21, '05-SEP-1995');

	-- I used the query above to try and insert a record into the Birthday view, but it gave
	-- me an error saying 'data manipulation operation not legal on this view'. This error is 
	-- generated because my materialized view is not a FOR UPDATE materialized view. As noted above,
	-- I tried making it a FOR UPDATE one but it generated an error. I believe that this FOR UPDATE
	-- materialized view is what would be needed to allow this to work. I would also need to not
	-- concatenate firstname and lastname into one value, I would need to store birthdate instead of age,
	-- and I would need to store I.D. as well in order for this to work.

	-- This view would allow to for updates.
	CREATE MATERIALIZED VIEW Birthday FOR UPDATE AS
		SELECT P.ID, P.firstName, P.lastName, P.birthdate
		FROM Person P;

	-- And the necessary update query would be...
	INSERT INTO Birthday VALUES (21, 'Ethan', 'Clark', '05-SEP-1995');

-- d.
	DROP MATERIALIZED VIEW Birthday;

	-- Dropping a materialized view does not affect the Person base table in any way.