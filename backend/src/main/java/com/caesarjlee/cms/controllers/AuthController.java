package com.caesarjlee.cms.controllers;

import com.caesarjlee.cms.data_transfer_objects.UserRegistrationDto;
import com.caesarjlee.cms.models.Role;
import com.caesarjlee.cms.repositories.RoleRepository;
import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.utilities.JwtUtil;
import jakarta.validation.Valid;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@RestController
@RequestMapping(value = "/api/auth", produces = MediaType.APPLICATION_JSON_VALUE);
public class AuthController{
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/register")
    public ResponseEntity <AuthResponseDto> register(
        @Valid
        @RequestBody
        UserRegistrationDto userRegistrationDto,
        @RequestHeader("X-CSRF-Token")
        String csrfToken
    ){
        //password mismatch
        if(!userRegistrationDto.password().equals(userRegistrationDto.password()))
            return ResponseEntity.badRequest()
                .body(
                    new AuthResponseDto(null, "password mismatch")
                );

        //username already exists
        if(userRepository.findByUsernameOrEmailOrPhone(userRegistrationDto.username()).isPresent())
            return ResponseEntity.badRequest()
                .body(
                    new AuthResponseDto(
                        null,
                        "username already exists"
                    )
                );

        //email already exists
        if(userRepository.findByUsernameOrEmailOrPhone(userRegistrationDto.email()).isPresent())
            return ResponseEntity.badRequest()
                .body(
                    new AuthResponseDto(
                        null,
                        "email already exists"
                    )
                );

        //phone already exists
        if(userRepository.findByUsernameOrEmailOrPhone(userRegistrationDto.phone()).isPresent())
            return ResponseEntity.badRequest()
                .body(
                    new AuthResponseDto(
                        null,
                        "phone already exists"
                    )
                );
        userRepository.save(
                User.of(
                        userRegistrationDto.username(),
                        userRegistrationDto.password(),
                        userRegistrationDto.firstName(),
                        userRegistrationDto.lastName(),
                        userRegistrationDto.gender() != null ? Integer.parseInt(userRegistrationDto.gender()) : null,
                        userRegistrationDto.email(),
                        userRegistrationDto.phone(),
                        userRegistrationDto.diploma() != null ? Integer.parseInt(userRegistrationDto.diploma()) : null,
                        null,
                        null,
                        roleRepository.findByName("EMPLOYEE")
                                .orElseGet(() -> null),
                        LocalDate.now(),
                        BigDecimal.ZERO,

                )
        )
    }
}