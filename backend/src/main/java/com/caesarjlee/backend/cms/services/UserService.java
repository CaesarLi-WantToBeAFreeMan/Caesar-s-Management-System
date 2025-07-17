package com.caesarjlee.backend.cms.services;

import com.caesarjlee.backend.cms.dataTransmitObjects.LoginRequest;
import com.caesarjlee.backend.cms.dataTransmitObjects.RegisterRequest;
import com.caesarjlee.backend.cms.dataTransmitObjects.TestUserResponse;
import com.caesarjlee.backend.cms.dataTransmitObjects.UserResponse;
import com.caesarjlee.backend.cms.exceptions.LoginException;
import com.caesarjlee.backend.cms.exceptions.RegisterException;
import com.caesarjlee.backend.cms.models.User;
import com.caesarjlee.backend.cms.repositories.UserRepository;
import com.caesarjlee.backend.cms.securities.Token;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service//mark the class as Spring Service
public class UserService{
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder){//constructor to inject `userRepository` and `passwordEncoder`, an example of DI (Dependency Injection
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    //BindingResult captures any errors

    public List <TestUserResponse> readAllUsers(){
        return StreamSupport    .stream(
                                    userRepository  .findAll()
                                                    .spliterator(),
                                    false
                                )
                                .map(user -> new TestUserResponse(
                                    user.getId(),
                                    user.getFirstName(),
                                    user.getLastName(),
                                    user.getEmail(),
                                    user.getPassword()
                                ))
                                .collect(Collectors.toList());
    }

    public ResponseEntity <?> register(RegisterRequest registerRequest, BindingResult bindingResult){
        //check if email already exists
        if(userRepository.existsByEmail(registerRequest.email()))
            throw new RegisterException("❌email exists❌");

        //convert a DTO to an Entity
        User user = User.of(
                registerRequest.firstName(),
                registerRequest.lastName(),
                registerRequest.email(),
                passwordEncoder.encode( registerRequest.password())
        ),
                registeredUser = userRepository.save(user);//save the entity, using `INSERT` SQl command

        return ResponseEntity   .status(HttpStatus.CREATED)//return a `201 Created` status
                .body(new UserResponse(
                        registeredUser.getId(),
                        registeredUser.getFirstName(),
                        registeredUser.getLastName(),
                        registeredUser.getEmail(),
                        "✔registered successfully✔"
                ));//return a response body contains id, firstName, lastname, email, and an error message
    }

    public Token login(@Valid LoginRequest loginRequest){
        if(!userRepository.existsByEmail(loginRequest.email()))
            throw new LoginException("❌email does not exist❌");
        User user = userRepository.findByEmail(loginRequest.email());
        if(!passwordEncoder.matches(loginRequest.password(), user.getPassword()))
            throw new LoginException("❌password mismatch❌");
        return Token.of(
            user.getId(),
            12L,
            "**Fuck** `Java`\n" +
                    "`Java` is so fucking **verbose** and **stiff**\n" +
                    "`C++` is **better** than `Java` without any doubt!!!"
        );
    }
}