package com.example.impservice;

import com.example.impservice.model.*;
import com.example.impservice.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ImpserviceApplication implements CommandLineRunner {

	@Autowired
	DoctorRepository doctorRepository;

	public static void main(String[] args) {
		SpringApplication.run(ImpserviceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Iterable<Doctor> doctors = doctorRepository.findAll();
		for (Doctor doc: doctors) {
			System.out.println(doc.getPerson().getFirstName());
		}
		

	}
}
