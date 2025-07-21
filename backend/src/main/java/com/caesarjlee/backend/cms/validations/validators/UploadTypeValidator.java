package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.validations.annotations.ValidUploadType;
import com.caesarjlee.backend.cms.models.enumerations.UploadType;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class UploadTypeValidator implements ConstraintValidator <ValidUploadType, UploadType>{
    @Override
    public boolean isValid(UploadType uploadType, ConstraintValidatorContext constraintValidatorContext){
        if(uploadType == null)
            return false;
        try{
            UploadType.valueOf(uploadType.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}