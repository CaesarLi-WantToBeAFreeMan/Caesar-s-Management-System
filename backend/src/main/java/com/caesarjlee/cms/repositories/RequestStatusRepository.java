package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.RequestStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestStatusRepository extends JpaRepository <RequestStatus, Integer>{
    RequestStatus findByType(String type);

    Boolean existsByType(String type);
}