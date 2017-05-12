import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Map;

/**
 * LoadDB.java loads in the data from the Actor, Movie, and Role table from the IMDB database in OracleXE
 *
 * Written by: Ethan Clark (elc3)
 * Homework13 - CS 342
 * Date: May 9, 2017
 */
public class LoadDB {

    private static KVStore store;
    private static Connection jdbcConnection;

    public static void main(String[] args) throws SQLException {

        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "imdb", "bjarne");

        getMovies();
        getActors();
        getRoles();

        jdbcConnection.close();
        store.close();
    }

    /**
     * getMovies has the following key-value structure for storing movies:
     *      /movie/{id}/-/name/{movieName}
     *      /movie/{id}/-/year/{movieYear}
     *      /movie/{id}/-/rank/{movieRank}
     *
     * This key-value structure will allow me to query all the values for a given movie (GetTableValues)
     *       by using a multiGet on /movie/{given id}. Then it may not be ideal for sorting
     *       all the movies in the database by year, but I made it work (GetSortedMovies), by reading in
     *       all records with /movie/ and then checking if the first part of the minor key was year and storing
     *       that information in a HashMap of (String, List<List<String>>).
     *
     * @throws SQLException
     */
    public static void getMovies() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, name, year, rank FROM Movie");
        while (resultSet.next()) {

            Integer movieId = resultSet.getInt(1);
            String rank = resultSet.getString(4);

            Key nameKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("name"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            Key yearKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("year"));
            Value yearValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);

            Key rankKey = Key.createKey(Arrays.asList("movie", movieId.toString()), Arrays.asList("rank"));
            Value rankValue = Value.createValue("".getBytes());
            if (rank != null) {
                rankValue = Value.createValue(rank.getBytes());
            }
            store.put(rankKey, rankValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    /**
     * getActors has the following key-value structure for storing the actors:
     *      /actor/{id}/-/firstName/{actorfirstName}
     *      /actor/{id}/-/lastName/{actorlastName}
     *
     * This key value structure allows to get the first and the last name from a given record by doing
     *      a multiget on /actor/{givenId} for whenever we need the first and last name of an actor (GetMovieActors).
     *
     * @throws SQLException
     */
    public static void getActors() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT id, firstName, lastName FROM Actor");
        while (resultSet.next()) {

            Integer actorId = resultSet.getInt(1);

            Key nameKey = Key.createKey(Arrays.asList("actor", actorId.toString()), Arrays.asList("firstName"));
            Value nameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            Key yearKey = Key.createKey(Arrays.asList("actor", actorId.toString()), Arrays.asList("lastName"));
            Value yearValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    /**
     * getRoles has the following key-value structure for storing the role table records:
     *      /role/{movieId}/-/{roleName}/{actorId}
     *
     * After getting a lot of help/advice on how to get this work, I think this structure works the best
     *      for both GetMovieActorRoles and GetMovieActors. I can do a multiget on /role/{given movieId} and compare
     *      the given actorId for GetMovieActorRoles to the second part of the minor key to see if that actor is the one
     *      I want and I can get all roles for GetMovieActors by doing a multiget on /role/{given movieId} and going through
     *      all those records to get all the roles for a given movie.
     *
     * @throws SQLException
     */
    public static void getRoles() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT actorId, movieId, role FROM Role");

        while (resultSet.next()) {
            Key key = Key.createKey(Arrays.asList("role", resultSet.getString(2)), Arrays.asList(resultSet.getString(3)));
            Value value = Value.createValue(resultSet.getString(1).getBytes());
            store.put(key, value);

            Map<Key, ValueVersion> fields = store.multiGet(key, null, null);
            for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
                String fieldName = field.getKey().getMinorPath().get(0);
                String fieldValue = new String(field.getValue().getValue().getValue());
                System.out.println("\t" + fieldName + "\t" + fieldValue);
            }
        }

        resultSet.close();
        jdbcStatement.close();
    }

}
