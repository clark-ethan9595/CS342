-- lab05_1.sql
-- Exercise 5.1 for Lab05
-- Ethan Clark - CS 342
-- 3/3/2017

-- a.
-- This returns 128 records because it matches every household entry with every person
--		entry. There are 16 person entries and 8 household entries so 8 * 16 = 128.
SELECT * FROM HouseHold, Person;
SELECT COUNT(*) FROM HouseHold, Person;

-- b.
-- This query returns 10 records (6 of the 16 records have NULL birthdate entries) ordered
--		by the day of the year, regardless of year.
--	There are two people with a birth day of November 01 and this query put the individual
--		who is younger ahead of the older individual.
SELECT id, firstName, lastName, birthDate
FROM Person WHERE birthdate IS NOT NULL
ORDER BY TO_CHAR(birthdate, 'DDD');