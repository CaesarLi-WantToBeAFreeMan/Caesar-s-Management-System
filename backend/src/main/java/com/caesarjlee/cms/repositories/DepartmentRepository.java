package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Department;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository <Department, Integer>{
    Department findByName(String name);

    Boolean existsByName(String name);
    Boolean existsByOfficerId(Long officerId);

    Page <Department> findByOfficerId(Long officerId, Pageable pageable);

    Long countByOfficerId(Long officerId);
}