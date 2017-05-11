package model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by elc3 on 5/11/2017.
 */
public class AthleteGamePK implements Serializable {
    private long gameid;
    private long athleteid;

    @Column(name = "GAMEID")
    @Id
    public long getGameid() {
        return gameid;
    }

    public void setGameid(long gameid) {
        this.gameid = gameid;
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

        AthleteGamePK that = (AthleteGamePK) o;

        if (gameid != that.gameid) return false;
        if (athleteid != that.athleteid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (gameid ^ (gameid >>> 32));
        result = 31 * result + (int) (athleteid ^ (athleteid >>> 32));
        return result;
    }
}
