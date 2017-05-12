Answers for noSQL project
Ethan Clark
CS 342 - Final Project
May 12, 2017

I think that for my database, this key-value system of KVLite is okay for storing my database application. Potentially I think
      that a document noSQL database type might be a little bit better because documents do not have to have the same exact
      information in each one, so I think that may come in handy a little bit. But, other than that, I think that the key-value
      structure works fine for storing tables like Athlete and Team that store its information, but are very tricky to work with
      for the Athlete_Team table that implements the many-to-many relationship between Athlete and Team.

/*******************ATHLETE TABLE************************/
getAthletes has the following key-value structure for storing athletes:
      /athlete/{athleteId}/-/firstName/{firstName}
      /athlete/{athleteId}/-/lastName/{lastName}
      /athlete/{athleteId}/-/city/{city}
      /athlete/{athleteId}/-/state/{state}
      /athlete/{athleteId}/-/position/{position
This key-value structure will allow me to get all the information for a given athlete at any time I want.
      I use this key-value structure to query to get all information for one specific athlete (getAthleteValues)
      and for getting the first and last name for a specific athlete (getTeamAthletes).

/******************TEAM TABLE*****************************/
getTeams has the following the key-value structure for storing fantasy teams:
      /team/{teamId}/-/teamName/{teamName}
      /team/{teamId}/-/wins/{wins}
      /team/{teamId}/-/losses/{losses}
      /team/{teamId}/-/ties/{ties}
This key-value structure will allow me to get the necessary information needed for sorting all the team
      records by number of wins (GetSortedTeams).

/*****************ATHLETE_TEAM TABLE***********************/
getAthleteTeam has the following key-value structure for storing the Athlete_Team records
      /athleteTeam/{teamId}/-/athlete/{athleteId}
 This key-value structure is not working quite yet. I cannot get the GetTeamAthletes to show all of the athletes
      on a given fantasy team. I think it has to do with the storing of these records is somehow overwriting some
      /athleteTeam/ major key. I will work on this more to finish it up by the final project due date.