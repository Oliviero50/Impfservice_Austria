package com.example.impservice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "teilimmunisiert")
public class TeilImmunisert {
    @Id
    private int teilimmunisiert;

    public int getTeilimmunisiert() {
        return teilimmunisiert;
    }
}
