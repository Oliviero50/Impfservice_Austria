package com.example.impservice.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ShotId  implements Serializable {
    private LocalDateTime datetime;
    private String firstname;
    private String lastname;

    public ShotId() {
    }

    public ShotId(LocalDateTime datetime, String firstname, String lastname) {
        this.datetime = datetime;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShotId shotId = (ShotId) o;
        return Objects.equals(datetime, shotId.datetime) && Objects.equals(firstname, shotId.firstname) && Objects.equals(lastname, shotId.lastname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(datetime, firstname, lastname);
    }
}
