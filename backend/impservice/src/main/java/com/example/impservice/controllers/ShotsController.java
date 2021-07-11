package com.example.impservice.controllers;

import com.example.impservice.model.Shot;
import com.example.impservice.repositories.ShotsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class ShotsController {

    @Autowired
    ShotsRepository shotsRepository;

    @GetMapping("/getShotsList")
    Iterable<Shot> getShots() {
        return shotsRepository.findAll();
    }
}
