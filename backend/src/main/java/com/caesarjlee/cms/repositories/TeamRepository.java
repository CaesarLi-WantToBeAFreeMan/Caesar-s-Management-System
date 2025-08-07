package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Team;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface TeamRepository extends JpaRepository <Team, Integer>{
    Team findByName(String name);

    Boolean existsByDepartmentId(Integer departmentId);
    Boolean existsByName(String name);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Boolean existsByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);
    Boolean existsByManagerId(Long managerId);

    Page <Team> findByDepartmentId(Integer departmentId, Pageable pageable);
    Page <Team> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Page <Team> findByUpdatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Page <Team> findByManagerId(Long managerId, Pageable pageable);

    Long countByDepartmentId(Integer departmentId);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByUpdatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByManagerId(Long managerId);
}