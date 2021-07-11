package com.example.impservice.repositories;

import com.example.impservice.model.Vollimmunisiert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface VollimmunisiertRepository extends JpaRepository<Vollimmunisiert, Long> {

}
