import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

/** GetMovieActorRoles gets the roles, if any, for which a given actor is cast in a given movie
 *
 * Written by: Ethan Clark
 * Homework 13 - CS342
 * Date: May 10, 2017
 */
public class GetMovieActorRoles {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        LoadDB.loadDatabase(store);

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        System.out.print("Please enter id of actor: ");
        Integer actorId = reader.nextInt();

        System.out.println("\nMovie ID: " + movieId);
        System.out.println("Actor ID: " + actorId);

        Key majorKeyPath = Key.createKey(Arrays.asList("role", actorId.toString(), movieId.toString()));
        Iterator<KeyValueVersion> i = store.storeIterator(Direction.UNORDERED, 0, majorKeyPath, null, null);
        while (i.hasNext()) {
            String role = new String(i.next().getKey().getMinorPath().get(0));
            System.out.println("\t" + role);
        }

        store.close();
    }
}
