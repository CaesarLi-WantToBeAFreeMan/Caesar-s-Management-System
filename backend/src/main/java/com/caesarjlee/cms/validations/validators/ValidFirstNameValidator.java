package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidFirstName;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class ValidFirstNameValidator implements ConstraintValidator <ValidFirstName, String>{
    @Override
    public boolean isValid(String firstName, ConstraintValidatorContext context){
        if(firstName == null)
            return false;

        return Pattern.matches("^[A-Za-z' ]{3,50}$", firstName);
    }
}