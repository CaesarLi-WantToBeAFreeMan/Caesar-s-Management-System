package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.NationalityValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = NationalityValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidNationality{
    String message() default "invalid ISO 3166-1 alpha-3 nationality code";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}