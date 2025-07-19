package com.caesarjlee.backend.cms.controllers;

import com.caesarjlee.backend.cms.dataTransmitObjects.LoginRequest;
import com.caesarjlee.backend.cms.dataTransmitObjects.RegisterRequest;
import com.caesarjlee.backend.cms.dataTransmitObjects.TestUserResponse;

import com.caesarjlee.backend.cms.securities.Token;
import com.caesarjlee.backend.cms.services.UserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController//mark the class as a REST controller that returns json/text response
@RequestMapping("/api/auth")//map all request starting with `/api/auth`
public class AuthenticationController{
    private final UserService userService;

    public AuthenticationController(UserService userService){//constructor to inject `userRepository`, an example of DI (Dependency Injection
        this.userService = userService;
    }

    @GetMapping("hello-world")//handle GET request
    public String helloWord(){
        return "Hello,World!";//return a simple "hello,world!" string response
    }

    @PostMapping("/register")//handle POST request

    //@Valid triggers validation of `RegisterRequest`
    public ResponseEntity <?> register(@Valid @RequestBody RegisterRequest registerRequest, BindingResult bindingResult){
        return userService.register(registerRequest, bindingResult);
    }

    @PostMapping("/login")
    public Token login(@Valid @RequestBody LoginRequest loginRequest){
        return userService.login(loginRequest);
    }

    @GetMapping("/read")
    public List <TestUserResponse> readAll(){
        return userService.readAllUsers();
    }
}