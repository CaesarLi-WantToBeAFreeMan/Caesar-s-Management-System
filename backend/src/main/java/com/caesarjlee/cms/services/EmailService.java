package com.caesarjlee.cms.services;

import org.springframework.stereotype.Service;

@Service
public class EmailService{
    public void sendEmail(String to, String subject, String body){
        System.out.println("email sending test");
        System.out.println("sending email to " + to + ": " + subject + " - " + body);
    }
}