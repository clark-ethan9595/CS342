import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/** GetMovieActors gets the actors if any, who are cast in a given movie
 *
 * Written by: Ethan Clark
 * Homework 13 - CS342
 * Date: May 10, 2017
 */

public class GetMovieActors {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer movieId = reader.nextInt();

        System.out.println("Movie ID: " + movieId);

        Key majorKeyPath = Key.createKey(Arrays.asList("role", movieId.toString()));

        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String roleName = field.getKey().getMinorPath().get(0);
            String actorId = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + actorId + "\t" + getNamesOfActor(actorId, store) + "\t" + roleName);
        }

        store.close();
    }

    public static String getNamesOfActor(String actorId, KVStore store) {
        String fullname = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("actor", actorId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            fullname += " " + new String(field.getValue().getValue().getValue());
        }
        return fullname;
    }
}
