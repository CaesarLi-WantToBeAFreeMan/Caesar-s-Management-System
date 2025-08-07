package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Gender;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenderRepository extends JpaRepository <Gender, Integer>{
    Gender findByName(String name);

    Boolean existsByName(String name);
}