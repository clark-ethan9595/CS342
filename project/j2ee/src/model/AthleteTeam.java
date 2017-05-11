package model;

import javax.persistence.*;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
@Table(name = "ATHLETE_TEAM", schema = "MIAAFANTASY", catalog = "")
@IdClass(AthleteTeamPK.class)
public class AthleteTeam {
    private long teamid;
    private long athleteid;

    @Id
    @Column(name = "TEAMID")
    public long getTeamid() {
        return teamid;
    }

    public void setTeamid(long teamid) {
        this.teamid = teamid;
    }

    @Id
    @Column(name = "ATHLETEID")
    public long getAthleteid() {
        return athleteid;
    }

    public void setAthleteid(long athleteid) {
        this.athleteid = athleteid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AthleteTeam that = (AthleteTeam) o;

        if (teamid != that.teamid) return false;
        if (athleteid != that.athleteid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (teamid ^ (teamid >>> 32));
        result = 31 * result + (int) (athleteid ^ (athleteid >>> 32));
        return result;
    }
}
