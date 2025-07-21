package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.RequestStatus;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestStatus;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class RequestStatusValidator implements ConstraintValidator <ValidRequestStatus, RequestStatus> {
    @Override
    public boolean isValid(RequestStatus requestStatus, ConstraintValidatorContext constraintValidatorContext){
        if(requestStatus == null)
            return false;
        try{
            RequestStatus.valueOf(requestStatus.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}