package com.example.impservice;

import com.example.impservice.model.*;
import com.example.impservice.repositories.*;
import org.hibernate.Session;
import org.hibernate.jdbc.ReturningWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.object.StoredProcedure;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

@SpringBootApplication
public class ImpserviceApplication implements CommandLineRunner {

	@Autowired
	DoctorRepository doctorRepository;

	@Autowired
	EntityManager entityManager;

	public static void main(String[] args) {
		SpringApplication.run(ImpserviceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		StoredProcedureQuery query = entityManager
				.createStoredProcedureQuery("add_vaccination2")
				.registerStoredProcedureParameter(1, Long.class, ParameterMode.IN)
				.registerStoredProcedureParameter(2, Long.class, ParameterMode.IN)
				.registerStoredProcedureParameter(3, Long.class, ParameterMode.IN)
				.registerStoredProcedureParameter(4, Long.class, ParameterMode.IN)
				.setParameter(1, 1L)
				.setParameter(2, 1L)
				.setParameter(3, 6L)
				.setParameter(4, 6L);

		query.execute();
	}
}
