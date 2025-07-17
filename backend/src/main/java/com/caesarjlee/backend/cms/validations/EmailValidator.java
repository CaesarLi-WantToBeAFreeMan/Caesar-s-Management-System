package com.caesarjlee.backend.cms.validations;

import com.caesarjlee.backend.cms.annotations.ValidEmail;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

//implement validation logic for @ValidEmail
public class EmailValidator implements ConstraintValidator <ValidEmail, String>{
    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext){//check if the email is valid
        if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")){
            setMessage(constraintValidatorContext, "email format is invalid");//set a custom error message
            return false;
        }

        return true;
    }

    private void setMessage(ConstraintValidatorContext constraintValidatorContext, String message){//set a custom error message handler method for validation failures
        constraintValidatorContext.disableDefaultConstraintViolation();
        constraintValidatorContext.buildConstraintViolationWithTemplate(message).addConstraintViolation();
    }
}