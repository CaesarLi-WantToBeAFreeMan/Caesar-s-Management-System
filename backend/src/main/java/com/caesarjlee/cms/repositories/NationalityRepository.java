package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Nationality;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NationalityRepository extends JpaRepository <Nationality, Integer>{
    Nationality findByAbbreviation(String abbreviation);
    Nationality findByName(String name);

    Boolean existsByAbbreviation(String abbreviation);
    Boolean existsByName(String name);
}