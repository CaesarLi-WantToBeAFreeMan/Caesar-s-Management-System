package com.caesarjlee.backend.cms.validations;

import com.caesarjlee.backend.cms.annotations.ValidPassword;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator <ValidPassword, String>{
    @Override
    public boolean isValid(String password, ConstraintValidatorContext constraintValidatorContext) {
        //length
        if(password.length() < 9 || password.length() > 255){
            setMessage(constraintValidatorContext, "password length must be in the interval [9, 255] characters");
            return false;
        }

        //ASCII
        if(!password.matches("^[\\x00-\\x7F]*$")){
            setMessage(constraintValidatorContext, "password must contain only ASCII charactors");
            return false;
        }

        //lowercase
        if(!password.matches(".*[a-z].*")){
            setMessage(constraintValidatorContext, "password must contain at least one lowercase letter");
            return false;
        }

        //uppercase
        if(!password.matches(".*[A-Z].*")){
            setMessage(constraintValidatorContext, "password must contain at least one uppercase letter");
            return false;
        }

        //digit
        if(!password.matches(".*\\d.*")){
            setMessage(constraintValidatorContext, "password must contain at least one digit");
            return false;
        }

        //special symbol
        if(!password.matches(".*[!@#$%^&*(),.?\":{}|<>_\\-\\\\\\/$$  $$;'`~+=].*")){
            setMessage(constraintValidatorContext, "password must contain at least one symbol");
            return false;
        }

        return true;
    }

    private void setMessage(ConstraintValidatorContext constraintValidatorContext, String message){
        constraintValidatorContext.disableDefaultConstraintViolation();
        constraintValidatorContext.buildConstraintViolationWithTemplate(message).addConstraintViolation();
    }
}