package com.caesarjlee.cms.exceptions;

public class PasswordResetException extends RuntimeException{
    public PasswordResetException(String message){
        super(message);
    }
}