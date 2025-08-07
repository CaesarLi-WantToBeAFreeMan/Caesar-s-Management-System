package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Request;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface RequestRepository extends JpaRepository <Request, Long>{
    Page <Request> findByUserId(Long userId, Pageable pageable);
    Page <Request> findByTypeId(Integer typeId, Pageable pageable);
    Page <Request> findByStatus(Integer status, Pageable pageable);
    Page <Request> findByHandlerId(Long handlerId, Pageable pageable);
    Page <Request> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Page <Request> findByUpdatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);

    Boolean existsByUserId(Long userId);
    Boolean existsByTypeId(Integer typeId);
    Boolean existsByStatus(Integer status);
    Boolean existsByHandlerId(Long handlerId);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Boolean existsByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);

    Long countByUserId(Long userId);
    Long countByTypeId(Integer typeId);
    Long countByStatus(Integer status);
    Long countByHandlerId(Long handlerId);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);
}