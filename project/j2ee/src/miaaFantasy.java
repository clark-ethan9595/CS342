import model.Athlete;
import model.League;
import model.Team;
import model.Users;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by Ethan Clark on 5/5/2017.
 * CS 342 - Final Project
 * Extensions Checkpoint
 *
 * Stateless session serves as a RESTful resource handler for the miaaFantasy database
 * It uses a container-managed entity manager
 */

@Stateless
@Path("miaa")
public class miaaFantasy {

    @PersistenceContext
    private EntityManager em;

    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getIntroductionMessage() {
        return "Hello! Welcome to the miaaFantasy database web service!";
    }

    @GET
    @Path("athlete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Athlete getAthlete(@PathParam("id") long id) {
        return em.find(Athlete.class, id);
    }

    @GET
    @Path("athletes")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Athlete> getAthletes() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Athlete.class)).getResultList();
    }

    @GET
    @Path("fantasyTeam/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Team getTeam(@PathParam("id") long id) {
        return em.find(Team.class, id);
    }

    @GET
    @Path("fantasyTeams")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Team> getTeams() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Team.class)).getResultList();
    }

    @GET
    @Path("leagues")
    @Produces(MediaType.APPLICATION_JSON)
    public List<League> getLeagues() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(League.class)).getResultList();
    }

    @GET
    @Path("users")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Users> getUsers() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Users.class)).getResultList();
    }

}
