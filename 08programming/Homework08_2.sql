-- Homework08_2.sql
-- Ethan Clark
-- CS 342 - Homework08
-- April 4, 2017

-- Exercise 2

-- Bacon Number
-- Implement a tool that loads a table (named BaconTable) with records that specify an actor Id and that actor's Bacon Number.
--		An actor's Bacon Number is the length of the shortest path between the actor and Kevin Bacon (KB) in the "co-acting" graph. That
--		is, KB has a Bacon Number of 0; all actors who acted in the same movie as KB have Bacon Number 1; all actors who have acted in
--		the same movie as some actor with Bacon Number 1 but have not acted with Bacon himself have a Bacon Number of 2, etc. Actors who
--		have never acted with anyone with a Bacon Number should not have a record in the table. Stronger solutions will be configured so
--		that the number can be based on any actor, not just Kevin Bacon.