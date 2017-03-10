-- Lab06_2.sql
-- Ethan Clark
-- CS 342 - Lab06
-- March 10, 2017

-- Exercise 6.2
-- a.
-- Yes, this aggregate function does group the entire Person table in the FROM clause.
-- Aggregate functions in the select clause are applied to all of the rows in the queried table.
--		So we are not grouping by a particular attribute, but rather by the queried table/view.
SELECT AVG(TRUNC(MONTHS_BETWEEN(sysdate, P.birthdate)/12)) AS Average_Age
FROM Person P;

-- b.
SELECT HH.ID, COUNT(P.ID) AS total
FROM HouseHold HH, Person P
WHERE HH.city = 'Grand Rapids' AND P.householdID = HH.ID
GROUP BY HH.ID
HAVING COUNT(P.ID) >= 2
ORDER BY total DESC;

-- c.
SELECT HH.ID, HH.phoneNumber, COUNT(P.ID) AS total
FROM HouseHold HH, Person P
WHERE HH.city = 'Grand Rapids' AND P.householdID = HH.ID
GROUP BY HH.ID, HH.phoneNumber
HAVING COUNT(P.ID) >= 2
ORDER BY total DESC;