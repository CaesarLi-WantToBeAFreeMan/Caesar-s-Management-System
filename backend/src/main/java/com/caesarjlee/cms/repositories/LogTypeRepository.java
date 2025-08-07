package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.LogType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogTypeRepository extends JpaRepository <LogType, Integer>{
    LogType findByType(String type);

    Boolean existsByType(String type);
}