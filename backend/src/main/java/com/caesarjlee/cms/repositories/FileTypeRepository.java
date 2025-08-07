package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.FileType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileTypeRepository extends JpaRepository <FileType, Integer>{
    FileType findByAbbreviation(String abbreviation);
    FileType findByName(String name);

    Boolean existsByAbbreviation(String abbreviation);
    Boolean existsByName(String name);
}