package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.validations.ValidVerificationCode;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.regex.Pattern;

public class ValidVerificationCodeValidator implements ConstraintValidator <ValidVerificationCode, String>{
    @Override
    public boolean isValid(String verificationCode, ConstraintValidatorContext context){
        if(verificationCode == null)
            return false;

        return Pattern.matches("^\\d{6}$", verificationCode);
    }
}