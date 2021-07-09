package com.example.impservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="patient")
public class Patient {
    @Id
    @Column(name = "person_id")
    long id;

    @Column(name = "svn_nummer")
    long svnNumber;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getSvnNumber() {
        return svnNumber;
    }

    public void setSvnNumber(long svnNumber) {
        this.svnNumber = svnNumber;
    }
}
