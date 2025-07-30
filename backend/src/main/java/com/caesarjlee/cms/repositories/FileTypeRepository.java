package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Currency;
import com.caesarjlee.cms.models.FileType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileTypeRepository extends JpaRepository <FileType, Integer>{
    FileType findByAbbreviation(String abbreviation);
    FileType findByName(String name);

    boolean existsByAbbreviation(String abbreviation);
    boolean existsByName(String name);
}