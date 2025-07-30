package com.caesarjlee.cms.configurations;

import com.caesarjlee.cms.services.CustomUserDetailsService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration{
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    /*
    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;
    */

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(
            BCryptPasswordEncoder.BCryptVersion.$2B,
            12,
            null
        );
    }

    @Bean AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception{
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
        httpSecurity
                        /*enable csrf
                        .csrf(
                            csrf -> csrf.disable()
                        )
                        */
                        .sessionManagement(
                            session -> session.sessionCreationPolicy(
                                SessionCreationPolicy.STATELESS
                            )
                        )
                        .authorizeHttpRequests(
                            auth -> auth    .requestMatchers("/api/auth/**")
                                                .permitAll()
                                            .anyRequest()
                                                .authenticated()
                            )
                        .exceptionHandling(
                            exception -> exception.authenticationEntryPoint(
                                (request, response, authException) -> {
                                    response    .setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                                    response    .setContentType("application/json");
                                    response    .getWriter()
                                                .write("{\"error\": \"Unauthorized\"}");
                                }
                            )
                        );
                        /*
                        .oauth2Login(
                            oauth2 -> oauth2.userInfoEndpoint(
                                userInfo -> userInfo.userService(customOAuth2UserService)
                            )
                        );
                        */
        return httpSecurity.build();
    }
}