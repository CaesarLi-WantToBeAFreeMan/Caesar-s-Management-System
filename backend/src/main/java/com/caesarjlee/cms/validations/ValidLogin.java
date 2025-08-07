package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.ValidLoginValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidLoginValidator.class)
public @interface ValidLogin{
    String message() default "invalid login.\na login must be a valid email, E.164 phone number, or username ([3, 50] letters, spaces and single quotes)";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}