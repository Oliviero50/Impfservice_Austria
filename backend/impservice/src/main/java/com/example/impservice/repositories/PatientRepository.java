package com.example.impservice.repositories;

import com.example.impservice.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

public interface PatientRepository extends JpaRepository<Patient, Long> {
    @Procedure("deletePatientBySVN")
    void deletePatient(@Param("v_svn")long svnNumber);
}
