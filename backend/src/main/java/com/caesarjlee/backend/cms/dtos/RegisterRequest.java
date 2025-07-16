package com.caesarjlee.backend.cms.dtos;

import com.caesarjlee.backend.cms.annotations.ValidEmail;
import com.caesarjlee.backend.cms.annotations.ValidPassword;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class RegisterRequest{
    @NotBlank(message = "first name is required")
    private String firstName;

    @NotBlank(message = "last nam is required")
    private String lastName;

    @NotBlank(message = "email is required")
    @ValidEmail
    private String email;

    @NotBlank(message = "password is required")
    @ValidPassword
    private String password;
}