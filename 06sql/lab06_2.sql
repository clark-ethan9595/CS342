-- Lab06_2.sql
-- Ethan Clark
-- CS 342 - Lab06
-- March 10, 2017

-- Exercise 6.2
-- a.
-- Yes, this aggregate function does group by birthdate.
--
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