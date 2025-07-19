package com.caesarjlee.backend.cms.exceptions;

import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice//mark the class as a global exception handler for all controllers
public class ValidationException{
    @ExceptionHandler(MethodArgumentNotValidException.class)//handle validation errors from @Valid...
    public ResponseEntity <Map <String, String>> handleValidationErrors(MethodArgumentNotValidException methodArgumentNotValidException){
        Map <String, String> errors = new HashMap<>();//declare a Map to store <fieldName, errorMessage>
        methodArgumentNotValidException
            .getBindingResult()
            .getFieldErrors()
            .forEach(//iterate through each error
                error -> errors.put(
                error.getField(),//put key
                error.getDefaultMessage()//put value
                )
            );
        return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);//return a `400 Bad Request` status with an errors map
    }
}