Key Accomplishments for J2EE Part of Final Project
Ethan Clark
CS 342

The Athlete table has a OneToMany relationship with School.
    This means that the information for an athlete's school will appear in their JSON object along with
    the rest of the Athlete information.
The Team table has a OneToMany relationship with League and a ManyToMany relationship with Athletes.
    This means that the information for a team's league will appear in their JSON object and all the team's
    athletes will appear in a JSON array in their JSON object along with the rest of the Team information.

There are GET requests for the following things:
    1. Specific athlete
    2. All athletes
    3. Specific fantasyTeam
    4. All fantasyTeams
    5. Specific League
    6. All Leagues
    7. Specific User
    8. All Users
    9. Specific School
    10. All schools

There are POST requests for the following things:
    1. New athlete
    2. New fantasyTeam
    3. New League
    4. New User
    5. New School

There are PUT requests for the following things:
    1. Modify athlete
    2. Modify fantasyTeam
    3. Modify League
    4. Modify User
    5. Modify School

There are DELETE requests for the following things:
    1. Remove athlete
    2. Remove fantasyTeam
    3. Remove League
    4. Remove User
    5. Remove School