import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/** GetTableValues gets the basic field values from the Movie table
 *
 * Written by: Ethan Clark
 * Homework 13 - CS342
 * Date: May 10, 2017
 */
public class GetTableValues {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        LoadDB.loadDatabase(store);

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of movie: ");
        Integer id = reader.nextInt();

        System.out.println("\nTable: movie");
        System.out.println("ID: " + id.toString());

        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", id.toString()));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String temp = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + temp);
        }

        store.close();
    }
}
