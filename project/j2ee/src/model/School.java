package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
public class School {
    private long schoolid;
    private String name;
    private String city;
    private String stateChar;

    @Id
    @Column(name = "SCHOOLID")
    public long getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(long schoolid) {
        this.schoolid = schoolid;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "CITY")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "STATE_CHAR")
    public String getStateChar() {
        return stateChar;
    }

    public void setStateChar(String stateChar) {
        this.stateChar = stateChar;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        School school = (School) o;

        if (schoolid != school.schoolid) return false;
        if (name != null ? !name.equals(school.name) : school.name != null) return false;
        if (city != null ? !city.equals(school.city) : school.city != null) return false;
        if (stateChar != null ? !stateChar.equals(school.stateChar) : school.stateChar != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (schoolid ^ (schoolid >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (stateChar != null ? stateChar.hashCode() : 0);
        return result;
    }
}
