-- queries.sql contains a set of queries that will be useful for my system
-- CS 342 - Final Project
-- Ethan Clark (elc3)
-- March 27, 2017


-- This query uses two aggregate functions (TRUNC and AVG) to calculate the average statistics for each player.
-- 		It (inner) joins the athlete table with the athlete_game table.
-- 		We need to group by athleteId and lastName because those are both not aggregate functions in the select clause.
-- 		We order by athleteId (default ascending) which will group the players by school.
SELECT A.athleteId, A.lastName, TRUNC(AVG(AG.points), 1) AS PPG, TRUNC(AVG(AG.rebounds), 1) AS RPG, TRUNC(AVG(AG.assists), 1) AS APG,
		TRUNC(AVG(AG.steals), 1) AS SPG, TRUNC(AVG(AG.blocks), 1) AS BPG, TRUNC(AVG(AG.turnovers), 1) AS TPG
FROM Athlete_Game AG, Athlete A
WHERE AG.athleteId = A.athleteId
GROUP BY A.athleteId, A.lastName
ORDER BY A.athleteId;


-- This query shows all the athletes that belong to a fantasy team along with:
-- 		the User's username, the User's team name, the Team's league name, the
-- 		athlete's first and last name, and the school the athlete goes to.
-- 		This query needed to join six different tables to get the necessary information.
SELECT U.userName, T.teamName, L.leagueName, A.firstName, A.lastName, S.name
FROM Users U, Team T, Athlete_Team AT, League L, Athlete A, School S
WHERE U.userId = T.userId AND T.leagueId = L.leagueId
AND AT.teamId = T.teamId AND AT.athleteId = A.athleteId
AND A.schoolId = S.schoolId;


-- This query returns all the athletes who are not part of a fantasy team.
-- 		This query needs a nested select statement and it is not correlated, meaning
-- 		I could run the inner query first and then run the outer query on the results of the
-- 		inner query.
SELECT athleteId
FROM Athlete
WHERE athleteId NOT IN (
	SELECT A.athleteId
	FROM Athlete_Team AT, Athlete A
	WHERE AT.athleteId = A.athleteId
)
ORDER BY athleteId;


-- This query returns the athletes who have not played at least one game
-- 		(i.e. they have NULL values in their game data). This query needs
-- 		the use of IS NULL to compare to a NULL value.
SELECT DISTINCT A.athleteId, A.firstName, A.lastName, AG.gameId
FROM Athlete A, Athlete_Game AG
WHERE A.athleteId = AG.athleteId AND AG.points IS NULL;


SELECT A.athleteId, A.lastName, COUNT(*)
FROM Athlete A, Athlete_Game AG
WHERE A.athleteId = AG.athleteId AND AG.points IS NOT NULL
GROUP BY A.athleteId, A.lastName
ORDER BY COUNT(*) DESC;