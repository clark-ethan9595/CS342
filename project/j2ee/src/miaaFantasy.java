import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

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
}
