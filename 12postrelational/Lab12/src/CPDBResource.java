import models.Household;
import models.Person;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * This stateless session bean serves as a RESTful resource handler for the CPDB.
 * It uses a container-managed entity manager.
 *
 * @author kvlinden
 * @version Spring, 2017
 */
@Stateless
@Path("cpdb")
public class CPDBResource {

    /**
     * JPA creates and maintains a managed entity manager with an integrated JTA that we can inject here.
     *     E.g., http://wiki.eclipse.org/EclipseLink/Examples/REST/GettingStarted
     */
    @PersistenceContext
    private EntityManager em;

    /**
     * GET a default message.
     *
     * @return a static hello-world message
     */
    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getClichedMessage() {
        return "Hello, JPA!";
    }

    /**
     * GET an individual person record.
     *
     * @param id the ID of the person to retrieve
     * @return a person record
     */
    @GET
    @Path("person/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Person getPerson(@PathParam("id") long id) {
        return em.find(Person.class, id);
    }

    /**
     * GET all people using the criteria query API.
     * This could be refactored to use a JPQL query, but this entitymanager-based approach
     * is consistent with the other handlers.
     *
     * @return a list of all person records
     */
    @GET
    @Path("people")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Person> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Person.class)).getResultList();
    }

    /**
     * PUT (modify) person with id x (from URL) and the passed person object
     * Returns the same person object
     *
     * Written by: Ethan Clark (elc3)
     * CS 342 - Homework11
     * May 3, 2017
     */
    @PUT
    @Path("person/{x}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Person putPerson(@PathParam("x") long temp_id, Person person) {
        Person tempPerson = em.find(Person.class, temp_id);
        if (tempPerson != null) {
            em.merge(person);
        }
        return person;
    }

    /**
     * POST (insert) person using information from the request
     * Return the person that was posted into the database
     *
     * Written by: Ethan Clark (elc3)
     * CS 342 - Homework11
     * May 3, 2017
     */
    @POST
    @Path("people")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Person postPerson(Person person) {
        Person tempPerson = new Person();
        person.setId(tempPerson.getId());
        person.setHousehold(em.find(Household.class, person.getHousehold().getId()));
        em.persist(person);
        return person;
    }

    /**
     * DELETE person with id x from URL.
     * Return the person that was deleted, if that person was in the database
     *
     * Written by: Ethan Clark (elc3)
     * CS 342 - Homework11
     * May 3, 2017
     */
    @DELETE
    @Path("person/{x}")
    @Produces(MediaType.APPLICATION_JSON)
    public Person deletePerson(@PathParam("x") long temp_id) {
        Person person = em.find(Person.class, temp_id);
        if (person != null) {
            em.remove(person);
        }
        return person;
    }

}
