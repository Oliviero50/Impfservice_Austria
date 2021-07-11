package com.example.impservice.repositories;

import com.example.impservice.model.SideEffectsBySex;
import org.springframework.data.jpa.repository.JpaRepository;

public interface getSideEffectsSexCountRepository extends JpaRepository<SideEffectsBySex, String> {
}
