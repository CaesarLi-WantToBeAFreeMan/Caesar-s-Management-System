package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Department;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository <Department, Integer>{
    Department findByName(String name);

    boolean existsByName(String name);
    boolean existsByOfficerId(Long officerId);

    Page <Department> findByOfficerId(Integer officerId, Pageable pageable);
}