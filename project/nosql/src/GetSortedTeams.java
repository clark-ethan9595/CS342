import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;

/**
 * GetSortedTeams.java sorts all the FantasyTeams in the database based on number of wins
 *
 * See miaaFantasy.java for more information regarding the key-value structure for the Team table
 *
 * This is a useful, ordered list
 *
 * Author: Ethan Clark (elc3)
 * Date: May 12, 2017
 */
public class GetSortedTeams {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<List<String>>> teams = new HashMap<>();
        SortedSet<Integer> ints = new TreeSet<>();

        Key key = Key.createKey(Arrays.asList("team"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

        while (it.hasNext()) {
            List<String> currentTeam = new ArrayList<>();
            KeyValueVersion kv = it.next();
            if (kv.getKey().getMinorPath().get(0).equals("wins")) {
                String teamId = kv.getKey().getMajorPath().get(1);
                String wins = new String(kv.getValue().getValue());
                currentTeam.add(teamId);
                currentTeam.add(getNameOfTeam(teamId, store));
                if (!ints.contains(Integer.parseInt(wins))) {
                    ints.add(Integer.parseInt(wins));
                }
                if (teams.containsKey(wins)) {
                    teams.get(wins).add(currentTeam);
                } else {
                    List<List<String>> extra = new ArrayList<>();
                    extra.add(currentTeam);
                    teams.put(wins, extra);
                }
            }
        }

        for (Integer win : ints) {
            for (List<String> teamInfo : teams.get(win.toString())) {
                System.out.print(win + "\t");
                for (String data : teamInfo) {
                    System.out.print(data + "\t");
                }
                System.out.print("\n");
            }
        }

        /*
         * I stored a key-value structure as follows to have the store do the sorting for me:
         *      /wins/-/{wins}/{teamId}/NO-VALUE.
         * But for some reason, the KVStore does not compare well with strings that have more than one digit.
         *      The following produces this outcome:
         *          0	21	Drop It Like Its Hot
	     *          1	11	Green Scorpions
         *          1	19	Dunkaroo
         *          1	3	The Bright Angels
         *          1	6	The Bold Storm
         *          11	18	Doctor J
         *          11	20	Pistons
         *          13	13	The Zonked Tigers
         *          16	7	Basic Ballers
         *          18	15	Team Ball So Hard
         *          18	2	The Magic Lobsters
         *          18	5	The Flawless Wings
         *          19	16	McBuckets
         *          19	8	Extreme Panthers
         *          20	1	The United Falcons
         *          20	10	Michigan Wild
         *          6	4	What Am I Doing
         *          7	14	The Lonely Rabbits
         *          7	9	American Sonics
         *          8	12	The Pricey Pandas
         *          8	17	The GOAT
         * So for whatever reason, the sorting by wins does not work with the following accessing of the team information.
         */
        Key yearPath = Key.createKey(Arrays.asList("wins"));
        Map<Key, ValueVersion> fields = store.multiGet(yearPath, null, null);

        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String wins = field.getKey().getMinorPath().get(0);
            String teamId = field.getKey().getMinorPath().get(1);
            System.out.println("\t" + wins + "\t" + teamId + "\t" + getNameOfTeam(teamId, store));
        }

        store.close();
    }

    // Function to get the teamName of a team from their teamId
    public static String getNameOfTeam(String teamId, KVStore store) {
        String temp = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("team", teamId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("teamName")) {
                temp = new String(field.getValue().getValue().getValue());
            }
        }
        return temp;
    }
}
