package com.caesarjlee.cms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class PasswordResetService{
    @Autowired
    private RedisTemplate <String, String> redisTemplate;

    @Autowired
    private EmailService emailService;

    @Autowired
    private SmsService smsService;

    public void sendPasswordResetCode(String emailOrPhone){
        String code = generateRandomCode();
        if (emailOrPhone.contains("@"))
            emailService.sendEmail(
                emailOrPhone,
                "Caesar's Management System Password Reset Code",
                "Your Password Reset Code:\n" +
                code +
                "\nthis code is valid within 12 minutes!"
            );
        else
            smsService.sendSms(
                emailOrPhone,
                "Your Password Reset Code:\n" +
                code +
                "\nthis code is valid within 12 minutes!"
            );
        redisTemplate   .opsForValue()
                        .set(emailOrPhone, code, 12, TimeUnit.MINUTES);
    }

    public boolean validateResetCode(String emailOrPhone, String code){
        return  code != null &&
                code.equals(
                    redisTemplate   .opsForValue()
                                    .get(emailOrPhone)
                );
    }

    private String generateRandomCode(){
        //6 digit code
        return String.valueOf((int)(Math.random() * 900_000) + 100_000);
    }
}