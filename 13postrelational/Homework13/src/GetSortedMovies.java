import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;

/** GetSortedMovies list all the movies in order of year
 *
 * Written by: Ethan Clark
 * Homework 13 - CS342
 * Date: May 10, 2017
 */
public class GetSortedMovies {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        HashMap<String, List<List<String>>> movieData = new HashMap<>();
        List<String> listofyears = new ArrayList<>();

        Key key = Key.createKey(Arrays.asList("movie"));
        Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);

        while (it.hasNext()) {
            List<String> currentData = new ArrayList<>();
            KeyValueVersion kv = it.next();
            if (kv.getKey().getMinorPath().get(0).equals("year")) {
                String movieId = kv.getKey().getMajorPath().get(1);
                String year = new String(kv.getValue().getValue());
                currentData.add(movieId);
                currentData.add(getNameOfMovie(movieId, store));
                if (!listofyears.contains(year)) {
                    listofyears.add(year);
                }
                if (movieData.containsKey(year)) {
                    movieData.get(year).add(currentData);
                } else {
                    List<List<String>> extra = new ArrayList<>();
                    extra.add(currentData);
                    movieData.put(year, extra);
                }
            }
        }

        Collections.sort(listofyears);

        for (String year : listofyears) {
            for(List<String> movieInfo : movieData.get(year)) {
                System.out.print(year + "\t");
                for (String data : movieInfo) {
                    System.out.print(data + "\t");
                }
                System.out.print("\n");
            }
        }

        store.close();
    }

    public static String getNameOfMovie(String movieId, KVStore store) {
        String temp = "";
        Key majorKeyPath = Key.createKey(Arrays.asList("movie", movieId));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPath, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            if (field.getKey().getMinorPath().get(0).equals("name")) {
                temp = new String(field.getValue().getValue().getValue());
            }
        }
        return temp;
    }
}
