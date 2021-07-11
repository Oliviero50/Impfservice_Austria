package com.example.impservice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shots_by_manufacturer")
public class ShotsByManufacturer {
    @Id
    private String name;
    private String hersteller;

    public String getName() {
        return name;
    }

    public String getHersteller() {
        return hersteller;
    }
}
