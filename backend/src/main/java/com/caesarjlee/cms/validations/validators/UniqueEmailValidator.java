package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.validations.UniqueEmail;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class UniqueEmailValidator implements ConstraintValidator <UniqueEmail, String>{
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context){
        if(email == null || email.isBlank())
            return true;

        //check whether the username unique
        return !userRepository.existsByEmail(email);
    }
}