package com.example.impservice.repositories;

import com.example.impservice.model.VaccinePackage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VaccinePackageRepository extends JpaRepository<VaccinePackage, Long> {
}
