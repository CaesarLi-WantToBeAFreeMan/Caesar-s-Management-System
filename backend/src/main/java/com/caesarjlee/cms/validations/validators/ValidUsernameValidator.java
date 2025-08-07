package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidUsername;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class ValidUsernameValidator implements ConstraintValidator <ValidUsername, String>{
    @Override
    public boolean isValid(String username, ConstraintValidatorContext context){
        if(username == null)
            return false;
        //the regular expression checks whether the username contains only visible ASCII characters and is between 3 and 50 characters long
        return Pattern.matches("^[\\x21-\\x7E]{3,50}$", username);
    }
}