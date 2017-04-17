-- Homework10.sql
-- Ethan Clark
-- CS 342 - Homework 10
-- April 17, 2017

-- Write a PL/SQL procedure that receives two movie IDs and an integer amount and “transfers” a given amount of rank value from a source
--		movie to a destination movie. Note that this doesn’t make much sense in the context of the movie database, but it’s similar to
--		money transfers in a banking database.

-- Your procedure should be designed in such a way that it can be run simultaneously by the following sample script to separate threads
--		and still give a consistent result.

-- Your procedure should check the values it receives, raising exceptions as appropriate.
-- Don’t allow the rank value to drop below 0.
-- To make your transaction logic explicit, please use declared exceptions as follows.