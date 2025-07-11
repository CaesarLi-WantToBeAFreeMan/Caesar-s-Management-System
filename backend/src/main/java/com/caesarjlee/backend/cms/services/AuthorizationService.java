package com.caesarjlee.backend.cms.services;

import com.caesarjlee.backend.cms.entities.UserEntity;
import com.caesarjlee.backend.cms.exceptions.LoginException;
import com.caesarjlee.backend.cms.repositories.interfaces.UserRepositoryInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthorizationService{
    @Autowired
    private UserRepositoryInterface userRepositoryInterface;

    public UserEntity login(String loginId, String password){
        Optional <UserEntity> userOptional = userRepositoryInterface.findByUsername(loginId);

        UserEntity user = userOptional.orElseThrow(
            () -> new LoginException("user not found, please register one")
        );

        if(!user.getPassword().equals(password))
            throw new LoginException("incorrect password");

        return user;
    }
}