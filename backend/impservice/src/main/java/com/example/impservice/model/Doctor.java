package com.example.impservice.model;

import javax.persistence.*;

@Entity
public class Doctor {
    @Id
    @Column(name = "license_id")
    private long licenseId;

    @OneToOne
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private Person person;

    public long getLicenseId() {
        return licenseId;
    }

    public Person getPerson() {
        return person;
    }
}
