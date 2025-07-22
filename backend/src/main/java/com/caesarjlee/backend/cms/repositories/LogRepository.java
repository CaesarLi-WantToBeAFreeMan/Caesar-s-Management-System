package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Log;
import com.caesarjlee.backend.cms.models.enumerations.ActionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogRepository extends JpaRepository <Log, Long>{
    Page <Log> findByUserId(Long userId, Pageable pageable);
    List <Log> findByActionType(ActionType actionType);
}