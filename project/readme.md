CS342 Final Project - MIAA Fantasy Database
Ethan Clark
Spring 2017

To gain access to this database, log in to Oracle using system account, run the create.sql file,
	and the user miaaFantasy will be created with access to this database.

******* See [vision.txt](../../../blob/master/project/vision.txt) for the additional features added for the final project deliverable. ********

Previous Project Deliverable Comments Addressed

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