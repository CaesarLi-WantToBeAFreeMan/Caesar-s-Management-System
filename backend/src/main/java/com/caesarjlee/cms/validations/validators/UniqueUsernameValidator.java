package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.validations.UniqueUsername;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class UniqueUsernameValidator implements ConstraintValidator <UniqueUsername, String>{
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean isValid(String username, ConstraintValidatorContext context){
        if(username == null)
            return true;

        //check whether the username unique
        return !userRepository.existsByUsername(username);
    }
}