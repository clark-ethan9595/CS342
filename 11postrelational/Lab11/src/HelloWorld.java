/*
 * Created by Ethan on 4/21/2017
 * Modified on 4/26/2017
 * Lab 11 and Homework 11
 * CS 342 @ Calvin College
 */
import javax.ws.rs.*;

// The Java class will be hosted at the URI path "/hello"
@Path("/hello")
public class HelloWorld {

    // The Java method will process HTTP GET requests
    @GET
    // The Java method will produce content identified by the MIME Media type "text/plain"
    @Produces("text/plain")
    public String getClichedMessage() {
        // Return some cliched textual content
        return "Hello World";
    }

    /*
     * HTTP GET request to url Lab11_war/hello/api
     * Return the simple message "Getting..."
     */
    @Path("/api")
    @GET
    @Produces("text/plain")
    public String getHomeworkMessage() {
        return "Getting...";
    }

    /*
     * HTTP POST request that posts data/resources (typically for updating resources according to online resources)
     * Receives text/plain and returns text/plain
     * Get the String through PathParam and set it to message parameter
     * Return "Posting: " + message
     */
    @Path("/api/{message}")
    @POST
    @Consumes("text/plain")
    @Produces("text/plain")
    public String postClichedMessage(@PathParam("message") String temp_message) {
        return "Posting: " + temp_message;
    }

    /*
     * HTTP PUT request that puts data/resources (typically for creating resources according to online sources)
     * Receives text/plain and returns text/plain
     * Receive an integer value from the URL string and assign it to temp_int through PathParam
     * Return "Putting: " + temp_int
     */
    @Path("/api/{integer}")
    @PUT
    @Consumes("text/plain")
    @Produces("text/plain")
    public String putClichedMessage(@PathParam("integer") int temp_int) {
        return "Putting: " + temp_int;
    }

    /*
     * HTTP DELETE request that deletes a given integer
     * Receives text/plain and returns text/plain
     * Receive an integer value (to delete) from the URL string and assign it to temp_int
     * Return "Deleting: " + temp_int
     */
    @Path("api/{integer}")
    @DELETE
    @Consumes("text/plain")
    @Produces("text/plain")
    public String deleteIntegerMessage(@PathParam("integer") int temp_int) {
        return "Deleting: " + temp_int;
    }
}
