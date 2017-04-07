-- lab08_2.sql
-- Ethan Clark
-- CS342 - Lab08
-- April 5, 2017

-- Exercise 8.2

-- Insert your results into this table.
CREATE TABLE SequelsTemp (
  id INTEGER,
  name varchar2(100),
  PRIMARY KEY (id)
 );
 
 -- Create procedure getSequels to find all sequels of a given movie
CREATE OR REPLACE PROCEDURE getSequels (movieIdIn IN Movie.id%type) AS
-- Create temp cursor to iterate through the sequelIds
CURSOR temp IS
	SELECT sequelId FROM Movie WHERE id = movieIdIn;

-- Begin procedure code
BEGIN

	-- Remove all entries from the SequelsTemp table
	DELETE FROM SequelsTemp;

	-- Loop through the results from the temp cursor
	--		Recursively call getSequels on the sequel found
	--		Insert result into SequelsTemp
	FOR sequel IN temp LOOP
			getSequels(sequel.sequelId);
			INSERT INTO SequelsTemp (SELECT id, name FROM Movie WHERE id = sequel.sequelId);
	END LOOP;
END;
/
SHOW ERRORS;

-- Get the sequels for Ocean's 11, i.e., 4 of them.
BEGIN  getSequels(238071);  END;
/
SELECT * FROM SequelsTemp;

-- Get the sequels for Ocean's Fourteen, i.e., none.
BEGIN  getSequels(238075);  END;
/
SELECT * FROM SequelsTemp;

-- Clean up.
DROP TABLE SequelsTemp;