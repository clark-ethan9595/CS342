package model;

import javax.persistence.*;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
@Table(name = "ATHLETE_GAME", schema = "MIAAFANTASY", catalog = "")
@IdClass(AthleteGamePK.class)
public class AthleteGame {
    private long gameid;
    private long athleteid;
    private Long points;
    private Long rebounds;
    private Long assists;
    private Long steals;
    private Long blocks;
    private Long turnovers;

    @Id
    @Column(name = "GAMEID")
    public long getGameid() {
        return gameid;
    }

    public void setGameid(long gameid) {
        this.gameid = gameid;
    }

    @Id
    @Column(name = "ATHLETEID")
    public long getAthleteid() {
        return athleteid;
    }

    public void setAthleteid(long athleteid) {
        this.athleteid = athleteid;
    }

    @Basic
    @Column(name = "POINTS")
    public Long getPoints() {
        return points;
    }

    public void setPoints(Long points) {
        this.points = points;
    }

    @Basic
    @Column(name = "REBOUNDS")
    public Long getRebounds() {
        return rebounds;
    }

    public void setRebounds(Long rebounds) {
        this.rebounds = rebounds;
    }

    @Basic
    @Column(name = "ASSISTS")
    public Long getAssists() {
        return assists;
    }

    public void setAssists(Long assists) {
        this.assists = assists;
    }

    @Basic
    @Column(name = "STEALS")
    public Long getSteals() {
        return steals;
    }

    public void setSteals(Long steals) {
        this.steals = steals;
    }

    @Basic
    @Column(name = "BLOCKS")
    public Long getBlocks() {
        return blocks;
    }

    public void setBlocks(Long blocks) {
        this.blocks = blocks;
    }

    @Basic
    @Column(name = "TURNOVERS")
    public Long getTurnovers() {
        return turnovers;
    }

    public void setTurnovers(Long turnovers) {
        this.turnovers = turnovers;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AthleteGame that = (AthleteGame) o;

        if (gameid != that.gameid) return false;
        if (athleteid != that.athleteid) return false;
        if (points != null ? !points.equals(that.points) : that.points != null) return false;
        if (rebounds != null ? !rebounds.equals(that.rebounds) : that.rebounds != null) return false;
        if (assists != null ? !assists.equals(that.assists) : that.assists != null) return false;
        if (steals != null ? !steals.equals(that.steals) : that.steals != null) return false;
        if (blocks != null ? !blocks.equals(that.blocks) : that.blocks != null) return false;
        if (turnovers != null ? !turnovers.equals(that.turnovers) : that.turnovers != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (gameid ^ (gameid >>> 32));
        result = 31 * result + (int) (athleteid ^ (athleteid >>> 32));
        result = 31 * result + (points != null ? points.hashCode() : 0);
        result = 31 * result + (rebounds != null ? rebounds.hashCode() : 0);
        result = 31 * result + (assists != null ? assists.hashCode() : 0);
        result = 31 * result + (steals != null ? steals.hashCode() : 0);
        result = 31 * result + (blocks != null ? blocks.hashCode() : 0);
        result = 31 * result + (turnovers != null ? turnovers.hashCode() : 0);
        return result;
    }
}
