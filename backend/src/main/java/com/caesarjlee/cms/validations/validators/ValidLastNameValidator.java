package com.caesarjlee.cms.validations.validators;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import com.caesarjlee.cms.validations.ValidLastName;

import java.util.regex.Pattern;

public class ValidLastNameValidator implements ConstraintValidator <ValidLastName, String>{
    @Override
    public boolean isValid(String lastName, ConstraintValidatorContext context){
        if(lastName == null)
            return false;

        return Pattern.matches("^[A-Za-z' ]{3,50}$", lastName);
    }
}