package com.example.impservice.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;

@RestController
@CrossOrigin
public class InsertShotController {
    @Autowired
    EntityManager entityManager;


}
