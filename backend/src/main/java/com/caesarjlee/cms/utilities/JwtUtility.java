package com.caesarjlee.cms.utilities;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
public class JwtUtility{
    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.expiration}")
    private Long expiration;

    public String generateToken(UserDetails userDetails){
        Map <String, Object> claims = new HashMap<>();
        claims  .put(
                    "role",
                    userDetails .getAuthorities()
                                .iterator()
                                .next()
                                .getAuthority()
                );
        return createToken(
            claims,
            userDetails.getUsername()
        );
    }

    public String createToken(Map <String, Object> claims, String subject){
        return Jwts .builder()
                    .setClaims(claims)
                    .setSubject(subject)
                    .setIssuedAt(new Date(System.currentTimeMillis()))
                    .setExpiration(new Date(System.currentTimeMillis() + expiration))
                    .signWith(SignatureAlgorithm.HS512, secret.getBytes())
                    .compact();
    }

    public Claims extractAllClaims(String token){
        return Jwts .parserBuilder()
                    .setSigningKey(secret.getBytes())
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
    }

    public String extractUsername(String token){
        return extractAllClaims(token).getSubject();
    }
}