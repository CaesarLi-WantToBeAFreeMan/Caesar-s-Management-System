package com.caesarjlee.backend.cms.validations.annotations;

import com.caesarjlee.backend.cms.validations.validators.ActionTypeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = ActionTypeValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidActionType{
    String message() default "invalid action type:\nregister, login, logout, reset-password, update-info, view-info, report-data, load-data, create-department, update-department, delete-department, create-role, update-role, delete-role, update-user, delete-user, create-skill, update-skill, delete-skill, send-request, view-request, approve-request, reject-request, send-message, view-message";
    Class <?> [] groups() default {};
    Class <? extends Payload> [] payload() default {};
}
