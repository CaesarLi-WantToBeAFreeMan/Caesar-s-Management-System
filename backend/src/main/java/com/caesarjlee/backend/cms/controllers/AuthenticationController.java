package com.caesarjlee.backend.cms.controllers;

import com.caesarjlee.backend.cms.dtos.RegisterRequest;
import com.caesarjlee.backend.cms.models.User;
import com.caesarjlee.backend.cms.repositories.UserRepository;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController//mark the class as a RESTful controller that returns data(json/text, etc), instead of HTML
@RequestMapping("/api/auth")//map all request starting with `/api/auth`
public class AuthenticationController{
    private final UserRepository userRepository;

    public AuthenticationController(UserRepository userRepository){
        this.userRepository = userRepository;
    }
    @GetMapping("hello-world")//define a GET request at the path: `/api/auth/hello-world`
    public String helloWord(){
        return "Hello,World!";//return a hello world string
    }

    @PostMapping("/register")
    public ResponseEntity <String> register(@RequestBody @Valid RegisterRequest registerRequest){
        /*
        comment for now, lacking JPA
        //check if email already exists
        if(userRepository.existsByEmail(registerRequest.getEmail())){
            return ResponseEntity   .status(HttpStatus.CONFLICT)
                                    .body("❌email already exists");
        }
        */

        //convert DTO to Entity
        User user = User.of(
            registerRequest.getFirstName(),
            registerRequest.getLastName(),
            registerRequest.getEmail(),
            registerRequest.getPassword()
        );
        userRepository.save(user);

        return ResponseEntity   .status(HttpStatus.CREATED)
                                .body("✔registered successfully✔");
    }
}