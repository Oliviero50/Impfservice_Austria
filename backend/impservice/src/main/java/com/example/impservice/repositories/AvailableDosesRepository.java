package com.example.impservice.repositories;

import com.example.impservice.model.AvailableDoses;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AvailableDosesRepository extends JpaRepository<AvailableDoses, Long> {
}
