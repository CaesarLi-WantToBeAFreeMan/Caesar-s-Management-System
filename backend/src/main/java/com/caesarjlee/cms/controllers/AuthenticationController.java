package com.caesarjlee.cms.controllers;

import com.caesarjlee.cms.data_transfer_objects.*;
import com.caesarjlee.cms.services.AuthenticationService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthenticationController{
    @Autowired
    private AuthenticationService authenticationService;

    //register
    @PostMapping("/register")
    public ResponseEntity <AuthenticationResponseDto> register(
        @Valid @RequestBody
        RegisterRequestDto request
    ){
        return ResponseEntity.ok(authenticationService.register(request));
    }

    //login
    @PostMapping("/login")
    public ResponseEntity <AuthenticationResponseDto> login(
        @Valid @RequestBody
        LoginRequestDto request,
        HttpServletResponse response
    ){
        AuthenticationResponseDto authenticationResponseDto = authenticationService.login(request);
        if(authenticationResponseDto.token() != null){
            Cookie cookie = new Cookie("jwt", authenticationResponseDto.token());
            cookie.setHttpOnly(true);
            cookie.setSecure(false);//set true for HTTPS
            cookie.setPath("/token");
            cookie.setMaxAge(12 * 60 * 60);//12 hours in seconds
            response.addCookie(cookie);
        }
        return ResponseEntity.ok(authenticationResponseDto);
    }

    //logout
    @PostMapping("/logout")
    public ResponseEntity <AuthenticationResponseDto> logout(
        @CookieValue(value = "jwt", required = false)
        String jwt,
        HttpServletResponse response
    ){
        if(jwt != null)
            authenticationService.logout(jwt);
        Cookie cookie = new Cookie("jwt", null);
        cookie.setHttpOnly(true);
        cookie.setPath("/token");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return ResponseEntity.ok(
            new AuthenticationResponseDto(
                null,
                "logout successfully"
            )
        );
    }

    //reset password using email code
    @PostMapping("/reset-password-email")
    public ResponseEntity <AuthenticationResponseDto> resetPasswordByEmail(
        @Valid @RequestBody
        ResetPasswordByEmailRequestDto request
    ){
        return ResponseEntity.ok(authenticationService.requestPasswordReset(request.email()));
    }

    //verify reset verification code
    @PostMapping("/verify-reset-code")
    public ResponseEntity <AuthenticationResponseDto> validateResetCode(
        @Valid @RequestBody
        ResetPasswordRequestDto request
    ){
        return ResponseEntity.ok(authenticationService.verifyThenResetPassword(request));
    }

    //reset password using SMS code
    @PostMapping("/reset-password-phone")
    public ResponseEntity <AuthenticationResponseDto> resetPasswordByPhone(
        @RequestParam
        String phone,
        @Valid @RequestBody ResetPasswordRequestDto request
    ){
        return ResponseEntity.ok(authenticationService.requestPasswordReset(phone));
    }
}