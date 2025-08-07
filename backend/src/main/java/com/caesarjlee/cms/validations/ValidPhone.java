package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.ValidLastNameValidator;
import com.caesarjlee.cms.validations.validators.ValidPhoneValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidPhoneValidator.class)
public @interface ValidPhone{
    String message() default "invalid E.164 phone number.\nan E.164 phone number must start with a '+' sign, the first digit must be non-zero, and the total length must be 2 and 15 digits";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}