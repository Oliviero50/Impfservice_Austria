package com.example.impservice.repositories;

import com.example.impservice.model.Shot;
import com.example.impservice.model.ShotId;
import org.springframework.data.repository.CrudRepository;

public interface ShotsRepository extends CrudRepository<Shot, ShotId> {
}
