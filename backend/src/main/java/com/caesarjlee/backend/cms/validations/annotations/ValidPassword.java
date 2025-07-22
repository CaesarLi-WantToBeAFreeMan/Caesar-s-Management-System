package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.PasswordValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = PasswordValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidPassword{
    String message() default "invalid password\nformat:\nlength: [9, 255]\nat least contains: one lowercase, one uppercase, one digit and one special character: \"~!@#$%^&*()-=_+[]\\{}|;':\",./<>? \"";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}