package com.example.impservice.controllers;

import com.example.impservice.model.ShotsSex;
import com.example.impservice.repositories.ShotsSexRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class ShotsSexController {

    @Autowired
    ShotsSexRepository shotsSexRepository;

    @GetMapping("/getShotsSexList")
    List<ShotsSex> getShotsBySex() {
        return shotsSexRepository.findAll();
    }
}
