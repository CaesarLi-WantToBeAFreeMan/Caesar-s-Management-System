package com.caesarjlee.backend.cms.validations;

import com.caesarjlee.backend.cms.annotations.ValidPassword;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

//implement validation logic for @ValidPassword
public class PasswordValidator implements ConstraintValidator <ValidPassword, String>{
    @Override
    public boolean isValid(String password, ConstraintValidatorContext constraintValidatorContext) {
        //check password length([9, 255] characters)
        if(password.length() < 9 || password.length() > 255){
            setMessage(constraintValidatorContext, "password length must be in the interval [9, 255] characters");
            return false;
        }

        //check if password contains only ASCII characters
        if(!password.matches("^[\\x00-\\x7F]*$")){
            setMessage(constraintValidatorContext, "password must contain only ASCII charactors");
            return false;
        }

        //check for at least one lowercase letter
        if(!password.matches(".*[a-z].*")){
            setMessage(constraintValidatorContext, "password must contain at least one lowercase letter");
            return false;
        }

        //check for at least one uppercase letter
        if(!password.matches(".*[A-Z].*")){
            setMessage(constraintValidatorContext, "password must contain at least one uppercase letter");
            return false;
        }

        //check for at least one digit
        if(!password.matches(".*\\d.*")){
            setMessage(constraintValidatorContext, "password must contain at least one digit");
            return false;
        }

        //check for at least one symbol
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