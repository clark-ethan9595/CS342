package model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by elc3 on 5/11/2017.
 */
public class AthleteTeamPK implements Serializable {
    private long teamid;
    private long athleteid;

    @Column(name = "TEAMID")
    @Id
    public long getTeamid() {
        return teamid;
    }

    public void setTeamid(long teamid) {
        this.teamid = teamid;
    }

    @Column(name = "ATHLETEID")
    @Id
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

        AthleteTeamPK that = (AthleteTeamPK) o;

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
