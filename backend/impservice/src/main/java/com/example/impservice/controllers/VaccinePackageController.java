package com.example.impservice.controllers;

import com.example.impservice.model.VaccinePackage;
import com.example.impservice.repositories.VaccinePackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class VaccinePackageController {

    @Autowired
    VaccinePackageRepository vaccinePackageRepository;

    @GetMapping("/getVaccinePackagesList")
    List<VaccinePackage> getVaccinePackages() {
        return vaccinePackageRepository.findAll();
    }
}
