package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository <User, Long>{
    @Query("SELECT u FROM User u WHERE u.username = :login OR u.email = :login OR u.phone = :login")
    Optional <User> findByUsernameOrEmailOrPhone(String login);

    Optional <User> findByEmail(String email);
}