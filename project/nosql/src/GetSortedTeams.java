import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;

/**
 * GetSortedTeams.java sorts all the FantasyTeams in the database based on number of wins
 *
 * Author: Ethan Clark (elc3)
 * Date: May 12, 2017
 */
public class GetSortedTeams {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<List<String>>> teams = new HashMap<>();
        List<String> listofwins = new ArrayList<>();

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
                if (!listofwins.contains(wins)) {
                    listofwins.add(wins);
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

        Collections.sort(listofwins);

        for (String win : listofwins) {
            for (List<String> teamInfo : teams.get(win)) {
                System.out.print(win + "\t");
                for (String data : teamInfo) {
                    System.out.print(data + "\t");
                }
                System.out.print("\n");
            }
        }

        store.close();
    }

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
