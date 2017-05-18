import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;
import java.util.Scanner;

/**
 * GetTeamValues gets all the data stored for a team based on user input of teamId
 *
 * See miaaFantasy.java for more information regarding the key-value structure for the Team table
 *
 * This is a useful, one-table get all information
 *
 * Author: Ethan Clark
 * Date: May 18, 2017
 */
public class GetTeamValues {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter the id of a team: ");
        Integer id = reader.nextInt();

        System.out.println("\nTable: Team");
        System.out.println("ID: " + id.toString());

        Key majorKeyPath = Key.createKey(Arrays.asList("team", id.toString()));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);

        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String path = field.getKey().getMinorPath().get(0);
            String data = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + path + ": " + data);
        }

        store.close();
    }
}
