package com.example.impservice.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "side_effects_sex")
public class SideEffectsBySex {
    @Id
    private String effect;

    private String sex;
    private long anzahl;

    public String getEffect() {
        return effect;
    }

    public String getSex() {
        return sex;
    }

    public long getAnzahl() {
        return anzahl;
    }
}
