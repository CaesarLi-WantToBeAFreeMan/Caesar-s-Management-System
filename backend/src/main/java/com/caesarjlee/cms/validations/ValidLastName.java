package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.ValidLastNameValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidLastNameValidator.class)
public @interface ValidLastName{
    String message() default "invalid last name.\na last name must be 3 to 50 characters long and contain only letters, spaces, and single quotes";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}