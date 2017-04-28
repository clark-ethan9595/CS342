/**
 * Created by Ethan Clark on 4/21/2017
 * Lab 12
 * CS 342 @ Calvin College
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
        h.add(CPDBResource.class);
        return h;
    }
}
