package com.caesarjlee.cms.exceptions;

public class LoginException extends RuntimeException {
    public LoginException(String message) {
        super(message);
    }
}