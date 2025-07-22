package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.ReportType;
import com.caesarjlee.backend.cms.validations.annotations.ValidReportType;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ReportTypeValidator implements ConstraintValidator <ValidReportType, ReportType> {
    @Override
    public boolean isValid(ReportType reportType, ConstraintValidatorContext constraintValidatorContext){
        return reportType != null;
    }
}