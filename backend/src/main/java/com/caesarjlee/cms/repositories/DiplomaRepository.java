package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Currency;
import com.caesarjlee.cms.models.Diploma;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiplomaRepository extends JpaRepository <DiplomaRepository, Integer>{
    Diploma findByAbbreviation(String abbreviation);
    Diploma findByName(String name);

    boolean existsByAbbreviation(String abbreviation);
    boolean existsByName(String name);
}