package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository <Role, Long>{
    Optional <Role> findByName(String name);
    boolean existsByName(String name);
}