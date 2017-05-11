import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

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

    public static void getRoles() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT actorId, movieId, role FROM Role");
        Integer i = 0;

        while (resultSet.next()) {
            Key actorKey = Key.createKey(Arrays.asList("role", resultSet.getString(1), resultSet.getString(2)), Arrays.asList("name"));
            Value roleValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(actorKey, roleValue);
            if (i < 10) {
                String result = new String(store.get(actorKey).getValue().getValue());
                System.out.println(actorKey.toString() + " : " + result);
                i++;
            }
        }

        resultSet.close();
        jdbcStatement.close();
    }

}
