CS342 Final Project - MIAA Fantasy Database
Ethan Clark
Spring 2017

To gain access to this database, log in to Oracle using system account, run the create.sql script file,
	and the user miaaFantasy will be created with access to this database. The create.sql script file calls
	load.sql, which calls drop.sql, schema.sql and data.sql. You can load in the procedure and the triggers
	through the procedures.sql and triggers.sql script files. Various example queries can be found in queries.sql.

******* See [vision.txt](../../../blob/master/project/vision.txt) for additional features added for the final project deliverable. ********

Previous Project Deliverable Comments Addressed

	Project 1
		- Updated vision statement to reflect all the changes throughout the semester
			- Includes additional features added for final project deliverable

	Project 2
		- Updated ERD to remove the particpates relationship from Users and League.
		- Addressed missing domain contraints on scores and counts as well as foreign keys.
			- Domain Constraints Addressed:
				- Athlete: GPA
				- Team: wins, losses, ties
				- Athlete_Game: points, rebounds, assists, blocks, steals, turnovers
			- Foreign Keys Addressed:
				- Athlete: schoolId
				- Game: homeSchoolId, awaySchoolId
				- Team: userId, leagueId
				- Athlete_Team: athleteId, teamId
				- Athlete_Game: gameId, athleteId
	Project 3
		- Added query that combines inner and outer joins.
		
	Project 4
		- Implemented a proper transaction in my stored procedure with savepoint, lock, commit,
			and rollback.
			- Added EXCEPTION section to catch the raised exceptions and included a WHEN OTHERS
				THEN catch
		- DataPump Loader instructions can be found in readme.txt in the DataPump subdirectory.
		
	Project 5
		- Got the final query (GetTeamAthletes) to work.