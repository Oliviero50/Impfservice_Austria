package com.example.impservice.repositories;


import com.example.impservice.model.ShotsList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShotsListRepository extends JpaRepository<ShotsList, String> {
}
