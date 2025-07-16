package com.caesarjlee.backend.cms.validations;

import com.caesarjlee.backend.cms.annotations.ValidEmail;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class EmailValidator implements ConstraintValidator <ValidEmail, String>{
    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext){
        if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")){
            setMessage(constraintValidatorContext, "email format is invalid");
            return false;
        }

        return true;
    }

    private void setMessage(ConstraintValidatorContext constraintValidatorContext, String message){
        constraintValidatorContext.disableDefaultConstraintViolation();
        constraintValidatorContext.buildConstraintViolationWithTemplate(message).addConstraintViolation();
    }
}