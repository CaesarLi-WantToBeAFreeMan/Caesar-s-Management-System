package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.validations.UniquePhone;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class UniquePhoneValidator implements ConstraintValidator <UniquePhone, String>{
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean isValid(String phone, ConstraintValidatorContext context){
        if(phone == null || phone.isBlank())
            return true;

        //check whether the username unique
        return !userRepository.existsByPhone(phone);
    }
}