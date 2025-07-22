package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.Nationality;
import com.caesarjlee.backend.cms.validations.annotations.ValidNationality;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class NationalityValidator implements ConstraintValidator <ValidNationality, Nationality>{
    @Override
    public boolean isValid(Nationality nationality, ConstraintValidatorContext constraintValidatorContext){
        return nationality == null || Nationality.valueOf(nationality.name()) != null;
    }
}