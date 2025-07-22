package com.caesarjlee.backend.cms.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class PasswordService{
    private static final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(BCryptPasswordEncoder.BCryptVersion.$2B, 12);

    public String encode(String rawPassword){
        if(rawPassword == null)
            throw new IllegalArgumentException("password is null");
        return bCryptPasswordEncoder.encode(calculate(rawPassword));
    }

    public boolean verify(String rawPassword, String encodedPassword){
        if(rawPassword == null)
            throw new IllegalArgumentException("password is null");
        else if(encodedPassword == null)
            throw new IllegalArgumentException("stored password was broken");
        return bCryptPasswordEncoder.matches(calculate(rawPassword), encodedPassword);
    }

    private String calculate(String rawPassword){
        BigDecimal value = BigDecimal.ONE;
        for(char x : rawPassword.toCharArray())
            value = value.multiply(
                BigDecimal.valueOf(
                    Math.sin(
                        Math.pow(Math.E, x + 3)
                    ) * Math.cos(
                        Math.pow(Math.E, 256 - x - 3)
                    ) * 120
                    * Math.PI
                )
            );
        return value.toEngineeringString();
    }
}