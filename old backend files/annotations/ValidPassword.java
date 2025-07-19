package com.caesarjlee.backend.cms.annotations;

import com.caesarjlee.backend.cms.validations.PasswordValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented//mark this annotation as documented, so it appears on JavaDoc
@Constraint(validatedBy = PasswordValidator.class)//link the annotation to `PasswordValidator` class, which contains validation logic
@Target({ElementType.FIELD, ElementType.PARAMETER})//specify where the annotation can be used
@Retention(RetentionPolicy.RUNTIME)//keep the annotation available at runtime for validation
public @interface ValidPassword{//define `@ValidPassword` annotation
    String message() default "invalid password";//default error message
    Class <?> [] groups() default {};//used for validation groups
    Class <? extends Payload> [] payload() default {};//used for custom payloads
}