package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Language;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LanguageRepository extends JpaRepository <Language, Integer>{
    Language findByAbbreviation(String abbreviation);
    Language findByName(String name);

    Boolean existsByAbbreviation(String abbreviation);
    Boolean existsByName(String name);
}