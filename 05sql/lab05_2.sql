-- lab05_2.sql
-- Exercise 5.2 for Lab05
-- Ethan Clark - CS 342
-- 3/3/2017

-- a.
-- The youngest person in the database is Susan Heerema, born on 01-NOV-97.
SELECT id, firstName, lastName, birthDate
FROM (SELECT * FROM Person WHERE birthDate IS NOT NULL ORDER BY birthDate DESC)
WHERE ROWNUM = 1;

-- I was not able to think or figure out how to do the subquery of this without
--		using the Max() function.
-- This nested query is not correlated because it does not depend on anything
--		from the outer query (i.e. the inner query could run on its own and then
--		we could run the outer query from the result of the inner query.)
SELECT P.id, P.firstName, P.lastName, P.birthDate
FROM Person P
WHERE birthDate = (SELECT Max(birthDate) FROM Person);
	
-- b.
-- When there are three people with the same name, this query returns every combination of
--		those individuals only once. So with person1, person2, and person3, the query returns:
--			person1, person2
--			person3, person1
--			person2, person3
--		It returns n entries, where n is the number of people with the same name.
SELECT P1.id, P1.firstName, P1.lastName, P2.id, P2.firstName, P2.lastName
FROM Person P1, Person P2
WHERE P1.firstName = P2.firstName AND P1.lastName != P2.lastName AND P1.ID < P2.ID;

-- c.
-- These queries both return one person, Allen Nicole, who is on the Music team
--		but not in the Byl homegroup.
-- This nested select query is correlated because the inner select depends on the
--		outer select Person P table.
SELECT P.firstName, P.lastName
FROM Person P, PersonTeam PT
WHERE PT.teamName = 'Music' AND PT.personID = P.ID AND NOT EXISTS
	(SELECT * FROM HomeGroup H WHERE P.homeGroupID = H.ID AND H.name = 'Byl');
	
(SELECT P.firstName, P.lastName
FROM Person P, PersonTeam PT
WHERE P.ID = PT.personID AND PT.teamName = 'Music')
MINUS
(SELECT P.firstName, P.lastName
FROM Person P, HomeGroup H
WHERE P.homeGroupID = H.ID AND H.name = 'Byl');