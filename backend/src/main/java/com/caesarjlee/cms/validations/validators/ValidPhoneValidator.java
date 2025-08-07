package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidPhone;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class ValidPhoneValidator implements ConstraintValidator <ValidPhone, String>{
    @Override
    public boolean isValid(String phone, ConstraintValidatorContext context){
        if(phone == null || phone.isEmpty())
            return true;

        return Pattern.matches("^\\+[1-9]\\d{1,14}$", phone);
    }
}