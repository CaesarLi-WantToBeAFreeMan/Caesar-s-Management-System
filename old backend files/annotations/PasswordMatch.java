package com.caesarjlee.backend.cms.annotations;

import com.caesarjlee.backend.cms.validations.PasswordMatchValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Constraint(validatedBy = PasswordMatchValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface PasswordMatch{
    String message() default "password confirmation failure";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}