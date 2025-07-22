package com.caesarjlee.backend.cms.services;

import com.caesarjlee.backend.cms.models.User;
import com.caesarjlee.backend.cms.repositories.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService{
    private final UserRepository userRepository;

    //get current authenticated user
    public User getCurrentUser(){
        String username = SecurityContextHolder .getContext()
                                                .getAuthentication()
                                                .getName();
        return userRepository   .findByUsername(username)
                                .orElseThrow(
                                    () -> new EntityNotFoundException(username + " not found")
                                );
    }

    //get user information based on current user role permission
    public  User getUserInfoBasedOnRole(Long userId){
        User    currentUser = this.getCurrentUser(),
                targetUser = userRepository .findById(userId)
                                            .orElseThrow(
                                                () -> new EntityNotFoundException(userId + " not found")
                                            );

        //check role permission
        if(currentUser.getId().equals(userId))//view self information
            return currentUser;
        else
    }
}