package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Time;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
public class Game {
    private long gameid;
    private Time matchdate;

    @Id
    @Column(name = "GAMEID")
    public long getGameid() {
        return gameid;
    }

    public void setGameid(long gameid) {
        this.gameid = gameid;
    }

    @Basic
    @Column(name = "MATCHDATE")
    public Time getMatchdate() {
        return matchdate;
    }

    public void setMatchdate(Time matchdate) {
        this.matchdate = matchdate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Game game = (Game) o;

        if (gameid != game.gameid) return false;
        if (matchdate != null ? !matchdate.equals(game.matchdate) : game.matchdate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (gameid ^ (gameid >>> 32));
        result = 31 * result + (matchdate != null ? matchdate.hashCode() : 0);
        return result;
    }
}
