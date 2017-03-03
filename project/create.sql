-- Create the MIAA Fantasy Basketball user and database. 
-- Ethan Clark - CS 342

-- Create the user.

DROP USER athlete CASCADE;

CREATE USER athlete 
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
	TO athlete;

-- Connect to the user's account/schema.
CONNECT athlete/elc3;

-- Create the database.
DEFINE athlete=S:\CS342\project
@&athlete\load