package com.caesarjlee.cms.exceptions;

import com.caesarjlee.cms.data_transfer_objects.AuthenticationResponseDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler{
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(RegisterException.class)
    public ResponseEntity <AuthenticationResponseDto> handleRegisterException(RegisterException registerException){
        logger.error("register error: {}", registerException.getMessage());
        return ResponseEntity   .badRequest()
                                .body(
                                    new AuthenticationResponseDto(
                                        null,
                                        registerException.getMessage()
                                    )
                                );
    }
    @ExceptionHandler(LoginException.class)
    public ResponseEntity <AuthenticationResponseDto> handleLoginException(LoginException loginException){
        logger.error("login error: {}", loginException.getMessage());
        return ResponseEntity   .badRequest()
                                .body(
                                    new AuthenticationResponseDto(
                                        null,
                                        loginException.getMessage()
                                    )
                                );
    }

    @ExceptionHandler(PasswordResetException.class)
    public ResponseEntity <AuthenticationResponseDto> handlePasswordException(PasswordResetException passwordResetException){
        logger.error("password reset error: {}", passwordResetException.getMessage());
        return ResponseEntity   .badRequest()
                                .body(
                                    new AuthenticationResponseDto(
                                        null,
                                        passwordResetException.getMessage()
                                    )
                                );
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity <AuthenticationResponseDto> handleGeneralException(Exception exception){
        logger.error("unexpected error: {}", exception.getMessage(), exception);
        return ResponseEntity   .status(HttpStatus.INTERNAL_SERVER_ERROR)
                                .body(
                                    new AuthenticationResponseDto(
                                        null,
                                        "an unexpected error occurred"
                                    )
                                );
    }
}