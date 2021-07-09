package com.example.impservice.model;

import org.hibernate.annotations.Immutable;

import javax.persistence.*;

@Entity
@Table(name = "available_doses")
@Immutable
public class AvailableDoses {

    @Id
    String name;

    long available;

    public String getName() {
        return name;
    }

    public long getAvailable() {
        return available;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAvailable(long available) {
        this.available = available;
    }
}
