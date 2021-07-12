package com.example.impservice.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import java.math.BigDecimal;

@RestController
@CrossOrigin
public class VaccineShotsCountController {
    @Autowired
    EntityManager entityManager;

    @GetMapping("/getVaccineShotsCount")
    BigDecimal getVaccineShotsCount() {
        BigDecimal val = (BigDecimal)entityManager
                .createNativeQuery("select getVaccineShotsCount() from dual")
                .getSingleResult();
        return val;
    }
}
