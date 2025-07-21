package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.validations.annotations.ValidPassword;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator <ValidPassword, String> {
    @Override
    public boolean isValid(String password, ConstraintValidatorContext constraintValidatorContext){
        return password == null ? false
                                : password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[~!@#$%^&*()\\-=_+\\[\\]\\\\{}|;':\",./<>?])[A-Za-z\\d~!@#$%^&*()\\-=_+\\[\\]\\\\{}|;':\",./<>?]{9,255}$\n");
    }
}