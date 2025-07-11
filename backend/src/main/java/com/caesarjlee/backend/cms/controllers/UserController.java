package com.caesarjlee.backend.cms.controllers;

import com.caesarjlee.backend.cms.entities.UserEntity;
import com.caesarjlee.backend.cms.services.AuthorizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/user")
public class UserController{
    @Autowired
    private AuthorizationService authorizationService;

    @PostMapping("/login")
    public ResponseEntity <?> login(@RequestBody Map <String, String> requestBody){
        try{
            UserEntity user = authorizationService.login(requestBody.get("loginId"), requestBody.get("password"));
            String token = "TOKEN_" + user.getId();
            return ResponseEntity.ok(
                Map.of(
                    "token", "TOKEN_" + user.getUserId(),
                    "id", user.getId()
                )
            );
        }catch(Exception e){
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).
                   body(Map.of("error", e.getMessage()));
        }
    }
}