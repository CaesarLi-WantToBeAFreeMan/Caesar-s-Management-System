package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.Currency;
import com.caesarjlee.backend.cms.validations.annotations.ValidCurrency;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class CurrencyValidator implements ConstraintValidator <ValidCurrency, Currency> {
    @Override
    public boolean isValid(Currency currency, ConstraintValidatorContext constraintValidatorContext){
        if(currency == null)
            return false;
        try{
            Currency.valueOf(currency.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}