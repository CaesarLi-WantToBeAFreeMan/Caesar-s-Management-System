package com.caesarjlee.backend.cms.dataTransmitObjects;

import com.caesarjlee.backend.cms.annotations.ValidEmail;
import com.caesarjlee.backend.cms.annotations.ValidPassword;
import jakarta.validation.constraints.NotBlank;

public record LoginRequest(
        @NotBlank(message = "email is required")
        @ValidEmail
        String email,

        @NotBlank(message = "password is required")
        @ValidPassword
        String password
){}