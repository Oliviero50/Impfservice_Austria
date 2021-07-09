package com.example.impservice.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImmunisiertController {

    @GetMapping("/getTeilimmunisierteCount")
    int getTeilImmunisierteCount() {
        return 29;
    }

    @GetMapping("/getVollimmunisierteCount")
    int getVollImmunisierteCount() {
        return 29;
    }
}
