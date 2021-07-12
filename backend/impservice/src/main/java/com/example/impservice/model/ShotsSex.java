package com.example.impservice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shots_sex")
public class ShotsSex {
    @Id
    private String sex;
    private long shots;

    public String getSex() {
        return sex;
    }

    public long getShots() {
        return shots;
    }
}
