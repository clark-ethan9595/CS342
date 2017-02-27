-- Create the Calvin Student-Athlete user and database. 
-- Ethan Clark - CS 342

-- Create the user.

DROP USER studathlete CASCADE;

CREATE USER studathlete 
	IDENTIFIED BY elc3
	QUOTA 5M ON System;

GRANT 
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	UNLIMITED TABLESPACE
	TO cpdb;

-- Connect to the user's account/schema.
CONNECT studathlete/elc3;

-- Create the database.
DEFINE studathlete=S:\CS342\project
@&studathlete\load