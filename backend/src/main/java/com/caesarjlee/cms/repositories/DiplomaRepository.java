package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Diploma;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiplomaRepository extends JpaRepository <Diploma, Integer>{
    Diploma findByAbbreviation(String abbreviation);
    Diploma findByName(String name);

    Boolean existsByAbbreviation(String abbreviation);
    Boolean existsByName(String name);
}