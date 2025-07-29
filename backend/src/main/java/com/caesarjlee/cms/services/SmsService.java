package com.caesarjlee.cms.services;

import org.springframework.stereotype.Service;

@Service
public class SmsService{
    public void sendSms(String phone, String message){
        System.out.println("SMS sending test");
        System.out.println("sending SMS to " + phone + ": " + message);
    }
}