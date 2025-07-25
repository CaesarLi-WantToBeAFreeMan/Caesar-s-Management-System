package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository <User, Long>{
    Optional <User> findByUsername(String username);
    Optional <User> findByEmail(String email);
    Optional <User> findByPhone(String phone);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    boolean existsByPhone(String phone);
    Page <User> findByDepartmentId(Long departmentId, Pageable pageable);
    List <User> findByDepartmentId(Long departmentId);
    List <User> findByUserStatus(Boolean userStatus);
}