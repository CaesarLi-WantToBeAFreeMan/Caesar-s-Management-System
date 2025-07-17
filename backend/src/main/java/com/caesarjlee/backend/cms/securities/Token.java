package com.caesarjlee.backend.cms.securities;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Getter;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;

public class Token{
    @Getter
    private final String token;

    private Token(String token){
        this.token = token;
    }

    public static Token of(Long userId, Long validationDurationInMinute, String secureKey){
        Instant now = Instant.now();
        return new Token(
                Jwts    .builder()
                        .claim("user_id", userId)
                        .setIssuedAt(Date.from(now))
                        .setExpiration(Date.from(now.plus(validationDurationInMinute, ChronoUnit.MINUTES)))
                        .signWith(
                            SignatureAlgorithm.HS256,
                            Base64.getEncoder().encodeToString(secureKey.getBytes(StandardCharsets.UTF_8))
                        )
                        .compact()
        );
    }
}