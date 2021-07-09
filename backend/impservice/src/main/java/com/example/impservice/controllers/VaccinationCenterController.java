package com.example.impservice.controllers;

import com.example.impservice.model.VaccinationCenter;
import com.example.impservice.repositories.VaccinationCenterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class VaccinationCenterController {
    @Autowired
    VaccinationCenterRepository vaccinationCenterRepository;

    @GetMapping("/getVaccinationCentresList")
    Iterable<VaccinationCenter> getAllVaccinationCenters() {
        return vaccinationCenterRepository.findAll();
    }
}
