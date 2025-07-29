package com.caesarjlee.cms.controllers;

import com.caesarjlee.cms.data_transfer_objects.PasswordResetDto;
import com.caesarjlee.cms.services.PasswordResetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/password-reset")
public class PasswordResetController{
    @Autowired
    private PasswordResetService  passwordResetService;

    @PostMapping("/request")
    public ResponseEntity <String> requestPasswordReset(@RequestBody String emailOrPhone){
        passwordResetService.sendPasswordResetCode(emailOrPhone);
        return ResponseEntity.ok(
            "reset code sent\n" +
            "please enter the reset code within 12 minutes"
        );
    }

    @PostMapping("/validate")
    public ResponseEntity <String> validatePasswordResetCode(@RequestBody PasswordResetDto passwordResetDto){
        return passwordResetService.validateResetCode(
            passwordResetDto.emailOrPhone(),
            passwordResetDto.code()
        )   ? ResponseEntity    .ok("password reset code validated")
            : ResponseEntity    .badRequest()
                                .body("invalid password reset code");
    }
}