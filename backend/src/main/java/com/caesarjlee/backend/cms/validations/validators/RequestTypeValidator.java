package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.RequestType;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestType;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RequestTypeValidator implements ConstraintValidator <ValidRequestType, RequestType>{
    @Override
    public boolean isValid(RequestType requestType, ConstraintValidatorContext constraintValidatorContext){
        if(requestType == null)
            return false;
        try{
            RequestType.valueOf(requestType.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}