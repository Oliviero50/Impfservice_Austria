package com.example.impservice.controllers;

import com.example.impservice.model.ShotsByManufacturer;
import com.example.impservice.repositories.ShotsByManufacturerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class ShotsByManufacturerController {
    @Autowired
    ShotsByManufacturerRepository shotsByManufacturerRepository;

    @GetMapping("/getManufacturerShots")
    List<ShotsByManufacturer> getShotsByManufacturer() {
        return shotsByManufacturerRepository.findAll();
    }
}
