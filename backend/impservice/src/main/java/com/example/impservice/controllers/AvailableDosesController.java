package com.example.impservice.controllers;

import com.example.impservice.model.AvailableDoses;
import com.example.impservice.repositories.AvailableDosesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AvailableDosesController {

    @Autowired
    AvailableDosesRepository availableDosesRepository;

    @GetMapping("getAvailableDosesList")
    List<AvailableDoses> getDoses () {
        List<AvailableDoses> doses = availableDosesRepository.findAll();
        return doses;
    }
}
