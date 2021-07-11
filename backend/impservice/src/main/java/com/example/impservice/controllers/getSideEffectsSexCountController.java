package com.example.impservice.controllers;

import com.example.impservice.model.SideEffectsBySex;
import com.example.impservice.repositories.getSideEffectsSexCountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class getSideEffectsSexCountController {

    @Autowired
    getSideEffectsSexCountRepository getSideEffectsSexCountRepository;

    @GetMapping("/getSideEffectsSexCount")
    List<SideEffectsBySex> getSideEffectsBySex() {
        return getSideEffectsSexCountRepository.findAll();
    }
}
