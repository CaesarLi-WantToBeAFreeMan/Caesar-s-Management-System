package com.caesarjlee.cms.securities;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter{
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);
    private final String secret;
    private final UserDetailsService userDetailsService;
    private static final AntPathMatcher antPathMatcher = new AntPathMatcher();
    @Autowired
    private RedisTemplate <String, String> redisTemplate;

    public JwtAuthenticationFilter(
            @Value("${jwt.secret}")
            String secret,
            UserDetailsService userDetailsService
    ){
        this.secret = secret;
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void doFilterInternal(
        HttpServletRequest request,
        HttpServletResponse response,
        FilterChain chain
    ) throws ServletException, IOException{
        if(antPathMatcher.match("/api/auth/**", request.getRequestURI())){
            chain.doFilter(request, response);
            return;
        }
        String  token = null,
                header = request.getHeader("Authorization");
        if(header != null && header.startsWith("Bearer "))
            token = header.substring(7);
        else{
            Cookie [] cookies = request.getCookies();
            if(cookies != null)
                for(Cookie cookie : cookies)
                    if("jwt".equals(cookie.getName())){
                        token = cookie.getValue();
                        break;
                    }
        }

        if(token == null){
            chain.doFilter(request, response);
            return;
        }

        if(token != null && redisTemplate.opsForValue().get("blacklist:" + token) != null){
            logger.error("token has been revoked");
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "revoked token");
            return;
        }

        try{
            Claims claims = Jwts    .parserBuilder()
                                    .setSigningKey(secret.getBytes())
                                    .build()
                                    .parseClaimsJws(token)
                                    .getBody();
            String username = claims.getSubject();
            if(username != null && SecurityContextHolder.getContext().getAuthentication() == null){
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                    new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                    );
                usernamePasswordAuthenticationToken.setDetails(
                    new WebAuthenticationDetailsSource().buildDetails(request)
                );
                SecurityContextHolder   .getContext()
                                        .setAuthentication(usernamePasswordAuthenticationToken);
            }
        }catch(Exception e){
            logger.error("JWT authentication failed: {}", e.getMessage());
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "invalid or expired token");
            return;
        }
        chain.doFilter(request, response);
    }
}