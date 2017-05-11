package model;

import javax.persistence.*;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
public class Team {
    @Id
    private long teamid;
    private String teamname;
    private Long wins;
    private Long losses;
    private Long ties;

    // Create the ManyToOne relationship between a fantasy team and a league
    @ManyToOne
    @JoinColumn(name = "LEAGUEID", referencedColumnName = "LEAGUEID")
    private League league;

    // Declare the accessor and mutator methods for the Team's League
    public League getLeague() { return league; }
    public void setLeague(League new_league) { this.league = new_league; }

    @Id
    @Column(name = "TEAMID")
    public long getTeamid() {
        return teamid;
    }

    public void setTeamid(long teamid) {
        this.teamid = teamid;
    }

    @Basic
    @Column(name = "TEAMNAME")
    public String getTeamname() {
        return teamname;
    }

    public void setTeamname(String teamname) {
        this.teamname = teamname;
    }

    @Basic
    @Column(name = "WINS")
    public Long getWins() {
        return wins;
    }

    public void setWins(Long wins) {
        this.wins = wins;
    }

    @Basic
    @Column(name = "LOSSES")
    public Long getLosses() {
        return losses;
    }

    public void setLosses(Long losses) {
        this.losses = losses;
    }

    @Basic
    @Column(name = "TIES")
    public Long getTies() {
        return ties;
    }

    public void setTies(Long ties) {
        this.ties = ties;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Team team = (Team) o;

        if (teamid != team.teamid) return false;
        if (teamname != null ? !teamname.equals(team.teamname) : team.teamname != null) return false;
        if (wins != null ? !wins.equals(team.wins) : team.wins != null) return false;
        if (losses != null ? !losses.equals(team.losses) : team.losses != null) return false;
        if (ties != null ? !ties.equals(team.ties) : team.ties != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (teamid ^ (teamid >>> 32));
        result = 31 * result + (teamname != null ? teamname.hashCode() : 0);
        result = 31 * result + (wins != null ? wins.hashCode() : 0);
        result = 31 * result + (losses != null ? losses.hashCode() : 0);
        result = 31 * result + (ties != null ? ties.hashCode() : 0);
        return result;
    }
}
