package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.RequestTypeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = RequestTypeValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidRequestType{
    String message() default "invalid request type:\npromotion, salary_increase, quit";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}