package com.caesarjlee.cms.configurations;

import com.caesarjlee.cms.services.CustomOAuth2UserService;
import com.caesarjlee.cms.services.CustomUserDetailsService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration{
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(
            BCryptPasswordEncoder.BCryptVersion.$2B,
            12,
            null
        );
    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(customUserDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        return daoAuthenticationProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception{
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
        httpSecurity    .csrf(
                            csrf -> csrf.disable()
                        )
                        .authorizeHttpRequests(
                            auth ->
                                auth.requestMatchers("/password-reset/**")
                                        .permitAll()
                                    .requestMatchers("/employees/**")
                                        .authenticated()
                                    .anyRequest()
                                        .permitAll()
                            )
                        .formLogin(form -> form.permitAll())
                        .logout(logout -> logout.permitAll());
                        /*
                        .oauth2Login(
                            oauth2 -> oauth2.userInfoEndpoint(
                                userInfo -> userInfo.userService(customOAuth2UserService)
                            )
                        );
                        */
        httpSecurity.authenticationProvider(daoAuthenticationProvider());
        return httpSecurity.build();
    }
}