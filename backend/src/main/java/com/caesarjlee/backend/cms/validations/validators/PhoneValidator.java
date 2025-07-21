package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.validations.annotations.ValidPhone;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator <ValidPhone, String> {
    @Override
    public boolean isValid(String phone, ConstraintValidatorContext constraintValidatorContext){
        return phone == null ? false
                             : phone.matches("^\\+[1-9]\\d{1,14}$");
    }
}