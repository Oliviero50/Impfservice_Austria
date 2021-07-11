package com.example.impservice.controllers;

import com.example.impservice.model.ShotsList;
import com.example.impservice.repositories.ShotsListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ShotsListController {

    @Autowired
    ShotsListRepository shotsListRepository;

    @GetMapping("/getVaccineShotsCount")
    List<ShotsList> getShotsList() {
        return shotsListRepository.findAll();
    }
}
