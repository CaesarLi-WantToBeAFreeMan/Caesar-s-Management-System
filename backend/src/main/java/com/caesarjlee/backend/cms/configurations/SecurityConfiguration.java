package com.caesarjlee.backend.cms.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration//mark the class as a configurer
public class SecurityConfiguration{
    @Bean//define a bean of SecurityFilterChain
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{

        //disable CSRF (pronouncement: sea-surf, abbreviation for Cross-Site Request Forgery)
        //happends where unauthorizd commands are submitted from a user that the web trusts
        httpSecurity.csrf().disable();

        //define authorization rules
        httpSecurity.authorizeHttpRequests(
            authorizationManagerRequestMatcherRegistry -> authorizationManagerRequestMatcherRegistry
                .anyRequest()//match all requests
                .permitAll()//allow them without authentication
        );
        return httpSecurity.build();
    }
}