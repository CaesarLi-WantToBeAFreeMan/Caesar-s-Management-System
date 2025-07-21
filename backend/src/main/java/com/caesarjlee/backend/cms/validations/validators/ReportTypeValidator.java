package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.Currency;
import com.caesarjlee.backend.cms.models.enumerations.ReportType;
import com.caesarjlee.backend.cms.validations.annotations.ValidCurrency;
import com.caesarjlee.backend.cms.validations.annotations.ValidReportType;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ReportTypeValidator implements ConstraintValidator <ValidReportType, ReportType> {
    @Override
    public boolean isValid(ReportType reportType, ConstraintValidatorContext constraintValidatorContext){
        if(reportType == null)
            return false;
        try{
            ReportType.valueOf(reportType.name());
            return true;
        }catch(IllegalArgumentException e){
            return false;
        }
    }
}