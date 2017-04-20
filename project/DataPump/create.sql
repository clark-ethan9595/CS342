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
	CREATE ANY DIRECTORY,
	DROP ANY DIRECTORY,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	PLUSTRACE,
	UNLIMITED TABLESPACE
	TO miaaFantasy;

-- Set up the Oracle directory for the dump database feature.
-- Use Oracle directories for input/output files to avoid permissions problems. (?)
-- This is needed both to create and to load the *.dmp files.
DROP DIRECTORY exp_dir;
CREATE DIRECTORY exp_dir AS 'C:\Users\elc3\Documents\project';
GRANT READ, WRITE ON DIRECTORY exp_dir TO miaaFantasy;

-- Load the database from the dump file using:
-- impdp miaaFantasy/bjarne parfile=miaaFantasy.par