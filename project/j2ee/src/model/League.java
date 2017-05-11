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
public class League {
    private long leagueid;
    private String leaguename;
    private Time startdate;

    @Id
    @Column(name = "LEAGUEID")
    public long getLeagueid() {
        return leagueid;
    }

    public void setLeagueid(long leagueid) {
        this.leagueid = leagueid;
    }

    @Basic
    @Column(name = "LEAGUENAME")
    public String getLeaguename() {
        return leaguename;
    }

    public void setLeaguename(String leaguename) {
        this.leaguename = leaguename;
    }

    @Basic
    @Column(name = "STARTDATE")
    public Time getStartdate() {
        return startdate;
    }

    public void setStartdate(Time startdate) {
        this.startdate = startdate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        League league = (League) o;

        if (leagueid != league.leagueid) return false;
        if (leaguename != null ? !leaguename.equals(league.leaguename) : league.leaguename != null) return false;
        if (startdate != null ? !startdate.equals(league.startdate) : league.startdate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (leagueid ^ (leagueid >>> 32));
        result = 31 * result + (leaguename != null ? leaguename.hashCode() : 0);
        result = 31 * result + (startdate != null ? startdate.hashCode() : 0);
        return result;
    }
}
