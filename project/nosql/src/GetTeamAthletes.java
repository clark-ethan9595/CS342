import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

/**
 * GetTeamAthletes.java gets all the athletes on a given team
 *
 * See miaaFantasy.java for more information regarding the key-value structure for the Athlete_Team table
 *
 * This is a useful, two-table join
 *
 * Author: Ethan Clark (elc3)
 * Date: May 12, 2017
 */
public class GetTeamAthletes {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Scanner reader = new Scanner(System.in);
        System.out.print("Please enter id of a fantasy team: ");
        Integer teamId = reader.nextInt();

        System.out.println("Fantasy Team ID: " + teamId);

        Key majorKeyPath = Key.createKey(Arrays.asList("athleteTeam", teamId.toString()));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, majorKeyPath, null, null);

        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String athlete = field.getKey().getMinorPath().get(0);
            String athleteId = new String(field.getValue().getValue().getValue());
            System.out.println("\t" + athleteId + "\t" + getNamesofAthlete(athleteId, store) + "\t" + athlete);
        }

        store.close();
    }

    public static String getNamesofAthlete(String athleteId, KVStore store) {
        String fullname = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("athlete", athleteId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("firstName")) {
                fullname += new String(field.getValue().getValue().getValue());
            }
            if (field.getKey().getMinorPath().get(0).equals("lastName")) {
                fullname += " " + new String(field.getValue().getValue().getValue());
            }
        }
        return fullname;
    }
}
