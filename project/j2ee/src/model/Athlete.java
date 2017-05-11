package model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by elc3 on 5/11/2017.
 */
@Entity
public class Athlete {
    @Id
    private long athleteid;
    private String firstname;
    private String lastname;
    private String city;
    private String state_Char;
    private Double gpa;
    private String grade;
    private String position;

    // Create the ManyToOne relationship between an Athlete and a School
    @ManyToOne
    @JoinColumn(name = "SCHOOLID", referencedColumnName = "SCHOOLID")
    private School school_name;

    // Declare the accessor and mutator methods for the Athlete's School
    public School getSchool_name() { return school_name; }
    public void setSchool_name(School new_school) { this.school_name = new_school; }

    @ManyToMany
    @JoinTable(name = "ATHLETE_TEAM", schema = "miaaFantasy",
                joinColumns = @JoinColumn(name = "ATHLETEID", referencedColumnName = "ATHLETEID", nullable = false),
                inverseJoinColumns = @JoinColumn(name = "TEAMID", referencedColumnName = "TEAMID", nullable = false))
    private List<Team> teams;

    // Declare the accessor and mutator methods for the Athlete's Team list
    public List<Team> getTeamList() { return teams; }
    public void setTeamList(List<Team> new_teamList) { this.teams = new_teamList; }

    @Id
    @Column(name = "ATHLETEID")
    public long getAthleteid() {
        return athleteid;
    }

    public void setAthleteid(long athleteid) {
        this.athleteid = athleteid;
    }

    @Basic
    @Column(name = "FIRSTNAME")
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    @Basic
    @Column(name = "LASTNAME")
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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
        return state_Char;
    }

    public void setStateChar(String stateChar) {
        this.state_Char = stateChar;
    }

    @Basic
    @Column(name = "GPA")
    public Double getGpa() {
        return gpa;
    }

    public void setGpa(Double gpa) {
        this.gpa = gpa;
    }

    @Basic
    @Column(name = "GRADE")
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Basic
    @Column(name = "POSITION")
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Athlete athlete = (Athlete) o;

        if (athleteid != athlete.athleteid) return false;
        if (firstname != null ? !firstname.equals(athlete.firstname) : athlete.firstname != null) return false;
        if (lastname != null ? !lastname.equals(athlete.lastname) : athlete.lastname != null) return false;
        if (city != null ? !city.equals(athlete.city) : athlete.city != null) return false;
        if (state_Char != null ? !state_Char.equals(athlete.state_Char) : athlete.state_Char != null) return false;
        if (gpa != null ? !gpa.equals(athlete.gpa) : athlete.gpa != null) return false;
        if (grade != null ? !grade.equals(athlete.grade) : athlete.grade != null) return false;
        if (position != null ? !position.equals(athlete.position) : athlete.position != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (athleteid ^ (athleteid >>> 32));
        result = 31 * result + (firstname != null ? firstname.hashCode() : 0);
        result = 31 * result + (lastname != null ? lastname.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (state_Char != null ? state_Char.hashCode() : 0);
        result = 31 * result + (gpa != null ? gpa.hashCode() : 0);
        result = 31 * result + (grade != null ? grade.hashCode() : 0);
        result = 31 * result + (position != null ? position.hashCode() : 0);
        return result;
    }
}
