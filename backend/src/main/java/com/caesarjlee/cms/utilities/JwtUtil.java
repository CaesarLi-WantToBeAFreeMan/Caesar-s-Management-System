package com.caesarjlee.cms.utilities;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtUtil{
    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.expiration")
    private Long expiration;

    public String generateToken(UserDetails userDetails){
        return createToken(
            (Map <String, Object>)new HashMap <String, Object>(),
            userDetails.getUsername()
        );
    }

    private String createToken(Map <String, Object> claims, String subject){
        return Jwts .builder()
                    .setClaims(claims)
                    .setSubject(subject)
                    .setIssuedAt(new Date(System.currentTimeMillis()))
                    .setExpiration(new Date(System.currentTimeMillis() + expiration))
                    .signWith(SignatureAlgorithm.ES512, secret)
                    .compact();
    }

    public String extractUsername(String token){
        return extractAllClaims(token).getSubject();
    }

    public Claims extractAllClaims(String token){
        return Jwts .parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
    }

    public boolean validateToken(String token, UserDetails userDetails){
        String username = extractUsername(token);
        return (username.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }

    private boolean isTokenExpired(String token){
        return extractAllClaims(token)  .getExpiration()
                                        .before(new Date());
    }
}