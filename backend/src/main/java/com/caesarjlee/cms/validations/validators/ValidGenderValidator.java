package com.caesarjlee.cms.validations.validators;

import com.caesarjlee.cms.repositories.GenderRepository;
import com.caesarjlee.cms.validations.ValidGender;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

public class ValidGenderValidator implements ConstraintValidator <ValidGender, Integer>{
    @Autowired
    private GenderRepository genderRepository;

    @Override
    public boolean isValid(Integer genderId, ConstraintValidatorContext context){
        if(genderId == null)
            return false;

        return genderRepository.existsById(genderId);
    }
}