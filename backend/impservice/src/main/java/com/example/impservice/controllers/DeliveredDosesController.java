package com.example.impservice.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import java.math.BigDecimal;

@RestController
@CrossOrigin
public class DeliveredDosesController {

    @Autowired
    EntityManager entityManager;

    @GetMapping("/getDeliveredDosesCount")
    BigDecimal getdoses() {
        BigDecimal val = (BigDecimal)entityManager
                .createNativeQuery("select getDeliveredDosesCount() from dual")
                .getSingleResult();
        System.out.println(val);
        return val;
    }
}
