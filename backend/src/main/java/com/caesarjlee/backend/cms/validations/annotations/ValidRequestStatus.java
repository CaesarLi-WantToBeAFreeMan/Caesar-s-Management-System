package com.caesarjlee.backend.cms.validations.annotations;


import com.caesarjlee.backend.cms.validations.validators.CurrencyValidator;
import com.caesarjlee.backend.cms.validations.validators.RequestStatusValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = RequestStatusValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidRequestStatus{
    String message() default "invalid request status:\npending, approved, rejected";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}
