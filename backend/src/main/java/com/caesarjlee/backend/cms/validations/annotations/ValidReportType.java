package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.CurrencyValidator;
import com.caesarjlee.backend.cms.validations.validators.ReportTypeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = ReportTypeValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidReportType{
    String message() default "invalid report type:\nMicrosoft Excel, Markdown, LaTeX, CSV, TSV";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}
