package com.example.impservice;

import com.example.impservice.model.AvailableDoses;
import com.example.impservice.model.Patient;
import com.example.impservice.model.Person;
import com.example.impservice.model.VaccinationCenter;
import com.example.impservice.repositories.AvailableDosesRepository;
import com.example.impservice.repositories.PatientRepository;
import com.example.impservice.repositories.PersonRepository;
import com.example.impservice.repositories.VaccinationCenterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ImpserviceApplication implements CommandLineRunner {

	@Autowired
	VaccinationCenterRepository vcRepository;
	
	@Autowired
	AvailableDosesRepository avRepository;

	@Autowired
	PatientRepository patientRepository;
	
	@Autowired
	PersonRepository personRepository;

	public static void main(String[] args) {
		SpringApplication.run(ImpserviceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Iterable<VaccinationCenter> centers = vcRepository.findAll();
		for (VaccinationCenter center: centers) {
			System.out.println(center.getName());
		}
		
		Iterable<AvailableDoses> doses = avRepository.findAll();
		for (AvailableDoses dose :
				doses) {
			System.out.println(dose.getAvailable());
		}

		//patientRepository.deletePatient(110117970L);
		Iterable<Patient> patients = patientRepository.findAll();
		for (Patient patient :
				patients) {
			System.out.println(patient.getSvnNumber());
		}
		
		Iterable<Person> persons = personRepository.findAll();
		for (Person person :
				persons) {
			System.out.println(person.getFirstName());
		}
	}
}
