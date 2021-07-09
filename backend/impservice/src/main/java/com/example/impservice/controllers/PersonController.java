package com.example.impservice.controllers;

import com.example.impservice.model.Person;
import com.example.impservice.model.PersonDTO;
import com.example.impservice.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class PersonController {

    @Autowired
    PersonRepository personRepository;

    @GetMapping("/getPersons")
    List<PersonDTO> getPersons() {
        List<Person> persons = new ArrayList<Person>();
        personRepository.findAll().forEach(persons::add);
        List<PersonDTO> personDTOS = persons
                .stream()
                .map(p -> new PersonDTO(p.getId(), p.getFirstName() + " " + p.getLastName())).collect(Collectors.toUnmodifiableList());
        return personDTOS;
    }
}
