-- Lab06_1.sql
-- Ethan Clark
-- CS 342 - Lab06
-- March 10, 2017

-- Exercise 6.1
-- a.
SELECT T.name, T.mandate, PT.personID
FROM Team T LEFT OUTER JOIN PersonTeam PT
ON PT.role = 'chair' AND T.name = PT.teamName;