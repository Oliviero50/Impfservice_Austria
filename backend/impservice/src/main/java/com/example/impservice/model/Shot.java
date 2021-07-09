package com.example.impservice.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "shots_list")
@IdClass(ShotId.class)
public class Shot {
    @Id
    @Column(name = "datetime")
    private LocalDateTime datetime;
    @Id
    private String firstname;
    @Id
    private String lastname;
    @Column(name = "vaccine_name")
    private String vaccineName;
    @Column(name = "vaccination_centre")
    private String vaccinationCenter;
    private String sex;

    public String getSex() {
        return sex;
    }

    public LocalDateTime getDatetime() {
        return datetime;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getVaccineName() {
        return vaccineName;
    }

    public String getVaccinationCenter() {
        return vaccinationCenter;
    }
}
