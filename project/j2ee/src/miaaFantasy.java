import model.*;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by Ethan Clark on 5/5/2017.
 * CS 342 - Final Project
 * Extensions Checkpoint
 *
 * Stateless session serves as a RESTful resource handler for the miaaFantasy database
 * It uses a container-managed entity manager
 *
 * See readme.txt in this j2ee directory for more information regarding what data gets served
 *      up through this RESTful web service.
 */

@Stateless
@Path("miaa")
public class miaaFantasy {

    @PersistenceContext
    private EntityManager em;

    /**********************************************************/
    /************ GETS Section of HTTP Requests ***************/
    /**********************************************************/

    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getIntroductionMessage() {
        return "Hello! Welcome to the miaaFantasy database web service!";
    }

    // Get a specific athlete from the database
    @GET
    @Path("athlete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Athlete getAthlete(@PathParam("id") long id) {
        return em.find(Athlete.class, id);
    }

    // Get all the athletes from the database
    @GET
    @Path("athletes")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Athlete> getAthletes() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Athlete.class)).getResultList();
    }

    // Get a specific fantasyTeam from the database
    @GET
    @Path("fantasyTeam/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team getTeam(@PathParam("id") long id) {
        return em.find(Team.class, id);
    }

    // Get all the fantasyTeams from the database
    @GET
    @Path("fantasyTeams")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Team> getTeams() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Team.class)).getResultList();
    }

    // Get a specific league from the database
    @GET
    @Path("league/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public League getLeague(@PathParam("id") long id) {
        return em.find(League.class, id);
    }

    // Get all the leagues from the database
    @GET
    @Path("leagues")
    @Produces(MediaType.APPLICATION_JSON)
    public List<League> getLeagues() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(League.class)).getResultList();
    }

    // Get a specific user from the database
    @GET
    @Path("user/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Users getUser(@PathParam("id") long id) {
        return em.find(Users.class, id);
    }

    // Get all the users from the database
    @GET
    @Path("users")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Users> getUsers() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Users.class)).getResultList();
    }

    // Get a specific school from the database
    @GET
    @Path("school/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public School getSchool(@PathParam("id") long id) {
        return em.find(School.class, id);
    }

    // Get all the schools from the database
    @GET
    @Path("schools")
    @Produces(MediaType.APPLICATION_JSON)
    public List<School> getSchools() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(School.class)).getResultList();
    }

    /**********************************************************/
    /*********** POSTS Section of HTTP Requests ***************/
    /**********************************************************/

    // Add a new athlete to the database
    @POST
    @Path("athletes")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Athlete postAthlete(Athlete athlete) {
        Athlete tempAthlete = new Athlete();
        athlete.setAthleteid(tempAthlete.getAthleteid());
        athlete.setSchool_name(em.find(School.class, athlete.getSchool_name().getSchoolid()));
        em.persist(athlete);
        return athlete;
    }

    // Add a new fantasyTeam to the database
    @POST
    @Path("fantasyTeams")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Team postTeam(Team team) {
        Team tempTeam = new Team();
        team.setTeamid(tempTeam.getTeamid());
        team.setLeague(em.find(League.class, team.getLeague().getLeagueid()));
        em.persist(team);
        return team;
    }

    // Add a new league to the database
    @POST
    @Path("leagues")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public League postLeague(League league) {
        League tempLeague = new League();
        league.setLeagueid(tempLeague.getLeagueid());
        em.persist(league);
        return league;
    }

    // Add a new user to the database
    @POST
    @Path("users")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Users postUser(Users user) {
        Users tempUser = new Users();
        user.setUserid(tempUser.getUserid());
        em.persist(user);
        return user;
    }

    // Add a new school to the database
    @POST
    @Path("schools")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public School postSchool(School school) {
        School tempSchool = new School();
        school.setSchoolid(tempSchool.getSchoolid());
        em.persist(school);
        return school;
    }

    /**********************************************************/
    /************ PUTS Section of HTTP Requests ***************/
    /**********************************************************/

    // Modify an existing athlete in the database
    @PUT
    @Path("athlete/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Athlete putAthlete(@PathParam("id") long id, Athlete athlete) {
        Athlete tempAthlete = em.find(Athlete.class, id);
        if (tempAthlete != null) {
            athlete.setSchool_name(em.find(School.class, athlete.getSchool_name().getSchoolid()));
            em.merge(athlete);
        }
        return athlete;
    }

    // Modify an existing fantasyTeam in the database
    @PUT
    @Path("fantasyTeam/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Team putTeam(@PathParam("id") long id, Team team) {
        Team tempTeam = em.find(Team.class, id);
        if (tempTeam != null) {
            team.setLeague(em.find(League.class, team.getLeague().getLeagueid()));
            em.merge(team);
        }
        return team;
    }

    // Modify an existing league in the database
    @PUT
    @Path("league/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public League putLeague(@PathParam("id") long id, League league) {
        League tempLeague = em.find(League.class, id);
        if (tempLeague != null) {
            em.merge(league);
        }
        return league;
    }

    // Modify an existing user in the database
    @PUT
    @Path("user/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Users putUser(@PathParam("id") long id, Users user) {
        Users tempUser = em.find(Users.class, id);
        if (tempUser != null) {
            em.merge(user);
        }
        return user;
    }

    // Modify an existing school in the database
    @PUT
    @Path("school/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public School putSchool(@PathParam("id") long id, School school) {
        School tempSchool = em.find(School.class, id);
        if (tempSchool != null) {
            em.merge(school);
        }
        return school;
    }

    /**********************************************************/
    /********** DELETES Section of HTTP Requests **************/
    /**********************************************************/

    // Remove an athlete from the database
    @DELETE
    @Path("athlete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Athlete deleteAthlete(@PathParam("id") long id) {
        Athlete athlete = em.find(Athlete.class, id);
        if (athlete != null) {
            em.remove(athlete);
        }
        return athlete;
    }

    // Remove a fantasyTeam from the database
    @DELETE
    @Path("fantasyTeam/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team deleteTeam(@PathParam("id") long id) {
        Team team = em.find(Team.class, id);
        if (team != null) {
            em.remove(team);
        }
        return team;
    }

    // Remove a league from the database
    @DELETE
    @Path("league/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public League deleteLeague(@PathParam("id") long id) {
        League league = em.find(League.class, id);
        if (league != null) {
            em.remove(league);
        }
        return league;
    }

    // Remove a user from the database
    @DELETE
    @Path("user/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Users deleteUser(@PathParam("id") long id) {
        Users user = em.find(Users.class, id);
        if (user != null) {
            em.remove(user);
        }
        return user;
    }

    // Remove a school from the database
    @DELETE
    @Path("school/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public School deleteSchool(@PathParam("id") long id) {
        School school = em.find(School.class, id);
        if (school != null) {
            em.remove(school);
        }
        return school;
    }
}
