package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.UploadTypeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = UploadTypeValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidUploadType{
    String message() default "invalid upload type: Microsoft Excel, Markdown, LaTeX, CSV and TSV";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}