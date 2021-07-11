package com.example.impservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vollimmunisiert")
public class Vollimmunisiert {
    @Id
    private long vollimmunisiert;

    public long getVollimmunisiert() {
        return vollimmunisiert;
    }
}
