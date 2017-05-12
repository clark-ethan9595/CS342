/**
 * Created by Ethan Clark on 5/5/2017.
 * Final Project - CS342
 *
 * Project Extensions Checkpoint
 *
 * NoSQL version of some of my final project tables
 */

import oracle.kv.*;

import java.sql.*;
import java.util.Arrays;

/**
 * miaaFantasy.java loads in the data from the Athlete, Team, and Athlete_Team tables in OracleXE
 *
 * Author: Ethan Clark (elc3)
 * Date: May 12, 2017
 */
public class miaaFantasy {

    private static KVStore store;
    private static Connection jdbcConnection;

    public static void main(String[] args) throws SQLException {

        // Instantiate the kvStore and connect to Oracle database
        store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        jdbcConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "miaaFantasy", "bjarne");

        getAthletes();
        getTeams();
        getAthleteTeam();

        // Close the kvStore and jdbcConnection
        store.close();

    }

    public static void getAthletes() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT athleteId, firstName, lastName, city, state_char, position FROM Athlete");

        while (resultSet.next()) {

            Integer athleteId = resultSet.getInt(1);

            Key firstNameKey = Key.createKey(Arrays.asList("athlete", athleteId.toString()), Arrays.asList("firstName"));
            Value firstNameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(firstNameKey, firstNameValue);

            Key lastNameKey = Key.createKey(Arrays.asList("athlete", athleteId.toString()), Arrays.asList("lastName"));
            Value lastNameValue = Value.createValue(resultSet.getString(3).getBytes());
            store.put(lastNameKey, lastNameValue);

            Key cityKey = Key.createKey(Arrays.asList("athlete", athleteId.toString()), Arrays.asList("city"));
            Value cityValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(cityKey, cityValue);

            Key stateKey = Key.createKey(Arrays.asList("athlete", athleteId.toString()), Arrays.asList("state"));
            Value stateValue = Value.createValue(resultSet.getString(5).getBytes());
            store.put(stateKey, stateValue);

            Key positionKey = Key.createKey(Arrays.asList("athlete", athleteId.toString()), Arrays.asList("position"));
            Value positionValue = Value.createValue(resultSet.getString(6).getBytes());
            store.put(positionKey, positionValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    public static void getTeams() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT teamId, teamName, wins, losses, ties FROM Team");

        while (resultSet.next()) {

            Integer teamId = resultSet.getInt(1);

            Key teamNameKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("teamName"));
            Value teamNameValue = Value.createValue(resultSet.getString(2).getBytes());
            store.put(teamNameKey, teamNameValue);

            Key winsKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("wins"));
            Value winsValues = Value.createValue(resultSet.getString(3).getBytes());
            store.put(winsKey, winsValues);

            Key lossesKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("losses"));
            Value lossesValue = Value.createValue(resultSet.getString(4).getBytes());
            store.put(lossesKey, lossesValue);

            Key tiesKey = Key.createKey(Arrays.asList("team", teamId.toString()), Arrays.asList("ties"));
            Value tiesValue = Value.createValue(resultSet.getString(5).getBytes());
            store.put(tiesKey, tiesValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    public static void getAthleteTeam() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT teamId, athleteId FROM Athlete_Team");

        while (resultSet.next()) {

            Key key = Key.createKey(Arrays.asList("athleteTeam", resultSet.getString(1)), Arrays.asList("athlete"));
            Value value = Value.createValue(resultSet.getString(2).getBytes());
            store.put(key, value);
        }
    }
}
