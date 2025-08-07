package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidLogin;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class ValidLoginValidator implements ConstraintValidator <ValidLogin, String>{
    @Override
    public boolean isValid(String login, ConstraintValidatorContext constraintValidatorContext){
        if(login == null || login.isEmpty())
            return false;
        return  Pattern.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$", login) ||
                Pattern.matches("^\\+[1-9]\\d{1,14}$", login) ||
                Pattern.matches("^[A-Za-z' ]{3,50}$", login);
    }
}