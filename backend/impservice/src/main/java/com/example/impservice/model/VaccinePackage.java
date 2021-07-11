package com.example.impservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "vaccine_package")
public class VaccinePackage {
    @Id
    private long id;

    @Column(name = "charge_id")
    private long chargeID;

    @Column(name = "exp_date")
    private LocalDateTime expDate;

    @Column(name = "num_shots")
    private long numShots;

    private long vaccine_id;
    private long manufacturer_id;

    public long getId() {
        return id;
    }

    public long getChargeID() {
        return chargeID;
    }

    public LocalDateTime getExpDate() {
        return expDate;
    }

    public long getNumShots() {
        return numShots;
    }

    public long getVaccine_id() {
        return vaccine_id;
    }

    public long getManufacturer_id() {
        return manufacturer_id;
    }
}
