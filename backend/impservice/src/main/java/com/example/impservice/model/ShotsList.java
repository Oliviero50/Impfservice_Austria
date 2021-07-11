package com.example.impservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "shots_list")
public class ShotsList {

    private LocalDateTime datetime;
    @Id
    private String lastname;
    private String firstname;
    private String sex;

    @Column(name = "vaccine_name")
    private String vaccineName;

    @Column(name = "vaccination_centre")
    private String vaccinationCentre;

    public LocalDateTime getDatetime() {
        return datetime;
    }

    public String getLastname() {
        return lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getVaccineName() {
        return vaccineName;
    }

    public String getVaccinationCentre() {
        return vaccinationCentre;
    }

    public String getSex() {
        return sex;
    }
}
