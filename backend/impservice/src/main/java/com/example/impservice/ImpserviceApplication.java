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
public class ImpserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ImpserviceApplication.class, args);
	}

}
