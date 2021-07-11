package com.example.impservice.controllers;

import com.example.impservice.model.TeilImmunisert;
import com.example.impservice.model.Vollimmunisiert;
import com.example.impservice.repositories.TeilImmunisiertRepository;
import com.example.impservice.repositories.VollimmunisiertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin
@RestController
public class ImmunisiertController {

    @Autowired
    TeilImmunisiertRepository teilImmunisiertRepository;

    @Autowired
    VollimmunisiertRepository vollimmunisiertRepository;

    @GetMapping("/getTeilimmunisierteCount")
    int getTeilImmunisierteCount() {

        List<TeilImmunisert> result = teilImmunisiertRepository.findAll();
        if (result.size() < 1) return 0;
        return result.get(0).getTeilimmunisiert();
    }

    @GetMapping("/getVollimmunisierteCount")
    List<Vollimmunisiert> getVollImmunisierteCount()
    {

        return vollimmunisiertRepository.findAll();
    }
}
