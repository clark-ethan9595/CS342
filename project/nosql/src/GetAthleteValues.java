import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/**
 * GetAthleteValues gets all the data stored for an athlete based on user input of athleteId
 *
 * Author: Ethan Clark
 * Date: May 12, 2017
 */
public class GetAthleteValues {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter the id of an athlete: ");
        Integer id = reader.nextInt();

        System.out.println("\nTable: Athlete");
        System.out.println("ID: " + id.toString());

        Key majorKeyPath = Key.createKey(Arrays.asList("athlete", id.toString()));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);

        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String path = field.getKey().getMinorPath().get(0);
            String data = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + path + ": " + data);
        }

        store.close();
    }
}
