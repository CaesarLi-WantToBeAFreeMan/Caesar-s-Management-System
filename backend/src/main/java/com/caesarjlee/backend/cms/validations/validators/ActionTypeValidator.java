package com.caesarjlee.backend.cms.validations.validators;

import jakarta.validation.ConstraintValidator;
import com.caesarjlee.backend.cms.models.enumerations.ActionType;
import com.caesarjlee.backend.cms.validations.annotations.ValidActionType;
import jakarta.validation.ConstraintValidatorContext;

public class CurrencyValidator implements ConstraintValidator <ValidActionType, ActionType>{
    @Override
    public boolean isValid(ActionType actionType, ConstraintValidatorContext constraintValidatorContext){
        if(actionType == null)
            return false;
        try{
            ActionType.valueOf(actionType.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}