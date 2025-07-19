package com.caesarjlee.backend.cms.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration//mark the class as a configurer
public class SecurityConfiguration{
    @Bean//define a bean (object) that configures security rules
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
        //disable CSRF (pronouncement: sea-surf, abbreviation for Cross-Site Request Forgery)
        //CSRF is an attack where unauthorized commands are sent from a trusted user
        httpSecurity.csrf().disable();//disable it just for development simplicity, while an application that often not need token-based authentication

        //define rules which requests need authentication
        httpSecurity.authorizeHttpRequests(
            authorizationManagerRequestMatcherRegistry -> authorizationManagerRequestMatcherRegistry
                .anyRequest()//match all requests
                .permitAll()//allow them without requiring login
        );
        return httpSecurity.build();//build then return the security configuration
    }
}