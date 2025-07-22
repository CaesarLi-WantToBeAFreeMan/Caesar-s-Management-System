package com.caesarjlee.backend.cms.validations.validators;

import com.caesarjlee.backend.cms.models.enumerations.Language;
import com.caesarjlee.backend.cms.validations.annotations.ValidLanguage;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class LanguageValidator implements ConstraintValidator <ValidLanguage, Language> {
    @Override
    public boolean isValid(Language language, ConstraintValidatorContext constraintValidatorContext){
        return language == null || Language.valueOf(language.name()) != null;
    }
}