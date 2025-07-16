package com.caesarjlee.backend.cms.exceptions;

import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class ValidationException{
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity <Map <String, String>> handleValidationErrors(MethodArgumentNotValidException methodArgumentNotValidException){
        Map <String, String> errors = new HashMap<>();
        methodArgumentNotValidException
            .getBindingResult()
            .getFieldErrors()
            .forEach(
                error -> errors.put(
                error.getField(),
                error.getDefaultMessage()
                )
            );
        return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);
    }
}