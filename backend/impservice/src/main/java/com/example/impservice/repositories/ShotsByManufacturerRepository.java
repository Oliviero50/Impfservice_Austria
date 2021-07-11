package com.example.impservice.repositories;

import com.example.impservice.model.ShotsByManufacturer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShotsByManufacturerRepository extends JpaRepository<ShotsByManufacturer, String> {
}
