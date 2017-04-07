-- Homework08_1.sql
-- Ethan Clark
-- CS 342 - Homework08
-- April 4, 2017

-- Exercise 1

-- Auditing
-- Implement a "shadow" log that records every update to the rank of any Movie record. Store your log in a separate table (RankLog) and
--		include the ID of the user who made the change (accessed by using the system constant user), the date of the change (accessed
--		by sysdate) and both the original and the modified ranking values.
CREATE TABLE RankLog (
	userName VARCHAR(30),
	movieId INTEGER,
	change_date DATE,
	originalRank NUMBER(10,2),
	newRank NUMBER(10,2)
);

-- Trigger to record every update to the rank of a record in the Movie table
CREATE OR REPLACE TRIGGER shadow BEFORE UPDATE OF rank ON Movie FOR EACH ROW
BEGIN
	INSERT INTO RankLog VALUES (USER, :OLD.id, SYSDATE, :OLD.rank, :NEW.rank);
END;
/
SHOW ERRORS;

-- Test the newly implemented trigger
UPDATE Movie SET rank = 10 WHERE id = 10920;
SELECT * FROM Movie WHERE id = 10920;

UPDATE Movie SET rank = 8.2 WHERE id = 10920;
SELECT * FROM Movie WHERE id = 10920;

UPDATE Movie SET rank = 9.9 WHERE id = 46169;
SELECT * FROM Movie WHERE id = 46169;

UPDATE Movie SET rank = 8.3 WHERE id = 46169;
SELECT * FROM Movie WHERE id = 46169;

-- See all the updates to the rank attribute of the Movie table
SELECT * FROM RankLog;

-- Drop RankLog table
DROP TABLE RankLog;