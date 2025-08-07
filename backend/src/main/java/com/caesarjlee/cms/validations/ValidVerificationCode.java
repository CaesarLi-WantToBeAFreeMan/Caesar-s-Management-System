package com.caesarjlee.cms.validations;

import com.caesarjlee.cms.validations.validators.UniqueEmailValidator;
import com.caesarjlee.cms.validations.validators.ValidVerificationCodeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ValidVerificationCodeValidator.class)
public @interface ValidVerificationCode{
    String message() default "invalid verification code format";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}