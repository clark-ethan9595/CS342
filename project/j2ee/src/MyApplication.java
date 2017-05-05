/**
 * Created by Ethan Clark on 5/5/2017.
 * CS 342 - Final Project
 * Extensions Checkpoint
 *
 * Initializes the miaaFantasy class and base path
 */
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


@ApplicationPath("/")
public class MyApplication extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        HashSet h = new HashSet<Class<?>>();
        h.add(miaaFantasy.class);
        return h;
    }
}