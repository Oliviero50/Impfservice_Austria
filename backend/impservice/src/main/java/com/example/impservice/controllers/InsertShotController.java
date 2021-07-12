package com.example.impservice.controllers;

import com.example.impservice.model.VaccineShotDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;

@RestController
@CrossOrigin
public class InsertShotController {
    @Autowired
    EntityManager entityManager;

    @PostMapping("/addVaccineShot")
    void addShot(@RequestBody VaccineShotDTO shot) {

        System.out.println(shot.getDoctorId());
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("add_vaccination")
                .registerStoredProcedureParameter(1, Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, Long.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, Long.class, ParameterMode.IN)
                .setParameter(1, shot.getPatientId())
                .setParameter(2, shot.getVaccinationCentre())
                .setParameter(3, shot.getPackageId())
                .setParameter(4, shot.getDoctorId());

        query.execute();
    }
}
