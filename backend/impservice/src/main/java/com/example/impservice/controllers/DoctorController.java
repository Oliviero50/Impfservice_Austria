package com.example.impservice.controllers;

import com.example.impservice.model.Doctor;
import com.example.impservice.repositories.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class DoctorController {
    @Autowired
    DoctorRepository doctorRepository;

    @GetMapping("/getDoctorsList")
    List<Doctor> getDoctors() {
        return doctorRepository.findAll();
    }
}
