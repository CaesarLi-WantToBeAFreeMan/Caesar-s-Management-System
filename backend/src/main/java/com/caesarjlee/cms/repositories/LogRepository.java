package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface LogRepository extends JpaRepository <Log, Long>{
    Page <Log> findByUserId(Long userId, Pageable pageable);
    Page <Log> findByTypeId(Integer typeId, Pageable pageable);
    Page <Log> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);

    Boolean existsByUserId(Long userId);
    Boolean existsByTypeId(Integer typeId);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    Long countByUserId(Long userId);
    Long countByTypeId(Integer typeId);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
}