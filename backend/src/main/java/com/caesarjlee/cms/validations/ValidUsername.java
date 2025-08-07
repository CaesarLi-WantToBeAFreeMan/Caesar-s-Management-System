package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.ValidUsernameValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidUsernameValidator.class)
public @interface ValidUsername{
    String message() default "invalid username.\na username must contain only visible ASCII characters, and is between 3 and 5 characters long";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}