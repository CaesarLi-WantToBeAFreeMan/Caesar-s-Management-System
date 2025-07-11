package com.caesarjlee.backend.cms.repositories.interfaces;

import com.caesarjlee.backend.cms.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepositoryInterface extends JpaRepository <UserEntity, Long> {
    Optional <UserEntity> findByUsername(String username);
}