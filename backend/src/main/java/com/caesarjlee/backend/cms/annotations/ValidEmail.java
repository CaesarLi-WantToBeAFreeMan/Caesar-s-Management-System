package com.caesarjlee.backend.cms.annotations;

import com.caesarjlee.backend.cms.validations.EmailValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Constraint(validatedBy = EmailValidator.class)
@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidEmail{
    String message() default "invalid email";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}