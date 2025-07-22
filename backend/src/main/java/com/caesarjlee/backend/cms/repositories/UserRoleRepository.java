package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRoleRepository extends JpaRepository <UserRole, Long>{
    List <UserRole> findByUserId(Long userId);
    List <UserRole> findByRoleId(Long roleId);
    boolean existsByUserIdAndRoleId(Long userId, Long roleId);
}