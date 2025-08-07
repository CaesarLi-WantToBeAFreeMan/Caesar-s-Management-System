package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidPassword;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValidPasswordValidator implements ConstraintValidator <ValidPassword, String>{

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context){
        if(password == null)
            return false;

        if(password.length() < 9 || password.length() > 72)
            return false;

        if(!password.matches("^[\\x21-\\x7E]+$"))
            return false;
        return  password.matches(".*[a-z].*") &&
                password.matches(".*[A-Z].*") &&
                password.matches(".*\\d.*") &&
                password.matches(".*[^a-zA-Z0-9].*");
    }
}