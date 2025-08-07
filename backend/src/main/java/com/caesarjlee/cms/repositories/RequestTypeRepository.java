package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.RequestType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestTypeRepository extends JpaRepository <RequestType, Integer>{
    RequestType findByType(String type);

    Boolean existsByType(String type);
}