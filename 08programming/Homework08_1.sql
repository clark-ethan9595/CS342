-- Homework08_1.sql
-- Ethan Clark
-- CS 342 - Homework08
-- April 3, 2017

-- Exercise 1

-- Auditing
-- Implement a "shadow" log that records every update to the rank of any Movie record. Store your log in a separate table (RankLog) and
--		include the ID of the user who made the change (accessed by using the system constant user), the date of the change (accessed
--		by sysdate) and both the original and the modified ranking values.

