package com.caesarjlee.backend.cms.validations;

import com.caesarjlee.backend.cms.annotations.PasswordMatch;
import com.caesarjlee.backend.cms.dataTransmitObjects.RegisterRequest;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordMatchValidator implements ConstraintValidator <PasswordMatch, RegisterRequest>{
    @Override
    public boolean isValid(RegisterRequest registerRequest, ConstraintValidatorContext constraintValidatorContext){
        if(registerRequest.password() == null || !registerRequest.password().equals(registerRequest.passwordConfirm())){
            constraintValidatorContext.disableDefaultConstraintViolation();
            constraintValidatorContext.buildConstraintViolationWithTemplate("password confirmation is failed")
                    .addPropertyNode("passwordConfirm")
                    .addConstraintViolation();
            return false;
        }
        return true;
    }
}