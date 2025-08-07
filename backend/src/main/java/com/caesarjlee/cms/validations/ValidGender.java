package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.ValidGenderValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidGenderValidator.class)
public @interface ValidGender{
    String message() default "invalid gender";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}