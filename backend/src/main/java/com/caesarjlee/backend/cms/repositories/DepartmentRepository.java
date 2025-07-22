package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DepartmentRepository extends JpaRepository <Department, Long>{
    Optional <Department> findByName(String name);
    List <Department> findByParentDepartmentId(Long parentDepartmentId);
    List <Department> findByManagerId(Long managerId);
    boolean existsByName(String name);
}