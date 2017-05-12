import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/** GetMovieActorRoles gets the roles, if any, for which a given actor is cast in a given movie
 *
 * See LoadDB.java for more information on how data is stored for the role table records.
 *
 * Written by: Ethan Clark
 * Homework 13 - CS342
 * Date: May 10, 2017
 */
public class GetMovieActorRoles {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        System.out.print("Please enter id of actor: ");
        Integer actorId = reader.nextInt();

        System.out.println("\nMovie ID: " + movieId);
        System.out.println("Actor ID: " + actorId);

        Key majorKeyPath = Key.createKey(Arrays.asList("role", movieId.toString()));

        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String roleName = field.getKey().getMinorPath().get(0);
            String actorIdValue = new String(field.getValue().getValue().getValue());
            if (actorIdValue.equals(actorId.toString())) {
                System.out.println("\t" + roleName);
            }
        }

        store.close();
    }
}
