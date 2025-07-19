package com.caesarjlee.backend.cms.exceptions;

public class LoginException extends RuntimeException{
    public LoginException(String message){
        super(message);
    }
}