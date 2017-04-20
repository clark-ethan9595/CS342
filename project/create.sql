-- Create the MIAA Fantasy Basketball user and database. 
-- Ethan Clark - CS 342

-- Create the user.

DROP USER miaaFantasy CASCADE;

CREATE USER miaaFantasy 
	IDENTIFIED BY bjarne
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
	TO miaaFantasy;

connect miaaFantasy/bjarne

@load