/**
 * Created by Ethan Clark on 5/5/2017.
 * Final Project - CS342
 *
 * Project Extensions Checkpoint
 *
 * NoSQL version of some of my final project tables
 *
 * I think that for my database, this key-value system of KVLite is okay for storing my database application. Potentially I think
 *      that a document noSQL database type might be a little bit better because documents do not have to have the same exact
 *      information in each one, so I think that may come in handy a little bit. But, other than that, I think that the key-value
 *      structure works fine for storing tables like Athlete and Team that store its information, but are very tricky to work with
 *      for the Athlete_Team table that implements the many-to-many relationship between Athlete and Team.
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

    /**
     * getAthletes has the following key-value structure for storing athletes:
     *      /athlete/{athleteId}/-/firstName/{firstName}
     *      /athlete/{athleteId}/-/lastName/{lastName}
     *      /athlete/{athleteId}/-/city/{city}
     *      /athlete/{athleteId}/-/state/{state}
     *      /athlete/{athleteId}/-/position/{position
     *
     * This key-value structure will allow me to get all the information for a given athlete at any time I want.
     *      I use this key-value structure to query to get all information for one specific athlete (getAthleteValues)
     *      and for getting the first and last name for a specific athlete (getTeamAthletes).
     *
     * @throws SQLException
     */
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

    /**
     * getTeams has the following the key-value structure for storing fantasy teams:
     *      /team/{teamId}/-/teamName/{teamName}
     *      /team/{teamId}/-/wins/{wins}
     *      /team/{teamId}/-/losses/{losses}
     *      /team/{teamId}/-/ties/{ties}
     *
     * I also store this key-value structure for getting the fantasy teams ordered by wins:
     *      /wins/-/{wins}/{teamId}/NO-VALUE
     *      but for whatever reason, it does not work well when comparing strings with more than one digit. Therefore
     *      I kept the original way I sorted by wins in the GetSortedTeams.java still.
     *
     * This key-value structure will allow me to get the necessary information needed for getting a specific team
     *      based on the team's id.
     *
     * @throws SQLException
     */
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

            Key orderedKey = Key.createKey(Arrays.asList("wins"), Arrays.asList(resultSet.getString(3), teamId.toString()));
            Value orderedValue = Value.createValue(new byte[0]);
            store.put(orderedKey, orderedValue);
        }

        resultSet.close();
        jdbcStatement.close();
    }

    /**
     * getAthleteTeam has the following key-value structure for storing the Athlete_Team records
     *      /athleteTeam/{teamId}/{athleteId}/-/NO-VALUE
     *
     * This key-value structure allows me to use storeIterator to get all the athletes that are on a given
     *      fantasyTeam given the team id. This one took me a while to figure out and I'm not exactly sure why
     *      my previous key-value structuring wasn't working, but creating it so that this key structure contains
     *      a no-value (or a NULL value) works great to get all the athletes for a given fantasy team.
     *
     * @throws SQLException
     */
    public static void getAthleteTeam() throws SQLException {

        Statement jdbcStatement = jdbcConnection.createStatement();
        ResultSet resultSet = jdbcStatement.executeQuery("SELECT teamId, athleteId FROM Athlete_Team");

        while (resultSet.next()) {

            Key key = Key.createKey(Arrays.asList("athleteTeam", resultSet.getString(1), resultSet.getString(2)));
            Value value = Value.createValue(new byte[0]);
            store.put(key, value);
        }
    }
}
