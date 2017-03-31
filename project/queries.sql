-- queries.sql contains a set of queries that will be useful for my system
-- CS 342 - Final Project
-- Ethan Clark (elc3)
-- March 31, 2017


-- QUERY 1
-- This query returns the average statistics for all the athletes in the database, ordered by athleteId number and grouped by school.
--		The users of the fantasy league would care about these results when they are drafting players to be on their fantasy team.
--
-- This query makes use of aggregate functions and inner joins.
SELECT A.athleteId, S.name, A.lastName, COUNT(AG.points) AS Games_Played, TRUNC(AVG(AG.points), 1) AS PPG, TRUNC(AVG(AG.rebounds), 1) AS RPG,
		TRUNC(AVG(AG.assists), 1) AS APG, TRUNC(AVG(AG.steals), 1) AS SPG, TRUNC(AVG(AG.blocks), 1) AS BPG, TRUNC(AVG(AG.turnovers), 1) AS TPG
FROM Athlete_Game AG, Athlete A, School S
WHERE AG.athleteId = A.athleteId AND A.schoolId = S.schoolId
GROUP BY A.athleteId, A.lastName, S.name
ORDER BY A.athleteId;
-- I do not think there is another way that this query can be written.


-- QUERY 2
-- This query shows all the athletes that belong to a fantasy team along with the user's username, the user's team name, 
--		the league name for that team, the athlete's first and last name, and the school the athlete goes to.
--
-- Fantasy league users (and maybe the league administrator) would care to use this query to view all the athletes that are
--		on a fantasy team within a given league.
--
-- This query joins six tables together to get the desired results.
SELECT U.userName, T.teamName, L.leagueName, A.firstName, A.lastName, S.name
FROM Users U, Team T, Athlete_Team AT1, League L, Athlete A, School S
WHERE U.userId = T.userId AND T.leagueId = L.leagueId
AND AT1.teamId = T.teamId AND AT1.athleteId = A.athleteId
AND A.schoolId = S.schoolId;
-- This query could probably be written in different ways using different kinds of joins. I choose to write it this way
--		for simplicity sake.


-- QUERY 3
-- This query returns all the athletes who are not part of any fantasy team in any league.
--
-- League administrators and users would like to use this query to give out statistics about
--		which players are not part of a fantasy team in any league.
--
-- This query needs a nested select statement to find the players not in the result set of all
--		players that belong to a fantasy team.
SELECT athleteId, firstName, lastName
FROM Athlete
WHERE athleteId NOT IN (
	SELECT A.athleteId
	FROM Athlete_Team AT, Athlete A
	WHERE AT.athleteId = A.athleteId
)
ORDER BY athleteId;
-- I think that using a sub select to get all of the athletes on a fantasy team and then finding the athletes NOT IN
--		that result is the only way to do this query.


-- QUERY 4
-- This query simply returns the number of games each athlete has played.
--
-- This query would be important to both fantasy league users and potentially for
--		the basketball teams in the MIAA conference.
--
-- This query uses proper comparison of NULL values (IS NOT NULL) and uses inner joins.
SELECT A.athleteId, A.lastName, COUNT(*) AS Games_Played
FROM Athlete A, Athlete_Game AG
WHERE A.athleteId = AG.athleteId AND AG.points IS NOT NULL
GROUP BY A.athleteId, A.lastName
ORDER BY COUNT(*) DESC;
-- This query could be written using any comparison of AG.points, AG.rebounds, AG.steals, etc. because
--		they are all NULL values when an athlete does not play in a game. So it really does not matter
--		which of those attributes I choose to compare with NULL.


-- QUERY 5
-- This query returns all the fantasy team information for each league, even if the team is not in a
--		league yet, in order of team's record (going by wins first, then ties).
--
-- This query is important for users to see which fantasy team is winning its league, as well as seeing which teams need
--		to join a league.
--
-- This query utilizes a LEFT OUTER JOIN so that even though a team may not be a part of a league yet, it will still show
-- 		up in this query result set (i.e. team with ID 21 has no league, but still shows up in the results).
SELECT L.leagueName, T.teamName, T.wins, T.losses, T.ties
FROM Team T LEFT OUTER JOIN League L ON T.leagueId = L.leagueId
ORDER BY L.leagueId, T.wins DESC, T.ties DESC;
-- I think this is the only way to do this query because a LEFT OUTER JOIN is necessary to show the teams
--		that are not in a league yet.


-- QUERY 6
-- This query returns a pair of athletes on the same team that both average at least 30 points per game.
--
-- This query would be important to users who want to know if any school has a pair of good athletes on their team.
--
-- This query uses a lot of different things. It uses TRUNC and AVG aggregate functions, a self-join of the athlete table, inner joins,
--		and two HAVING clauses to work with the aggregate functions.
SELECT A1.firstName, A1.lastName, TRUNC(AVG(AG1.points), 1) AS PPG, A2.firstName, A2.lastName, TRUNC(AVG(AG2.points), 1) AS PPG, S.name
FROM Athlete A1, Athlete A2, School S, Athlete_Game AG1, Athlete_Game AG2
WHERE A1.schoolId = A2.schoolId AND A1.schoolId = S.schoolId AND A1.athleteId = AG1.athleteId
AND A2.athleteId = AG2.athleteId AND A1.athleteId > A2.athleteId
HAVING AVG(AG1.points) >= 30 AND AVG(AG2.points) >= 30
GROUP BY A1.firstName, A1.lastName, A2.firstName, A2.lastName, A2.position, S.name;
-- I think this is the only reasonable way to go about solving this type of query problem.


-- View 1
-- This view provides a quick view of each user and their fantasy team information, including
--		those users that do not have a fantasy team yet.
--
-- The fantasy league administrators would use this view in order to see which users need to create a team and
--		join a league to get started.
--
-- I created this view as a non-materialized view because updates should happen to the base tables, so then this
--		view would simply rerun the view query to get the updated information. All of the information in this table
--		should get updated through the base tables it comes froms, not the view itself.
CREATE VIEW teamUser AS
	SELECT U.userName, T.teamName, T.wins, T.losses, T.ties
	FROM Users U LEFT OUTER JOIN Team T ON U.userId = T.userId;