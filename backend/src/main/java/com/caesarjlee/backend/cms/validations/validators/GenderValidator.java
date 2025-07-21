package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.Gender;
import com.caesarjlee.backend.cms.validations.annotations.ValidGender;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class GenderValidator implements ConstraintValidator <ValidGender, Gender> {
    @Override
    public boolean isValid(Gender gender, ConstraintValidatorContext constraintValidatorContext){
        if(gender == null)
            return false;
        try{
            Gender.valueOf(gender.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}
